## ---- figure-1 ----
acc1<-read.table("accident.txt",header=T)
counts<-acc1$y
car.table2<-data.frame(expand.grid(severity=c("no","sev"), eject=c("no","yes"),
                                   type=c("col","roll"), weight=c("small","stand")),y=counts)
car.tab2<-xtabs(y ~ weight + severity + type + eject, data=car.table2)
vcd::doubledecker(severity~ type+eject+weight, data=car.tab2)

## ---- figure-2 ----
acc2<-read.table("accident2.txt",header=T)
acc2$severity<-factor(acc2$severity);
acc2$type<-factor(acc2$type);
acc2$weight<-factor(acc2$weight);
acc2$eject<-factor(acc2$eject)
counts<-acc2$y

car.table<-data.frame(expand.grid(weight=c("small","comp","stand"),
                                  eject=c("no","yes"), severity=c("no","mod","sev"),
                                  type=c("cveh","cob","roll","oroll")),counts=counts)

# collapse over eject
car.table.df<-aggregate(counts ~ weight + severity + type, data=car.table, FUN=sum)

#converts data as is shown on question sheet
car.tab<-xtabs(counts ~ weight + severity + type + eject, data=car.table)

vcd::doubledecker(severity~ type+weight, data=car.tab)

