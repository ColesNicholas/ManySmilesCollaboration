# Description of files
## ManySmilesDataProcessing.Rmd:
- Directly pulls the data from the Qualtrics server
- Merges the Qualtrics data with data on participant awareness and distraction (which labs coded)
- Cleans and processes data to create a "long"  and "longer" dataframes
- Exports data to the data folder

## ManySmilesAnalysis.Rmd:
- Main data analysis script

## data folder
- coding: Each lab had two coders code the extent to which participants were (a) aware of the true purpose of the study and (b) distracted. This folder contains seperate .xlsx files for each coder in each lab. 
- DF.l.rds: one row for each of the happy and neutral trials that participants completed (i.e., two rows per participant). This is the dataframe that is used for most analyses.
- DF.l.full.rds: one row for each of the happy, neutral, filler 1, and filler 2 trials that participants completed (i.e., four rows per participant). This dataframe is used for one of the exploratory analyses requested by reviewers.

## updates folder [inactive]
This inactive folder will only be used by Nicholas. The folder contains code that (a) pulls data from the Qualtrics server, (b) calculates the number of observations per lab, and (c) pushes an updated sample size count to the Project Management Google Sheet (https://docs.google.com/spreadsheets/d/1mvfiso_H1lKNYJ0lE73caTfClHe7x6ANTl4uoYhVKJA/edit#gid=293196314)

## file_generation folder [inactive]
This inactive folder will only be used by Nicholas. The folder contains code that (a) pulls data from the Qualtrics server, (b) creates site-specific data validation Google Sheets, and (c) creates site-specific coding Google Sheets.
