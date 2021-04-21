# Jenna Hershberger
# jmh579@cornell.edu
# 5/19/2020
# Modified 5/27/2020
# Modified 9/28/2020
# Modified 11/13/2020

library(tidyverse)
library(waves)

niter_sampling <- 50

#### Load functions ####
# source("~/Documents/GitHub/SCiOAnalysis/code/subsampling_functions.R")
source("code/subsampling_functions.R")

#### Load data and format ####

subsample <- read.csv("output/full_filtered_subsamples.csv")
pared <- subsample %>% dplyr::select(studyName, plotNumber, subsample,
                                               dry.matter.content.percentage.CO_334.0000092,
                                               starts_with("X")) %>%
  drop_na(dry.matter.content.percentage.CO_334.0000092, X740)

trials <- unique(pared$studyName)

# aggregate by subsample
subsample.agg <- waves::AggregateSpectra(pared, grouping.colnames = c("studyName", "plotNumber", "subsample"),
                                 reference.value.colname = "dry.matter.content.percentage.CO_334.0000092")

# what is max number of subsamples in each trial?
n.max <- subsample.agg %>%
  group_by(studyName, plotNumber) %>%
  summarize(n_subsamples = n()) %>%
  ungroup(plotNumber) %>%
  summarize(max_subsamp = max(n_subsamples))

nested.trials <- subsample.agg %>% full_join(n.max, by = "studyName") %>%
  dplyr::select(studyName, plotNumber, max_subsamp, starts_with("dry"), starts_with("X")) %>%
  group_by(studyName) %>%
  nest() %>%
  arrange(studyName, trials)

print("Trials are nested.")

subsample.list.of.lists <- list()
for(idx in 1:nrow(nested.trials)){ # iterate once through for each trial
  trial.i = cbind(as.character(nested.trials$studyName[idx]), nested.trials$data[[idx]])
  colnames(trial.i)[1] <- "studyName"
  print(paste0("Trial: ", trial.i[1,1]))
  max_subsamp.i <- max(trial.i$max_subsamp)
  print(paste0("maximum number of subsamples: ", max_subsamp.i))
  subsample.list.of.lists[[idx]] <- create_sub_subsamples(trial.df = trial.i,
                                                      grouping.colnames = c("studyName", "plotNumber",
                                                                            "max_subsamp"),
                                                      nmax = max_subsamp.i,
                                                      niter = niter_sampling)
}


names(subsample.list.of.lists) <- trials
saveRDS(subsample.list.of.lists, file = "output/subsample_list_of_lists.Rds")
print("Subsamples generated.")
