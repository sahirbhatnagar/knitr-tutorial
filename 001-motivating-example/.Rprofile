getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")

pckg = try(require(data.table))
if(!pckg) {
    cat("Installing 'data.table' from CRAN\n")
    getPckg(data.table)
    require(data.table)
}

pckg = try(require(dplyr))
if(!pckg) {
    cat("Installing 'dplyr' from CRAN\n")
    getPckg(dplyr)
    require(dplyr)
}

pckg = try(require(texreg))
if(!pckg) {
    cat("Installing 'texreg' from CRAN\n")
    getPckg(texreg)
    require(texreg)
}

pckg = try(require(car))
if(!pckg) {
    cat("Installing 'car' from CRAN\n")
    getPckg(car)
    require(car)
}


pckg = try(require(MASS))
if(!pckg) {
    cat("Installing 'MASS' from CRAN\n")
    getPckg(MASS)
    require(MASS)
}



