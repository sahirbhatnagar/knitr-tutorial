## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(fig.path='figure/beamer-',fig.align='center',fig.show='hold',size='footnotesize')

## ----echo=FALSE,results='hide'-------------------------------------------
# some setup
options(width=50)  # make the printing fit on the page
set.seed(1121)   # make the results repeatable
library(ggplot2)

## ----eval=FALSE----------------------------------------------------------
## # create a whole bunch of subsets
## elegirls<-elementary[elementary$sex==0,]
## eleboys<- elementary[elementary$sex==1,]	
## midgirls<-middle[middle$sex==0,]	
## midboys<-middle[middle$sex==1,]	
## highgirls<-highschool[highschool$sex==0,]	
## highboys<-highschool[highschool$sex==1,]	
## 
## # run 'fivenum' function on each subset (8 time)
## fivenum(elegirls$fev)
## ...
## ...

## ----eval=FALSE, tidy=TRUE-----------------------------------------------
## vapply(preschoolgirls, fivenum, c(Min.=0,"1stQu."=0, Median=0,"3rdQu."=0,Max.=0))	
## vapply(preschoolboys, fivenum, c(Min.=0,"1stQu."=0, Median=0,"3rdQu."=0,Max.=0))
## ...

## ----echo=c(-1,-2), tidy=TRUE, eval=FALSE--------------------------------
## fev <- read.csv("~/Dropbox/Fall 2014/EPIB607/Assignments/A1/lung.csv")
## fev$edu <- cut(fev$age, breaks = c(2, 5, 10, 13, Inf), labels = c("preschool",
##     "primary", "middle", "highschool"))
## library(plyr)
## ddply(fev,.(edu,sex),summarise,min=min(fev),"1st"=quantile(fev, 1/4),median=median(fev), mean=mean(fev),"3rd"=quantile(fev,3/4),max=max(fev))

## ----echo=c(-1,-2), tidy=TRUE, echo=FALSE--------------------------------
fev <- read.csv("~/Dropbox/Fall 2014/EPIB607/Assignments/A1/lung.csv")
fev$edu <- cut(fev$age, breaks = c(2, 5, 10, 13, Inf), labels = c("preschool", 
    "primary", "middle", "highschool"))
library(plyr)
ddply(fev,.(edu,sex),summarise,min=min(fev),"1st"=quantile(fev, 1/4),median=median(fev), mean=mean(fev),"3rd"=quantile(fev,3/4),max=max(fev))

## ----eval=FALSE, tidy=TRUE-----------------------------------------------
## # subset the data
## subset(...)
## 
## # then run boxplot function
## boxplot(preschoolgirls$fev,preschoolboys$fev,elementarygirls$fev,
## elementaryboys$fev,	  middleschoolgirls$fev,	  middleschoolboys$fev,	
## highschoolgirls$fev, highschoolboys$fev)

## ------------------------------------------------------------------------
# change 0/1 to male / female
fev$gender <- sapply(fev$sex, function(i) if (i == 1) "Male" else "Female")

# check that edu and gender are Binary/Factor/Character variables
str(fev)

## ----eval=FALSE----------------------------------------------------------
## # initiate ggplot
## p <- ggplot(fev, aes(x=gender, y=fev)) + geom_boxplot()

## ----eval=FALSE----------------------------------------------------------
## # plot by education
## p + facet_grid(~edu)

## ----fig.align='center', out.height='.6\\linewidth', tidy=TRUE-----------
p <- ggplot(fev, aes(x=gender, y=fev)) + geom_boxplot()
p + facet_grid(~edu)

## ----eval=FALSE----------------------------------------------------------
## # initiate ggplot, specify breaks
## m <- ggplot(fev, aes(x = fev)) +
##     geom_histogram(colour = "black", fill = "white", breaks=seq(0,6,0.2))

## ----eval=FALSE----------------------------------------------------------
## # plot FEV by gender
## m + facet_grid(~gender)

## ----fig.align='center', out.height='.6\\linewidth', tidy=TRUE, echo=c(-1,-2)----
# change 0/1 to male / female
fev$gender <- sapply(fev$sex, function(i) if (i == 1) "Male" else "Female")
m <- ggplot(fev, aes(x = fev)) + geom_histogram(colour = "black", fill = "white", breaks=seq(0,6,0.2))
m + facet_grid(~gender)

## ----fig.align='center', out.height='.6\\linewidth', tidy=TRUE-----------
# where 'm' is the same as previous slide
m+facet_grid(gender~edu) 

## ----fig.align='center', out.height='.6\\linewidth', tidy=TRUE-----------
xtabs(~edu+gender, data=fev)

## ----fig.align='center', out.height='.6\\linewidth', tidy=TRUE-----------
# where 'm' is the same as previous slides
m + aes(y = ..density..)+ facet_grid(gender~edu) 

## ----fig.align='center', out.height='.4\\linewidth', tidy=TRUE, echo=FALSE----
m + facet_grid(gender~edu) 

## ----fig.align='center', out.height='.4\\linewidth', tidy=TRUE, echo=FALSE----
m + aes(y = ..density..)+ facet_grid(gender~edu) 

