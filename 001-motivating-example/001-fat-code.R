# 1. Percent body fat using Method 1: 457/Density - 414.2
# 2. Age (yrs)
# 3. Weight (lbs)
# 4. Height (inches)
# 5. Neck circumference (cm)
# 6. Chest circumference (cm)
# 7. Abdomen circumference (cm) “at the umbilicus and level with the iliac crest”
# 8. Hip circumference (cm)
# 9. Thigh circumference (cm)
# 10. Knee circumference (cm)
# 11 Ankle circumference (cm)
# 12. Extended biceps circumference (cm)
# 13. Forearm circumference (cm)
# 14. Wrist circumference (cm) “distal to the styloid processes”
#######################################################################

## ---- import-data ----
DT <- data.table::fread("fat-data.csv")

## ---- fig-pairs ----
pairs(~pbf1+age+weight+neck+abdomen+forearm+ wrist,data=DT,main="Simple Scatterplot Matrix of Fat data")

## ---- linear-regression ----
fit1 <- lm(pbf1~., data=DT)
texreg::texreg(fit1, digits=2, caption='Multiple Linear Regression of the Body Fat Data', label = "tab:results", booktabs = TRUE, dcolumn = TRUE, single.row = TRUE, use.packages = FALSE)

## ---- fig-diagnostics ----
par(mfrow=c(2,2))
plot(fit1)

## ---- influence-plot ----
car::influencePlot(fit1)


# Sensitivity Analysis ----------------------------------------------------

## ---- linear-regression2 ----
DT <- DT[-c(42),,]
fit2 <- lm(pbf1~., data=DT)
texreg::texreg(list(fit1,fit2), digits=2,custom.model.names = c("With obs. 42","Without obs. 42"), caption='Sensitivity analsysis; Multiple Linear Regression of the Body Fat Data', label = "tab:results2", booktabs = TRUE, dcolumn = TRUE, single.row = TRUE, use.packages = FALSE)

## ---- fig-diagnostics2 ----
par(mfrow=c(2,2))
plot(fit2)

## ---- influence-plot2 ----
car::influencePlot(fit2)




