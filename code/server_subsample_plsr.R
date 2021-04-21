# Jenna Hershberger
# jmh579@cornell.edu
# 5/19/2020
# Modified 5/27/2020
# Modified 9/28/2020
# Modified 11/3/2020
# Modified 2/15/2021

library(tidyverse)
library(waves)

niter_PLSR <- 10
niter_sampling <- 50

subsample.list.of.lists <- readRDS("output/subsample_list_of_lists.Rds")
trials <- sort(names(subsample.list.of.lists)) # sort added 2/15/21

source("code/subsampling_functions.R")
# --------------- Run predictions ----------------
results.list <- list()

for (hdx in 1:length(subsample.list.of.lists)) { # 1:8 which trial
  trial.h.subsample.list <- subsample.list.of.lists[[hdx]]
  print(paste0("Trial: ", trials[hdx]))
  print(trial.h.subsample.list[[1]][[1]]$studyName[1])
  results.list.hdx <- vector(mode = "list", length = length(trial.h.subsample.list) + 1)
  for (idx in 1:(length(trial.h.subsample.list))) { # number of subsamples per plot
    nsamp.i <- max(trial.h.subsample.list[[idx]][[1]]$nsamp) # the 1 is iteration of subsampling number 1
    print(paste0("Number of scans sampled: ", nsamp.i))
    results.list.idx <- lapply(trial.h.subsample.list[[nsamp.i]], # each list is an nsamp and each item in this list is an iteration
                               run_TestModelPerformance, nsamp = nsamp.i)
    results.df.idx <- bind_rows(results.list.idx, .id = "sampling_iteration")
    print(colnames(results.df.idx))
    results.list.hdx[[idx]] <- results.df.idx
  }
  # create one df per trial
  results.list[[hdx]] <- bind_rows(results.list.hdx) # bind each df of different nsamp for a single trial
  results.list[[hdx]] %>% group_by(number_samples) %>% summarize(mean(R2p))
}
names(results.list) <- trials
results.df <- bind_rows(results.list, .id = "studyName")

write.csv(results.df, "output/subsampling_prediction_results_long.csv", row.names = F)
