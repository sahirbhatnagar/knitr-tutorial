## ---- required-packages ----

getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")

pckg = try(require(knitr))
if(!pckg) {
    cat("Installing 'knitr' from CRAN\n")
    getPckg("knitr")
    require(knitr)
}

pckg = try(require(texreg))
if(!pckg) {
    cat("Installing 'texreg' from CRAN\n")
    getPckg("texreg")
    require(texreg)
}

pckg = try(require(MASS))
if(!pckg) {
    cat("Installing 'MASS' from CRAN\n")
    getPckg("MASS")
    require(MASS)
}

pckg = try(require(xtable))
if(!pckg) {
    cat("Installing 'xtable' from CRAN\n")
    getPckg("xtable")
    require(xtable)
}

pckg = try(require(geepack))
if(!pckg) {
    cat("Installing 'geepack' from CRAN\n")
    getPckg("geepack")
    require(geepack)
}

pckg = try(require(lme4))
if(!pckg) {
    cat("Installing 'lme4' from CRAN\n")
    getPckg("lme4")
    require(lme4)
}

pckg = try(require(data.table))
if(!pckg) {
    cat("Installing 'data.table' from CRAN\n")
    getPckg("data.table")
    require(data.table)
}

pckg = try(require(dplyr))
if(!pckg) {
    cat("Installing 'dplyr' from CRAN\n")
    getPckg("dplyr")
    require(dplyr)
}

