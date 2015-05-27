## ---- required-packages ----

getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")

pckg = try(require(knitr))
if(!pckg) {
    cat("Installing 'knitr' from CRAN\n")
    getPckg("knitr")
    require(knitr)
}

pckg = try(require(ALL))
if(!pckg) {
    cat("Installing 'ALL' from Bioconductor\n")
    source("http://bioconductor.org/biocLite.R")
    biocLite("ALL")
    require(ALL)
}

pckg = try(require(gplots))
if(!pckg) {
    cat("Installing 'gplots' from CRAN\n")
    getPckg("gplots")
    require(gplots)
}