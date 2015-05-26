#####################################
# R Source code for knitr-tutorial slide
# Created: May 5, 2015
# Updated: May 24, 2015
# NOTES:
#####################################


## ---- functions ----
getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")
library(broom)
library(dplyr)
library(xtable)
#library(stargazer)
library(texreg)
library(lme4)
library(MASS)
library(geepack)
data(epil)
source("~/git_repositories/knitr-tutorial/slides/texreg-geepack.R")

## ---- example ----
lmfit <- lm(mpg ~ wt, mtcars)
stargazer::stargazer(lmfit, digits = 2)
jj <- extract(lmfit)
jj@ci.low


## ---- example-2 ----
fit.glm <- glm(y ~ trt*period + age, 
                  data = epil, family = poisson)
fit.glmm <- glmer(y ~ trt*period + age + (1|subject), 
             data = epil, family = poisson)
fit.gee <- geeglm(y ~ trt*period + age, id = subject, 
                  data = epil, family = poisson, corstr = "unstructured")
texreg(list(fit.glm,fit.glmm,fit.gee), custom.model.names = c("GLM","GLMM","GEE"), 
       custom.coef.names = c("Intercept","progabide","time","age","progabide:time"),
       fontsize = "scriptsize", caption = "Comparing model estimates", single.row = T,
       bold = 0.05, ci.force = TRUE)



