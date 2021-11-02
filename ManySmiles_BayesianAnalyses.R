# -----------------
# Prep environment
# -----------------
# clear environment
rm(list = ls())

# set seed
set.seed(2)

# turn scientific notation off
options(scipen = 999)

# load results
# load("BayesFactorAnalyses.RData")

# allow for Type III SS
options(contrasts = c('contr.sum', 'contr.poly'))

# load packages
library('tidyverse')
library('BayesFactor')

lapply(XXX, FUN = function(x) {
  do.call("require", list(x)) 
})

# load data
DF.l.inc <- readRDS("data/processed/DF.l.inc.rds") %>% #  old DF.1.rds 
  mutate(ResponseId = ResponseId %>% 
           as.numeric() %>% 
           as.factor())

# -----------------
# Bayesian analyses
# -----------------
# note: The default prior of lmBF on fixed effects is "medium", which is equal to rscale ? 1/2

#################
# 1  #
#################
# Interaction between Facial Movement Task and Stimuli Presence
lmbf1.1 <- lmBF(happiness ~ condition + image + condition:image + 
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = DF.l.inc)


lmbf1.0 <- lmBF(happiness ~ condition + image + 
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = DF.l.inc)

(bf1 <- lmbf1.1/lmbf1.0 ) # inconclusive: 0.8633591 ?15.52%

#################
# 2  #
#################
# Three-way interaction between Pose, Facial Movement Task, and Stimuli Presence
lmbf2.1 <- lmBF(happiness ~ condition + image + trial + 
                  condition : image + condition : trial + 
                  image : trial + condition : image : trial +  
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = DF.l.inc)

lmbf2.0 <- lmBF(happiness ~ condition + image + trial + 
                  condition : image + condition : trial + 
                  image : trial +  
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = DF.l.inc)

(bf2 <- lmbf2.1/lmbf2.0 )# inconclusive: 1.678069 ?11.69%

# Simple effects:

#Mimicry
#################
# 3  #
#################
# Effect of Stimuli Presence

lmbf3.1 <- lmBF(happiness ~ image +  
                  ResponseId + lab,
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.l.inc, 
                              condition == "mimicry"))

lmbf3.0 <- lmBF(happiness ~ 1 +
                  ResponseId + lab,
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.l.inc, 
                              condition == "mimicry"))

(bf3 <- lmbf3.1/lmbf3.0) #3.763

#################
# 4  #
#################
# Effect of Pose

lmbf4.1 <- lmBF(happiness ~ trial +  
                  ResponseId + lab,
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.l.inc, 
                              condition == "mimicry"))

lmbf4.0 <- lmBF(happiness ~ 1 +  
                  ResponseId + lab,
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.l.inc, 
                              condition == "mimicry"))

(bf4 <- lmbf4.1/lmbf4.0) # 25237385930862 ?2.85%

#################
# 5  #
#################
# Interaction between Pose and Stimuli Presence

lmbf5.1 <- lmBF(happiness ~ image + trial + image : trial +
                  ResponseId + lab,
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.l.inc, 
                              condition == "mimicry"))

lmbf5.0 <- lmBF(happiness ~ image + trial +
                  ResponseId + lab,
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.l.inc, 
                              condition == "mimicry"))

(bf5 <- lmbf5.1/lmbf5.0) # 2.82

# Mimicry and  present
#################
# 6  #
#################
# The effect of Pose emerged in the presence

lmbf6.1 <- lmBF(happiness ~ trial + 
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, 
                              condition == "mimicry" & image == "present"))

lmbf6.0 <- lmBF(happiness ~ 1 + 
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, 
                              condition == "mimicry" & image == "present"))

(bf6 <- lmbf6.1/lmbf6.0 )# 810.0388 ?6.03%

# Mimicry and  absentt
#################
# 7  #
#################
# The effect of Pose emerged in the in the absence

lmbf7.1 <- lmBF(happiness ~ trial + 
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, 
                              condition == "mimicry" & image == "absentt"))

lmbf7.0 <- lmBF(happiness ~ 1 +  
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, condition == "mimicry" & image == "absentt"))

(bf7 <-lmbf7.1/lmbf7.0) # 20327954614


# Directed

#################
# 8  #
#################
# Effect of Stimuli Presence

lmbf8.1 <- lmBF(happiness ~ image +
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, 
                              condition == "directd"))

lmbf8.0 <- lmBF(happiness ~ 1 + 
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, 
                              condition == "directd"))

(bf8 <- lmbf8.1/lmbf8.0 )# 113.534

#################
# 9  #
#################
# Effect of Pose

lmbf9.1 <- lmBF(happiness ~ trial +
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, 
                              condition == "directd"))

lmbf9.0 <- lmBF(happiness ~ 1 + 
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, 
                              condition == "directd"))

(bf9 <- lmbf9.1/lmbf9.0) # 1871459923 ?3.33%


#################
# 10  #
#################
# Interaction between Pose and Stimuli Presence

lmbf10.1 <-  lmBF(happiness ~ image + trial + image : trial +  
                    ResponseId + lab, 
                  whichRandom = c("ResponseId", "lab"), 
                  data = subset(DF.1, 
                                condition == "directd"))

lmbf10.0 <-  lmBF(happiness ~ image + trial +  
                    ResponseId + lab, 
                  whichRandom = c("ResponseId", "lab"), 
                  data = subset(DF.1, 
                                condition == "directd"))

(bf10 <- lmbf10.1/lmbf10.0) # 0.1043555 ?3.37%
1/bf10 # 9.58

# directd and  present
#################
# 11  #
#################
# The effect of Pose  in the presence

lmbf11.1 <- lmBF(happiness ~ trial +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "directd" & image == "present"))

lmbf11.0 <- lmBF(happiness ~ 1 +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "directd" & image == "present"))

(bf11 <- lmbf11.1/lmbf11.0) # 895.4185 ?1.21%

# directd and  absentt
#################
# 12  #
#################
# The effect of Pose  in the absence

lmbf12.1 <- lmBF(happiness ~ trial + 
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "directd" & image == "absentt"))

lmbf12.0 <- lmBF(happiness ~ 1 + 
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "directd" & image == "absentt"))

(bf12 <- lmbf12.1/lmbf12.0) # 578494.6 ?3.33%

# Pen-in-the-mouth

#################
# 13  #
#################
# Effect of Stimuli Presence

lmbf13.1 <- lmBF(happiness ~ image +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "pentask"))

lmbf13.0 <- lmBF(happiness ~ 1 +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "pentask"))

(bf13 <- lmbf13.1/lmbf13.0 )# 0.2058395
1/bf13
#################
# 14  #
#################
# Effect of Pose

lmbf14.1 <- lmBF(happiness ~ trial +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "pentask"))

lmbf14.0 <- lmBF(happiness ~ 1 +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "pentask"))

(bf14 <- lmbf14.1/lmbf14.0) # 1.001017

#################
# 15  #
#################
# Interaction between Pose and Stimuli Presence

lmbf15.1 <-  lmBF(happiness ~ image + trial + image : trial +
                    ResponseId + lab, 
                  whichRandom = c("ResponseId", "lab"), 
                  data = subset(DF.1, 
                                condition == "pentask"))

lmbf15.0 <-  lmBF(happiness ~ image + trial + 
                    ResponseId + lab, 
                  whichRandom = c("ResponseId", "lab"), 
                  data = subset(DF.1, 
                                condition == "pentask"))

(bf15 <- lmbf15.1/lmbf15.0) #  0.196295 
1/bf15

# pentask and  present
#################
# 16  #
#################
# The effect of Pose in the presence
lmbf16.1 <- lmBF(happiness ~ trial +  
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "pentask" & image == "present"))

lmb16.0 <- lmBF(happiness ~ 1 + 
                  ResponseId + lab, 
                whichRandom = c("ResponseId", "lab"), 
                data = subset(DF.1, 
                              condition == "pentask" & image == "present"))

(bf16 <- lmbf16.1/lmb16.0) # 2.5

# pentask and  absentt
#################
# 17  #
#################
# The effect of Pose  in the the absence
lmbf17.1 <- lmBF(happiness ~ trial +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "pentask" & image == "absentt"))

lmbf17.0 <- lmBF(happiness ~ 1 +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.1, 
                               condition == "pentask" & image == "absentt"))

(bf17 <- lmbf17.1/lmbf17.0) # 

#################
# pen-in-mouth with relaxed exclusion criteria  #
#################
# load data
DF.l <- readRDS("data/processed/DF.l.rds") %>% #  old DF.incl 
  mutate(ResponseId = ResponseId %>% 
           as.numeric() %>% 
           as.factor())

lmbf18.1 <- lmBF(happiness ~ trial +  
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.l, 
                               condition == "pentask"))

lmbf18.0 <- lmBF(happiness ~ 1 +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.l, 
                               condition == "pentask"))

(bf18 <- lmbf18.1/lmbf18.0) #  277289.3 ±7.34%

#################
# comparisons with filler tasks when images are absent  #
#################
# load data
DF.l.full.inc <- readRDS("data/processed/DF.l.full.inc.rds") %>% #  old DF.full 
  mutate(ResponseId = ResponseId %>% 
           as.numeric() %>% 
           as.factor())

lmbf19.1 <- lmBF(happiness ~ condition * trial +
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.l.full.inc, 
                               image == "absentt"))

lmbf19.0 <- lmBF(happiness ~ condition + trial +  
                   ResponseId + lab, 
                 whichRandom = c("ResponseId", "lab"), 
                 data = subset(DF.l.full.inc, 
                               image == "absentt"))
(bf19 <- lmbf19.1/lmbf19.0) # 120809211773 ±7.75%

output = c(bf1@bayesFactor$bf, bf2@bayesFactor$bf, 
           bf3@bayesFactor$bf, bf4@bayesFactor$bf, 
           bf5@bayesFactor$bf, bf6@bayesFactor$bf, 
           bf7@bayesFactor$bf, bf8@bayesFactor$bf, 
           bf9@bayesFactor$bf, bf10@bayesFactor$bf, 
           bf11@bayesFactor$bf, bf12@bayesFactor$bf, 
           bf13@bayesFactor$bf, bf14@bayesFactor$bf, 
           bf15@bayesFactor$bf, bf16@bayesFactor$bf, 
           bf17@bayesFactor$bf, bf18@bayesFactor$bf, 
           bf19@bayesFactor$bf)

write.table(t(round(exp(output), 2)),
            file="outputBayesFactor.txt",
            quote = F,
            col.names = F,
            row.names = F,
            append = T)

library(tidyr)
DF2.1.1 <- subset(DF.l.full.inc, 
                  image == "absentt" & 
                    condition == "mimicry" & 
                    (trial == "fil.1" |trial == "happy"))

DF2.1.1 <- droplevels(DF2.1.1)

DF2.1.1 <- DF2.1.1[, c('ResponseId', 'happiness', 'trial')]

DF2.1.1.w <- data.frame(spread(DF2.1.1, 
                               key = trial, 
                               value = happiness))

ttestBF(x = DF2.1.1.w$fil.1, 
        y = DF2.1.1.w$happy, 
        paired = T, 
        rscale = 0.5) # 3011970 ±0%

DF2.1.2 <- subset(DF.l.full.inc, 
                  image == "absentt" & 
                    condition == "mimicry" & 
                    (trial == "fil.4" | trial == "happy"))

DF2.1.2 <- droplevels(DF2.1.2)

DF2.1.2 <- DF2.1.2[, c('ResponseId', 'happiness', 'trial')]

DF2.1.2.w <- data.frame(spread(DF2.1.2, 
                               key = trial, 
                               value = happiness))

ttestBF(x = DF2.1.2.w$fil.4, 
        y = DF2.1.2.w$happy, 
        paired = T, 
        rscale = 0.5) # 9364341 ±0%%


DF2.2.1 <- subset(DF.l.full.inc, 
                  image == "absentt" & 
                    condition == "directd" & 
                    (trial == "fil.1" | trial == "happy"))

DF2.2.1 <- droplevels(DF2.2.1)

DF2.2.1 <- DF2.2.1[, c('ResponseId', 'happiness', 'trial')]

DF2.2.1.w <- data.frame(spread(DF2.2.1, 
                               key = trial, 
                               value = happiness))

ttestBF(x = DF2.2.1.w$fil.1, 
        y = DF2.2.1.w$happy, 
        paired = T, 
        rscale = 0.5) # 3.542896 ±0%%

DF2.2.2 <- subset(DF.2, 
                  image == "absentt" & 
                    condition == "directd" & 
                    (trial == "fil.4" | trial == "happy"))

DF2.2.2 <- droplevels(DF2.2.2)

DF2.2.2 <- DF2.2.2[, c('ResponseId', 'happiness', 'trial')]

DF2.2.2.w <- data.frame(spread(DF2.2.2, 
                               key = trial, 
                               value = happiness))

ttestBF(x = DF2.2.2.w$fil.4, 
        y = DF2.2.2.w$happy, 
        paired = T, 
        rscale = 0.5) # 7.412424 ±0%

DF2.3.1 <- subset(DF.2, 
                  image == "absentt" & 
                    condition == "pentask" & 
                    (trial == "fil.1" | trial == "happy"))

DF2.3.1 <- droplevels(DF2.3.1)

DF2.3.1 <- DF2.3.1[, c('ResponseId', 'happiness', 'trial')]

DF2.3.1.w <- data.frame(spread(DF2.3.1, 
                               key = trial, 
                               value = happiness))

ttestBF(x = DF2.3.1.w$fil.1, 
        y = DF2.3.1.w$happy, 
        paired = T, 
        rscale = 0.5) # 5.478931 ±0% but in the oppisite

summary(DF2.3.1.w)

DF2.3.2 <- subset(DF.2, 
                  image == "absentt" & 
                    condition == "pentask" & 
                    (trial == "fil.4" | trial == "happy"))

DF2.3.2 <- droplevels(DF2.3.2)

DF2.3.2 <- DF2.3.2[, c('ResponseId', 'happiness', 'trial')]

DF2.3.2.w <- data.frame(spread(DF2.3.2, 
                               key = trial, 
                               value = happiness))

ttestBF(x = DF2.3.2.w$fil.4, 
        y = DF2.3.2.w$happy, 
        paired = T, 
        rscale = 0.5) # 0.3721617 ±0.03%%
1/0.3721617 # 2.6

save.image("BayesFactorAnalyses.RData")