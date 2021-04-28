## ----message = FALSE, results = "hide"-------------------------------------------------
# clear environment
rm(list = ls())

# install (if necessary) and load packages
  # function written by stevenworthington 
  Ipak <- function(pkg){
      new.pkg <- pkg[!(pkg %in% installed.packages()[, 'Package'])]
      
      if (length(new.pkg)) 
          install.packages(new.pkg, dependencies = TRUE)
      
      sapply(pkg, require, character.only = TRUE)
  }

  # vector of necessary packages
  packages <- c('tidyverse', 'ggplot2', 
                'qualtRics', 'googlesheets4')
  
  # using vector of packages, call ipak function
  Ipak(packages)
  
  # delete vestigial
  rm(packages, Ipak)


## --------------------------------------------------------------------------------------
qualtrics_api_credentials(
  api_key = 'Qtd8CzAV5LeEfGyQQiMBpF8YXSq7zHbKF5A0j1Mn', 
  base_url = 'sjc1.qualtrics.com',
  install = TRUE,
  overwrite = TRUE)

readRenviron("~/.Renviron")


## --------------------------------------------------------------------------------------
DF <- all_surveys() %>% 
  fetch_survey(surveyID = 'SV_1MHZifyxXFTQMGp',
               force_request = TRUE,
               label = FALSE,
               convert = FALSE,
               fileEncoding = "UTF-8")


## --------------------------------------------------------------------------------------
# Issue Report 1/11/2021 15:27:16
DF[DF$ResponseId == 'R_71mBhLa0wTLkE9P', ]$lab <- "USA_02"
DF[DF$ResponseId == 'R_71mBhLa0wTLkE9P', ]$mode <- "online"

DF[DF$ResponseId == 'R_Y5eNgLXGXayulH3', ]$lab <- "USA_02"
DF[DF$ResponseId == 'R_Y5eNgLXGXayulH3', ]$mode <- "online"

DF[DF$ResponseId == 'R_336V86Y5lFAErTD', ]$lab <- "USA_02"
DF[DF$ResponseId == 'R_336V86Y5lFAErTD', ]$mode <- "online"


## --------------------------------------------------------------------------------------
# Issue Report 3/10/2021 13:04:13
DF <- DF %>% 
  filter(ResponseId != "R_24pYUstgkOOGxLs",
         ResponseId != "R_ZrG6EKkXCgsUcCd",
         ResponseId != "R_Y4eZs4E4YuVAZfH",
         ResponseId != "R_3nTmxu3vObT2JHh",
         ResponseId != "R_3g0zJDrM9ytHC71",
         ResponseId != "R_28Aq1V3WJBwwpNM",
         ResponseId != "R_3lEs4Szd6p5WnkU",
         ResponseId != "R_sALi2EPfHu7xhGp")

## --------------------------------------------------------------------------------------
# Issue Report 2/1/2021 11:06:16
DF[!is.na(DF$comp_code) & DF$comp_code == 50011, ]$lab <- "GBR_01"
DF[!is.na(DF$comp_code) & DF$comp_code == 50011, ]$mode <- "online"

## --------------------------------------------------------------------------------------
# Issue Report 3/10/2021 16:00:55
ids <-
  c("R_1GD4F1SkMf9kfej", "R_9Y64npYAReaM2bv", 
    "R_1Dr0VPNxpieom2m", "R_33d5XLn9fbq9xKK",
    "R_25A6NQrZvWRKUL4", "R_2PjsokzhdsD2vZj",
    "R_2Qtk9qpd520bKMP", "R_e38EizEqLMVfA09",
    "R_2BmrrTge0O7l4SU", "R_1jSOkeCyxfswvNN",
    "R_3KrLO7nsoiAFwsL", "R_1ovashQAQ6fDomE",
    "R_1Ej0NXzFob65t2o", "R_NVzxKo4NqK0U7fP",
    "R_3FUqkkW2BKltGmW", "R_1jkPjgj145hnjtV",
    "R_3nIfmyaH4kOeJcB", "R_2WHxeiVG0if6IDO",
    "R_2TFfFcUCVAAsVH7", "R_UEdaTAgiXo7qnbb")

for (i in ids){
  DF[DF$ResponseId == i, ]$lab <- "AUS_01"
  DF[DF$ResponseId == i, ]$mode <- "online"
}

rm(i, ids)

## --------------------------------------------------------------------------------------
# Issue Report 3/11/2021 12:27:11
DF <- DF %>% 
  filter(ResponseId != 'R_1FQAgvtC22eIEmo')

## --------------------------------------------------------------------------------------
# Issue Report 4/13/2021 12:32:27
DF <- DF %>% 
  filter(ResponseId != 'R_3ff7VJO1aIUfhrY',
         ResponseId != 'R_3J7VlYAposubTqQ',
         ResponseId != 'R_2as3VAy174nEEUE',
         ResponseId != 'R_25NJqFnThS6T9gw')

## --------------------------------------------------------------------------------------
# Issue Report 4/19/2021 16:10:38
DF <- DF %>% 
  filter(ResponseId != 'R_3PSwb7kaUELPdOQ',
         ResponseId != 'R_2TTWPmgmGBzJo4u',
         ResponseId != 'R_31aRdUehVCYMrRo',
         ResponseId != 'R_1QDTXhBqAGOgMu0',
         ResponseId != 'R_22ulZEcvoGxSUAk')

## --------------------------------------------------------------------------------------
DF <- DF %>% 
  # remove test data
  filter(DistributionChannel != 'preview') %>% 
  
  # remove incomplete observations
  filter(Progress > 90)


## --------------------------------------------------------------------------------------
smr <- DF %>% 
  group_by(lab) %>% 
  summarise(n = n()) %>% 
  filter(!is.na(lab))


## --------------------------------------------------------------------------------------
# specify account to pull from
gs4_auth(email = "ncoles797@gmail.com")

# worksheet name
ss = "https://docs.google.com/spreadsheets/d/1mvfiso_H1lKNYJ0lE73caTfClHe7x6ANTl4uoYhVKJA/edit#gid=187267059"

# update lab counts
sheet_write(data = smr,
            ss = ss,
            sheet = "Progress")

# update date
date <-  data.frame(matrix(ncol = 1,
                           nrow = 0,
                           dimnames = list(NULL,
                                           c(paste0("Last updated: ",
                                                    Sys.Date()
                                                    )
                                             )
                                           )
                           )
                    )

sheet_write(data = date,
            ss = ss,
            sheet = "Date")

## --------------------------------------------------------------------------------------
