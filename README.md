# Reproducible documentation: Hershberger et al. Low-cost, handheld near-infrared spectroscopy for root dry matter content prediction in cassava

This repository and website documents all analyses, summary, tables and figures associated with the following PREPRINT: [Low-cost, handheld near-infrared spectroscopy for root dry matter content prediction in cassava]()

A [workflowR](https://workflowr.io/) project.

# Abstract

Over 800 million people across the tropics rely on cassava as a major source of calories. While the root dry matter content (RDMC) of this starchy root crop is important for both producers and consumers, characterization of RDMC by traditional methods is time-consuming and laborious for breeding programs. Alternate phenotyping methods have been proposed but lack the accuracy, cost, or speed ultimately needed for cassava breeding programs. For this reason, we investigated the use of a low-cost, handheld NIR spectrometer for field-based RDMC prediction in cassava. Oven-dried measurements of RDMC were paired with 21,044 scans of roots of 376 diverse clones from 10 field trials in Nigeria and grouped into training and test sets based on cross-validation schemes relevant to plant breeding programs. Mean partial least squares regression model performance ranged from R<sup>2</sup><sub>p</sub> = 0.62 - 0.89 for within-trial predictions, which is within the range achieved with laboratory-grade spectrometers in previous studies. Relative to other factors, model performance was highly impacted by the inclusion of samples from the same environment in both the training and test sets. Random forest variable importance analysis of root spectra revealed increased importance in a region previously identified as predictive of water content in plants (~950 - 990 nm). With appropriate model calibration, the tested spectrometer will allow for field-based collection of spectral data with a smartphone for accurate RDMC prediction and potentially other quality traits, a step that could be easily integrated into existing harvesting workflows of cassava breeding programs. 

# Data availability and reproducibility

The R package **workflowr** was used to document this study reproducibly.

Much of the supporting data *and* output from the analyses documented here are too large for GitHub.

The raw data for this repository is stored on [Cyverse](https://datacommons.cyverse.org/browse/iplant/home/shared/GoreLab/dataFromPubs/Hershberger_CassavaNIRS_2021/). Download this folder and add the contents to the /data folder in this repository to run the analysis code. When running the code, follow the order listed in the [analysis README](/analysis/README.md).
