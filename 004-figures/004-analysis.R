## ----multiplot-fun----
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}



## ---- data-clean-1 ----
dat <- read.table("SOCATT.DAT", colClasses=c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
colnames(dat) <- c("Districts", "Subject", "Year", "Score", "Party", "SocialClass", "Gender", "Age", "Religion")
dat$Age_Cur <- dat$Age + dat$Year - 1
dat$Year <- as.factor(dat$Year + 1982)
dat$Gender <- factor(dat$Gender, labels =c("Male","Female"))
dat$Party <- factor(dat$Party, labels =c("Conserv","Labour", "Liberal","Other", "None"))  # Liberal* = Liberal/SDP/Alliance
dat$Religion <- factor(dat$Religion, labels =c("Catholic","Protestant", "Other","None"))
dat$SocialClass <- factor(dat$SocialClass, labels =c("Middle","Upper", "Lower"))


## ---- data-clean-2 ----
DT <- as.data.table(read.table("SOCATT.DAT"))
setnames(DT, c("District","id","year","answers","party","ses","sex","age","religion"))
DT[,`:=`(party=factor(ifelse(party==1,"Conserv",ifelse(party==2,"Labour",
                                                       ifelse(party==3,"Liberal",ifelse(party==4,"Other","None"))))),
         answers.f=factor(answers,ordered = TRUE),
         ses=ifelse(ses==1,2,ifelse(ses==2,3,1)), sex=factor(ifelse(sex==1,"Male","Female")),
         religion=factor(ifelse(religion==1,"Catholic",ifelse(religion==2,"Protestant",
                                                              ifelse(religion==3,"Other","None")))),
         year=ifelse(year==1,1983,ifelse(year==2,1984,ifelse(year==4,1985,1986))))]
DT[,`:=`(ses=factor(ifelse(ses==1,"lower",ifelse(ses==2,"middle","upper")),ordered = T))]


## ---- figure-1 ---- 

g1 <- ggplot(data=dat, aes(x=Year, y=Score)) + geom_boxplot() + ggtitle("Scores with different years")    # http://en.wikipedia.org/wiki/The_Silent_Scream
g2 <- ggplot(data=dat, aes(x=Gender, y=Score)) + geom_boxplot() + ggtitle("Scores with different gender") # + facet_grid(. ~ Year) 
g3 <- ggplot(data=dat, aes(x=Age, y=Score)) + geom_point() + geom_smooth(aes(group = 1), method = "loess", size = 2) + ggtitle("Scores with different baseline ages") + xlab("Current Age")#  + facet_grid(. ~ Gender)
g4 <- ggplot(data=dat, aes(x=Party, y=Score)) + geom_boxplot() + ggtitle("Scores with different parties") # + facet_grid(. ~ Year)  + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
g5 <- ggplot(data=dat, aes(x=SocialClass, y=Score)) + geom_boxplot() + ggtitle("Scores with different slcoal classes")# + facet_grid(. ~ Year) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
g6 <- ggplot(data=dat, aes(x=Religion, y=Score)) + geom_boxplot()  +  ggtitle("Scores with different religions")# + facet_grid(. ~ Year) + theme(axis.text.x = element_text(angle = 90, hjust = 1)) 
multiplot(g1, g2, g3, g4, g5, g6, cols=2)


## ---- figure-2 ----
set.seed(123455)
sample.id <- sample(unique(DT$id),30)
xyplot(answers~factor(year), group=id, data=DT[id %in% sample.id], type=c("l","p"), lty=2, xlab="year", 
       ylab="score",aspect="xy", main="response profiles for a random sample of 30 subjects")
xyplot(answers ~ factor(year), group=id  , data=DT[id %in% sample.id], type=c("r"), aspect="xy", xlab="year",
       ylab="score",index.cond = function(x, y) coef(lm(y ~ x))[1],
       main="Least squares fits (with year) for the same random sample of 30 subjects")


## ----figure-3----
m <- ggplot(DT, aes(x=answers))

m + geom_histogram(aes(y = ..density..),binwidth = 1,colour = "darkgreen", fill = "white")+
    facet_grid(party~year)+labs(title="Response by year and political party")

m + geom_histogram(aes(y = ..density..),binwidth = 1,colour = "darkgreen", fill = "white")+
    facet_grid(ses~year)+labs(title="Response by year and SES")

m + geom_histogram(aes(y = ..density..),binwidth = 1,colour = "darkgreen", fill = "white")+
    facet_grid(religion~year)+labs(title="Response by year and religion")

