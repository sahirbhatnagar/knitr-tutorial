## ---- required-packages ----

getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")

pckg = try(require(knitr))
if(!pckg) {
    cat("Installing 'knitr' from CRAN\n")
    getPckg("knitr")
    require(knitr)
}

pckg = try(require(rmarkdown))
if(!pckg) {
    cat("Installing 'rmarkdown' from CRAN\n")
    getPckg("rmarkdown")
    require(rmarkdown)
}

pckg = try(require(ggplot2))
if(!pckg) {
    cat("Installing 'ggplot2' from CRAN\n")
    getPckg("ggplot2")
    require(ggplot2)
}

pckg = try(require(ggthemes))
if(!pckg) {
    cat("Installing 'ggthemes' from CRAN\n")
    getPckg("ggthemes")
    require(ggthemes)
}

pckg = try(require(devtools))
if(!pckg) {
    cat("Installing 'devtools' from CRAN\n")
    getPckg("devtools")
    require(devtools)
}


