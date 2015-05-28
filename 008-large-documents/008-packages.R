## ---- required-packages ----

getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")

pckg = try(require(knitr))
if(!pckg) {
    cat("Installing 'knitr' from CRAN\n")
    getPckg("knitr")
    require(knitr)
}


pckg = try(require(vcd))
if(!pckg) {
    cat("Installing 'vcd' from CRAN\n")
    getPckg("vcd")
    require(vcd)
}


