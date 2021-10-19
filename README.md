# Description of files
## ManySmilesDataProcessing.Rmd:
- Pulls in raw Qualtrics data from data/raw/MSC_data_raw.csv
- Merges the coder ratings of participant awareness and distraction in data/coding/
- Cleans and processes data to create several processed dataframes
- Exports processed data to the data folder

## ManySmilesAnalysis.Rmd:
- Main data analysis script

## ManySmiles_PresentationFigures.Rmd:
- Temporary code used to prep presentations

## ManySmiles_ManySmiles_Tables.Rmd
- Temporary code used to prep tables

## ManySmiles_Visualizations.Rmd:
- Temporary code used to prep visualizations

## ManySmiles_RR7_Prereg.docx
- Copy of the pre-registration form

## data folder
- codebooks: contains codebooks for the raw Qualtrics data, coder data files, and processed datasets (except DF.w.rds, which will likely be deleted in the future).
- coding: Each lab had two coders code the extent to which participants were (a) aware of the true purpose of the study and (b) distracted. This folder contains seperate .xlsx files for each coder in each lab. 
- raw: contains the raw Qualtrics data
- processed: contains processed data sets.
- DF.l.rds: processed data containing one row for each of the happy and neutral trials that participants completed (i.e., two rows per participant). This is the dataframe that is used for most analyses.
- DF.l.full.rds: processed data containing one row for each of the happy, neutral, filler 1, and filler 2 trials that participants completed (i.e., four rows per participant). This dataframe is used for one of the exploratory analyses requested by reviewers.
- DF.w.rds: processed data containing one row for each participant.

## updates folder [deleted but need to be pulled back in]
This inactive folder will only be used by Nicholas. The folder contains code that (a) pulls data from the Qualtrics server, (b) calculates the number of observations per lab, and (c) pushes an updated sample size count to the Project Management Google Sheet (https://docs.google.com/spreadsheets/d/1mvfiso_H1lKNYJ0lE73caTfClHe7x6ANTl4uoYhVKJA/edit#gid=293196314)

## file_generation folder [deleted but need to be pulled back in]
This inactive folder will only be used by Nicholas. The folder contains code that (a) pulls data from the Qualtrics server, (b) creates site-specific data validation Google Sheets, and (c) creates site-specific coding Google Sheets.
