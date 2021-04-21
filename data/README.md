# Data

Due to large file sizes, all raw data is stored on Cyverse at https://datacommons.cyverse.org/browse/iplant/home/shared/GoreLab/dataFromPubs/Hershberger_CassavaNIRS_2021/. To run the code in this repository, download the files as a zipped folder from Cyverse, unzip them, and transfer the files to this folder (./data). All data files must be present in this folder (in an unzipped format) for the code in this repository to run correctly. The file "README.txt" included in the Cyverse folder contains detailed information on each file and is repeated below for convenience:


***
## This folder contains raw phenotypes and spectra for the article:
### Low-cost, handheld near-infrared spectroscopy for root dry matter content prediction in cassava


#### /Hershberger_CassavaNIRS_2021: This directory contains 3 files

1. README.txt (this file)

2. Cassavabase_phenotypes_20210419.csv: Table with metadata and root dry matter content phenotypes for 10 cassava field trials from IITA in Ibadan and Ikenne, Nigeria. This file was downloaded directly from Cassavabase at cassavabase.org with no alterations. The column "dry matter content percentage|CO_334:0000092" is the plot mean root dry matter content percentage as determined by the oven drying method.

3. TrialNameKey.csv: Table relating Cassavabase study names to the shorter trial names used in the manuscript. "Abbreviated Trial Name" is the name used in the manuscript and "studyName" is the Cassavabase trial ID.


#### /Hershberger_CassavaNIRS_2021/Corrected_metadata: This directory contains 5 files

1. Trials_Metadata.xls: Table with additional metadata to correct or augment metadata downloaded from Cassavabase.

2. 17.CASS.PYT.49.setA.IB.xls: Table with corrected experimental design metadata (row, column, block, check) for Cassavabase trial "17.CASS.PYT.49.setA.IB".

3. 17.GS.C3.PYT.80.IB.xls: Table with corrected experimental design metadata (row, column, block, check) for Cassavabase trial "17.GS.C3.PYT.80.IB".

4. 19.CASS.PYT.52.IK_Row_Col.xls: Table with corrected experimental design metadata (row, column, block, check) for Cassavabase trial "19.CASS.PYT.52.IK".

5. 19.GS.C1.C2.AYT.33.IB_Row_Col.xls: Table with corrected experimental design metadata (row, column, block, check) for Cassavabase trial "19.CMSSurveyVarieties.AYT.33.IB".


#### /Hershberger_CassavaNIRS_2021/Spectra: This directory contains 9 files

1. 2017.IITA.GS.C0.PYT49.IBA.REP1_spectra.csv: Table with raw spectra from the first replicate of Cassavabase trial "17.CASS.PYT.49.setA.IB". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). Individual roots were sliced crosswise in the center and the cut surface was scanned multiple times. Scans are associated with plot numbers ("plot_no") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

2. CBU.IITA.GS.PYT49.IB.Rep2_spectra.csv: Table with raw spectra from the second replicate of Cassavabase trial "17.CASS.PYT.49.setA.IB". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). Six individual roots from each plot were sliced crosswise in the center and the cut surface was scanned multiple times. Scans are associated with plot numbers ("plot_number") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

3. 2017.IITA.GS.C3.PYT80_spectra.csv: Table with raw spectra from Cassavabase trial "17.GS.C3.PYT.80.IB". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). Six individual roots from each plot were sliced crosswise in the center and the cut surface was scanned multiple times. Scans are associated with plot numbers ("plot_no") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

4. IITA.18.Cass.PYT52.Ibadan.csv: Table with raw spectra from Cassavabase trial "18.CASS.PYT.52.IB". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). Six individual roots from each plot were sliced crosswise in the center and the cut surface was scanned multiple times. Scans are associated with plot numbers ("plot_number") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

5. raw_spectra_18.GS.C2.setA.UYT.36.IB.csv: Table with raw spectra from Cassavabase trial "18.GS.C2.setA.UYT.36.IB". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). A sample of six individual roots from each plot was peeled, shredded, and mixed together to homogenize. Two 100 g subsamples were taken, loaded into a small quartz container, and each was scanned multiple times. Scans are associated with plot numbers ("Plot_number") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

6. raw_spectra_18.GS.C2.setB.UYT.36.IB.csv: Table with raw spectra from Cassavabase trial "18.GS.C2.setB.UYT.36.IB". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). A sample of six individual roots from each plot was peeled, shredded, and mixed together to homogenize. Two 100 g subsamples were taken, loaded into a small quartz container, and each was scanned multiple times. Scans are associated with plot numbers ("plot_number") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

7. raw_spectra_19.CASS.PYT.52.IK.csv: Table with raw spectra from Cassavabase trial "19.CASS.PYT.52.IK". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). A sample of six individual roots from each plot was peeled, shredded, and mixed together to homogenize. Six 100 g subsamples were taken, loaded into a small quartz container, and each was scanned multiple times. Scans are associated with plot numbers ("PLOT_NO") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

8. raw_spectra_19.GS.C4B.PYT.500.IK.csv: Table with raw spectra from Cassavabase trial "19.GS.C4B.PYT.500.IK". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). A sample of six individual roots from each plot was peeled, shredded, and mixed together to homogenize. Six 100 g subsamples were taken, loaded into a small quartz container, and each was scanned multiple times. Scans are associated with plot numbers ("Plot_number") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

9. SCiO_2020_1.csv: Table with raw spectra from Cassavabase trials "19.CMSSurveyVarieties.AYT.33.IB", "19.GS.C2.UYT.36.setA.IB", and "19.GS.C2.UYT.36.setB.IB". Spectra were collected with a SCiO spectrometer (ConsumerPhysics). A sample of six individual roots from each plot was peeled, shredded, and mixed together to homogenize. Six to ten 100 g subsamples were taken, loaded into a small quartz container, and each was scanned multiple times. An additional scan per plot, performed without the quartz container, is labeled as "open scan without frame" in the "Frame type" column. Scans are associated with plot numbers ("Plot_number") that correspond to the "plotNumber" column in the file "/Hershberger_CassavaNIRS_2021/Cassavabase_phenotypes_20210419.csv".

---
### For questions regarding released data sets contact:
Phenotypic data: Jenna Hershberger -> jmh579@cornell.edu

Spectral data: Jenna Hershberger -> jmh579@cornell.edu

Corresponding author: Prof. Michael Allen Gore (Cornell University) -> mag87@cornell.edu

