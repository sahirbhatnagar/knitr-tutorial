## ---- required-packages ----

getPckg <- function(pckg) install.packages(pckg, repos = "http://cran.r-project.org")

pckg = try(require(knitr))
if(!pckg) {
  cat("Installing 'knitr' from CRAN\n")
  getPckg("knitr")
  require(knitr)
}
