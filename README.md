# Description of files
### ManySmilesDataProcessing.Rmd:
- Pulls in raw Qualtrics data from data/raw/MSC_data_raw.csv
- Merges the coder ratings of participant awareness and distraction in data/coding/
- Cleans and processes data to create several processed dataframes
- Exports processed data to the data folder

### ManySmiles_FrequentistAnalyses.Rmd:
- Frequentist data analysis script

### ManySmiles_BayesianAnalyses.R:
- Script that performs supplemental Bayesian analyses

### ManySmiles_PresentationFigures.Rmd:
- Temporary code used to prep presentations

### ManySmiles_SuppTable.Rmd
- Codethat preps a country-specific supplemental demographics tables

### ManySmiles_Visualizations.Rmd:
- Codethat creates manuscript figures

### ManySmiles_RR7_Prereg.docx
- Copy of the pre-registration form

## data folder
### codebooks
- MSC_codebook_coder.xlsx: codebook for coder data files
- MSC_codebook_processed.xlsx: codebook for processed data files (DF.l.rds, DF.l.inc.rds, and DF.l.full.rds)
- MSC_codebook_raw.xlsx: codebook for raw Qualtrics data (MSC_data_raw.csv)

### coding
Each lab had two coders code the extent to which participants were (a) aware of the true purpose of the study and (b) distracted. This folder contains seperate .xlsx files for each coder in each lab. 

### raw
- MSC_data_raw.csv: raw Qualtrics data

### processed
- DF.l.full.rds: processed data containing one row for each of the happy, neutral, filler 1, and filler 2 trials that participants completed (i.e., four rows per participant). This dataframe is used for visualizations.
- DF.l.full.inc.rds: same as DF.l.full.rds, but excludes participants who did not meet the primary analysis inclusion criteria. This dataset is used for one of the sensitivity analyses requested by reviewers.
- DF.l.rds: processed data containing one row for each of the happy and neutral trials that participants completed (i.e., two rows per participant). This is the dataframe that is used for most analyses.
- DF.l.inc.rds: same as DF.l.full.rds, but excludes participants who did not meet the primary analysis inclusion criteria.
- DF.w.rds: processed data containing one row for each participant.

## output folder
Place where figures and tables are temporarily being stored.

## updates folder [deleted but need to be pulled back in]
This inactive folder will only be used by Nicholas. The folder contains code that (a) pulls data from the Qualtrics server, (b) calculates the number of observations per lab, and (c) pushes an updated sample size count to the Project Management Google Sheet (https://docs.google.com/spreadsheets/d/1mvfiso_H1lKNYJ0lE73caTfClHe7x6ANTl4uoYhVKJA/edit#gid=293196314)

## file_generation folder [deleted but need to be pulled back in]
This inactive folder will only be used by Nicholas. The folder contains code that (a) pulls data from the Qualtrics server, (b) creates site-specific data validation Google Sheets, and (c) creates site-specific coding Google Sheets.
