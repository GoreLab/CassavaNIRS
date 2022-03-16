# Partial least squares variable importance

# Jenna Hershberger
# jmh579@cornell.edu
# 1/20/2022

library(tidyverse)
library(waves)
print("check")
plots.aggregated <- read.csv("full_filtered_plots.csv", stringsAsFactors = F)

# Function to run test_spectra ----------------------------------------------------
run_test_spectra <- function(input_df){
  print(input_df$unique.id[1])
  tmp <- test_spectra(train.data = as.data.frame(input_df),
                      num.iterations = 10,
                      test.data = NULL,
                      pretreatment = 1, # raw data only
                      tune.length = 15,
                      model.method = "pls")
  print(tmp$importance)
  return(as.data.frame(tmp$importance))
}

# Run importance analysis with full dataset (no trimming ends of spectra-------------------
print("Running full dataset analysis")

waves_results_nested_imp <- plots.aggregated %>%
  rename(reference = dry.matter.content.percentage.CO_334.0000092,
         unique.id = observationUnitName) %>%
  dplyr::select(studyName, unique.id, reference, starts_with("X")) %>%
  drop_na() %>%
  distinct() %>%
  group_by(studyName) %>%
  nest() %>%
  mutate(waves_results = map(data, run_test_spectra))

waves_results_flat_imp <- waves_results_nested_imp %>%
  unnest(cols = c(waves_results)) %>%
  dplyr::select(-data)

write.csv(waves_results_flat_imp, "within_trial_waves_PLS_importance.csv", row.names = F)

# # Trim ends and re-run analysis ----------------------------------------------------
# # Spectra trimmed to 800-1000nm
# print("Running trimmed analysis")
#
# waves_results_nested_imp_trim <- plots.aggregated %>%
#   rename(reference = dry.matter.content.percentage.CO_334.0000092,
#          unique.id = observationUnitName) %>%
#   dplyr::select(studyName, unique.id, reference, X800:X1000) %>%
#   drop_na() %>%
#   distinct() %>%
#   group_by(studyName) %>%
#   nest() %>%
#   mutate(waves_results = map(data, run_test_spectra(input_df = data)))
#
# waves_results_flat_imp <- waves_results_nested_imp %>%
#   unnest(cols = c(waves_results)) %>%
#   dplyr::select(-data)
#
# write.csv(waves_results_flat_imp, "within_trial_waves_PLS_importance.csv", row.names = F)
