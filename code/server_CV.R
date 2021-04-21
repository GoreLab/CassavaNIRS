# Cross-validation scheme implementation

# Jenna Hershberger
# jmh579@cornell.edu

library(tidyverse)
library(magrittr)
library(waves)
library(pls)
library(randomForest)
library(kernlab)
library(caret)


niterations <- 50
plots.ready <- read.csv("output/full_filtered_plots.csv", stringsAsFactors = F) %>%
  filter(!str_detect(studyName, "135")) %>%
  rename(reference = dry.matter.content.percentage.CO_334.0000092,
         unique.id = observationUnitName,
         genotype = germplasmName) %>%
  dplyr::select(studyName, unique.id, genotype, reference, starts_with("X")) %>%
  drop_na() %>%
  distinct()

trial.vec <- unique(plots.ready$studyName)

for(idx in seq_along(trial.vec)){
  trial.i <- trial.vec[idx]
  trial.i.df <- plots.ready %>% filter(studyName == trial.i) %>%
    dplyr::select(-studyName)
  not.trial.i.df <- plots.ready %>% filter(studyName != trial.i)  %>%
    dplyr::select(-studyName)
  cv2.i <- TestModelPerformance(train.data = NULL,
                                num.iterations = niterations,
                                test.data = NULL,
                                preprocessing = F,
                                wavelengths = 740:1070,
                                tune.length = 15,
                                model.method = "pls",
                                output.summary = F,
                                cv.scheme = "CV2",
                                trial1 = trial.i.df,
                                trial2 = not.trial.i.df) %>%
    mutate(CV.scheme = "CV2")
  cv1.i <- TestModelPerformance(train.data = NULL,
                                num.iterations = niterations,
                                test.data = NULL,
                                preprocessing = F,
                                wavelengths = 740:1070,
                                tune.length = 15,
                                model.method = "pls",
                                output.summary = F,
                                cv.scheme = "CV1",
                                trial1 = trial.i.df,
                                trial2 = not.trial.i.df) %>%
    mutate(CV.scheme = "CV1")
  cv0.i <- TestModelPerformance(train.data = NULL,
                                num.iterations = niterations, # automatically reset to 1
                                test.data = NULL,
                                preprocessing = F,
                                wavelengths = 740:1070,
                                tune.length = 15,
                                model.method = "pls",
                                output.summary = F,
                                cv.scheme = "CV0",
                                trial1 = trial.i.df,
                                trial2 = not.trial.i.df) %>%
    mutate(CV.scheme = "CV0")
  cv00.i <- TestModelPerformance(train.data = NULL,
                                num.iterations = niterations, # automatically reset to 1
                                test.data = NULL,
                                preprocessing = F,
                                wavelengths = 740:1070,
                                tune.length = 15,
                                model.method = "pls",
                                output.summary = F,
                                cv.scheme = "CV00",
                                trial1 = trial.i.df,
                                trial2 = not.trial.i.df) %>%
    mutate(CV.scheme = "CV00")
  results.i <- rbind(cv2.i, cv1.i, cv0.i, cv00.i) %>% mutate(studyName = trial.i)
  if(idx == 1){
    results.df <- results.i
  } else{
    results.df <- rbind(results.df, results.i)
  }

  print(paste0("--------------- Finished with ", trial.i, " ----------------"))
}


write.csv(results.df, "output/cv_results.csv", row.names = F)
