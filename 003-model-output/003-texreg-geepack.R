## ---- texreg-extractor-geeglm ----
extract.geepack <- function(model) {
    s <- summary(model)
    names <- rownames(s$coef)
    co <- s$coef[, 1]
    se <- s$coef[, 2]
    pval <- s$coef[, 4]
    
    n <- nrow(model.frame(model))
    nclust <- length(s$geese$clusz)
    
    gof = c(n, nclust)
    gof.names = c("Num. obs.", "Num. clust.")
    
    tr <- createTexreg(
        coef.names = names,
        coef = co,
        se = se,
        pvalues = pval,
        gof.names = gof.names,
        gof = gof,
        gof.decimal = rep(FALSE, length(gof))
    )
    return(tr)
}

setMethod("extract", signature = className("geeglm", "geepack"),
          definition = extract.geepack)

## example from the geeglm documentation
# data(dietox)
# dietox$Cu <- as.factor(dietox$Cu)
# gee1      <- geeglm(Weight ~ Cu * (Time + I(Time^2) + I(Time^3)),
#                     data = dietox,
#                     id = Pig,
#                     family = poisson("identity"),
#                     corstr="ar1")       # What the heck are we fitting?? 
# summary(gee1)
# 
# screenreg(gee1)
# texreg(gee1)
