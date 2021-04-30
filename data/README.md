# Data

Due to large file sizes, all raw data is stored on Cyverse at https://datacommons.cyverse.org/browse/iplant/home/shared/GoreLab/dataFromPubs/Hershberger_CassavaNIRS_2021/. To run the code in this repository, download the files as a zipped folder from Cyverse, unzip them, and transfer the files to this folder (./data). All data files must be present in this folder (in an unzipped format) for the code in this repository to run correctly. The file "README.txt" included in the Cyverse folder contains detailed information on each file and is repeated below for convenience:


***
## This folder contains raw phenotypes and spectra for the article:
### Low-cost, handheld near-infrared spectroscopy for root dry matter content prediction in cassava


#### /Hershberger_CassavaNIRS_2021: This directory contains 3 files

/Hershberger_CassavaNIRS_2021: This directory contains 3 files

1. README.txt (this file)

2. raw_pheno.csv: Table with metadata and root dry matter content phenotypes for 10 cassava field trials from IITA in Ibadan and Ikenne, Nigeria. This file was downloaded from Cassavabase at cassavabase.org on April 19, 2021. The column "dry matter content percentage|CO_334:0000092" is the plot mean root dry matter content percentage as determined by the oven drying method.

3. raw_spectra.csv: Table with raw spectra from the 10 cassava field trials from IITA. Spectra were collected with a SCiO spectrometer (ConsumerPhysics). Two protocols were used for sample preparation prior to scan aquisition: sliced and shredded. Scans taken on sliced roots are indicated by non-NA values in the "rootNumber" column. For scans taken on sliced roots, individual roots were sliced crosswise in the center and the cut surface was scanned multiple times with the SCiO. Scans taken on shredded roots are indicated by non-NA values in the "subsample" column. For these shredded scans, a sample of six individual roots from each plot was peeled, shredded, and mixed together to homogenize. Six 100 g subsamples were taken, loaded into a small quartz container, and each was scanned multiple times. Columns "X740" through "X1070" indicate the wavelength measured and the corresponding spectral value captured with the SCiO. Scans from this file are associated with metadata and root dry matter content from "raw_pheno.csv" by unique combinations of "studyName" and "plotNumber".

---
### For questions regarding released data sets contact:
Phenotypic data: Jenna Hershberger -> jmh579@cornell.edu

Spectral data: Jenna Hershberger -> jmh579@cornell.edu

Corresponding author: Prof. Michael Allen Gore (Cornell University) -> mag87@cornell.edu

