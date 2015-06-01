## ---- required-packages ----

getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")

pckg = try(require(knitr))
if(!pckg) {
    cat("Installing 'knitr' from CRAN\n")
    getPckg("knitr")
    require(knitr)
}

pckg = try(require(xtable))
if(!pckg) {
    cat("Installing 'xtable' from CRAN\n")
    getPckg("xtable")
    require(xtable)
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


pckg = try(require(ggplot2))
if(!pckg) {
    cat("Installing 'ggplot2' from CRAN\n")
    getPckg("ggplot2")
    require(ggplot2)
}
