# Random forest variable importance

# Jenna Hershberger
# jmh579@cornell.edu

library(tidyverse)
library(waves)

plots.aggregated <- read.csv("full_filtered_plots.csv", stringsAsFactors = F)

run_TestModelPerformance <- function(input_df){
  tmp <- TestModelPerformance(train.data = input_df,
                       num.iterations = 10,
                       test.data = NULL,
                       preprocessing = F,
                       wavelengths = 740:1070,
                       tune.length = 15,
                       model.method = "rf",
                       rf.variable.importance = TRUE,
                       output.summary = F)
  return(tmp$RF.variable.importance)
}

waves_results_nested_RFimp <- plots.aggregated %>%
  rename(reference = dry.matter.content.percentage.CO_334.0000092,
         unique.id = observationUnitName) %>%
  dplyr::select(studyName, unique.id, reference, starts_with("X")) %>%
  drop_na() %>%
  distinct() %>%
  group_by(studyName) %>%
  nest() %>%
  mutate(waves_results = map(data, run_TestModelPerformance(input_df = data)))

waves_results_flat_RFimp <- waves_results_nested_RFimp %>%
  unnest(cols = c(waves_results)) %>%
  dplyr::select(-data)

write.csv(waves_results_flat_RFimp, "within_trial_waves_RF_importance.csv", row.names = F)

