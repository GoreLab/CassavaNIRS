Some of the analyses in this manuscript were more efficiently run from the command line on a server with more memory than is common on desktop/laptop machines. The scripts for these analyses are located in the `code/` sub-folder of this repository with names starting with "server". Results from these analyses are used in subsequent **html** / **Rmd** files to generate plots and tables for the manuscript.

1. [Filter and aggregate](filter_aggregate.html): Remove outliers and prepare raw data for model training
2. [Summary figures](manuscript_summary_figures.html): Generate overview figures and tables
3. `code/server_within_trial_predictions_PLSR_RF_SVM.R`: Command line script that performs within-trial predictions with plot mean scans
4. `code/server_within_trial_predictions_RF_var_importance.R`: Command line script that calculates within-trial random forest variable importance
5. `code/run_subsampling.sh`: Command line shell script that calls `code/server_subsampling_generalized.R` to subsamples sets of scans within each plot and then performs within-trial predictions on those sets with `code/server_subsample_plsr.R`. Utilizes functions from `code/subsampling_functions.R`.
6. `code/server_CV.R`: Command line R script that performs predictions according to four cross-validation schemes relevant to plant breeding
7. [Predictions](manuscript_predictions.html): Generate figures from output of within-trial and cross-validation scheme prediction scripts
8. [Subsampling](manuscript_subsampling.html): Generate figures from output of subsampling scripts



