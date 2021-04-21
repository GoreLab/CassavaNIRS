# Subsampling Functions

# Jenna Hershberger
# jmh579@cornell.edu
# 5/27/2020
# Modified 11/5/2020

library(tidyverse)
library(waves)

sample_nmax_agg <- function(data, nmax, seed){
  # For given maximum number of samples (nmax), get a subsample of rows from a data.frame (data)
  # If nmax > nrow(data), return full data.frame
  set.seed(seed)
  sz <- ifelse(nrow(data) < nmax, nrow(data), nmax)
  idx <- sample(x = 1:nrow(data), size = sz, replace = F)
  data.mean <- data %>% dplyr::slice(.data = ., idx) %>% summarize_all(~ mean(.))
  return(data.mean)
}

get_aggregated_combo <- function(trial.df, max.nsamp, seed, grouping.colnames){
  set.seed(seed)
  agg.combo.out <- trial.df %>%
    group_by_at(grouping.colnames) %>%
    nest() %>%
    mutate(samp = pmap(list(data, max.nsamp, seed), sample_nmax_agg)) %>%
    dplyr::select(all_of(grouping.colnames), samp) %>%
    unnest(cols = c(samp)) %>% ungroup()
  return(agg.combo.out)
}

create_sub_subsamples <- function(trial.df, grouping.colnames, nmax, niter = 10){
  # trial.df has columns "plotNumber", "max_nsamp"
  nmax.master.list <- list()
  for(idx in 1:nmax){ # number of subsamples
    print(paste0("Number of subsamples: ", idx))
    nmax.i.list <- list()
    if(idx == nmax){ # only one iteration so skip jdx loop
      print("Iteration: 1")
      nmax.i.list[[1]] <- get_aggregated_combo(trial.df = trial.df, max.nsamp = idx,
                                               seed = 1, grouping.colnames = grouping.colnames) %>%
        mutate(nsamp = nmax) %>% dplyr::select(grouping.colnames, nsamp, everything())

    } else{ # number of subsamples < maximum
      for(jdx in 1:niter){
        print(paste0("Iteration: ", jdx))
        nmax.i.list[[jdx]] <- get_aggregated_combo(trial.df = trial.df, max.nsamp = idx,
                                                   seed = jdx, grouping.colnames = grouping.colnames) %>%
          mutate(nsamp = idx) %>% dplyr::select(all_of(grouping.colnames), nsamp, everything())
        }
      } # end niter loop
    nmax.master.list[[idx]] <- nmax.i.list
    print(paste0("Length of nmax.master.list: ", length(nmax.master.list)))
  } # end nmax loop
  # Result should be huge list of lists with number of data.frames = niter * nmax
  return(nmax.master.list)
}

run_TestModelPerformance <- function(df.input, nsamp, niter_PLSR = 10){
  df.results <- df.input %>%
    dplyr::select(plotNumber, dry.matter.content.percentage.CO_334.0000092, starts_with("X")) %>%
    rename(unique.id = plotNumber,
           reference = dry.matter.content.percentage.CO_334.0000092) %>%
    TestModelPerformance(train.data = ., num.iterations = niter_PLSR, preprocessing = F,
                         tune.length = 15, model.method = "pls", output.summary = F,
                         wavelengths = 740:1070, cv.scheme = NULL) %>%
    mutate(number_samples = nsamp) %>%
    dplyr::select(number_samples, everything())
  return(df.results)
}

getmode <- function(vector.input){
  as.matrix(vector.input)
  unique.vector <- unique(vector.input)
  return(unique.vector[which.max(tabulate(match(vector.input,unique.vector)))])
}

