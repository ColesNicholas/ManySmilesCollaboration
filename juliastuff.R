library(lme4)
library(JuliaCall)

# open data
DF.w <- readRDS("data/DF.w.rds")
DF.l.full <- readRDS("data/DF.l.full.rds")
DF.l <- readRDS("data/DF.l.rds")
DF.l.inc <- readRDS("data/DF.l.inc.rds")

# set up Julia
options(JULIA_HOME = "C:/Users/ncole/AppData/Local/Programs/Julia-1.6.2/bin/")
julia_setup()

# open Julia
#julia_console()

## open packages
### julia_install_package("MixedModels")
### julia_install_package("JellyMe4")
julia_library("MixedModels")
julia_library("JellyMe4")

## fit model
julia_assign("data", DF.l.inc)
julia_command("res = fit(MixedModel, 
                      @formula(happiness ~ trial * condition * image +
                               (1 | ResponseId) +
                               (1 + trial * image * condition | lab)), 
                      data)")
julia_command("tmp = ([res], [data])")

julia_eval("@rput tmp")
julia_eval('R"summary(tmp)"')

tmp <- as9

# combine model with dataset; then send back to R
julia_eval("tmp = ([res], [data])")
julia_command("as([tmp], "merModLmerTest")")





julia_command("@rput tmp;")
  
  julia.dir$eval("res = fit(LinearMixedModel, form, data)",
                 need_return = c("Julia"))

tmp <- as(results, "merModLmerTest")
  
julia.dir$eval("res")

julia.dir$eval("Anova(res)")



lm1 <- jglmm(happiness ~ trial * condition * image +
               (1 | ResponseId) +
               (1 + trial * image * condition | lab),
             data = DF.l.inc)

tidy(lm1)
