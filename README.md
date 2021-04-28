# ManySmilesCollaboration
Private GitHub page for data/code related to the Many Smiles Collaboration. Currently only accessible to Nicholas Coles, Marco Tullio Liuzza, and Marco Marozzi.

# Description of files
## ManySmilesDataProcessing.Rmd:
- Directly pulls the data from the Qualtrics server
- Merges the Qualtrics data with data on participant awareness and distraction (which labs coded)
- Cleans and processes data to create a "wide", "long" , and "longer" dataframes
- Exports data to the data folder

## ManySmilesAnalysis.Rmd:
- Main data analysis script

## Coding folder:
Each lab had two coders code the extent to which participants were (a) aware of the true purpose of the study and (b) distracted. This folder contains seperate .xlsx files for each coder in each lab. (Note: many labs are still coding open-ended responses, so this folder is smaller than usual.)

## Data folder
- DF.w.rds: one row for each participant
- DF.l.rds: one row for each of the 3 pose trials that participants completed (i.e., three rows per participant). This is the dataframe that is used for most analyses.
- DF.l.full.rds: one row for each emotion self-report that participants completed during the posing trials. This dataframe is useful for exploratory analyses involving emotion scale items.

## Updates folder
This folder will probably only be used by Nicholas. The folder contains code that (a) pulls data from the Qualtrics server, (b) calculates the number of observations per lab, and (c) pushes an updated sample size count to the Project Management Google Sheet (https://docs.google.com/spreadsheets/d/1mvfiso_H1lKNYJ0lE73caTfClHe7x6ANTl4uoYhVKJA/edit#gid=293196314)
