rm(list=ls())

#
ifelse(!require(quantmod), install.packages('quantmod'), library(quantmod))
tw20_adj_close = read.csv("2018Q4_20.csv")
head(tw20_adj_close)

#
ifelse(!require(readr), install.packages('readr'), library(readr))
tw20.txt = read.table("tw20.txt", header=T)
#tw20.txt<-tw20.txt[-1,]
head(tw20.txt)
str(tw20.txt)
#
ifelse(!require(reshape2), install.packages('reshape2'), library(reshape2))
colnames(tw20.txt)<-c("id","", "date", "price")
tw20.xts = dcast(tw20.txt, date~id)
str(tw20.xts)
#
tw20.xts$date<-as.Date(as.character(tw20.xts$date), "%Y%m%d") 
library(xts)
tw20.xts.1<-xts(tw20.xts[,-1], order.by = tw20.xts$date)
saveRDS(tw20.xts.1,"tw20.xts.rds")
library(quantmod)
tw20.mon.ret <- to.monthly(tw20.xts.1, indexAt = "lastof", OHLC=FALSE)
head(tw20.mon.ret)
library(PerformanceAnalytics)
library(magrittr)
tw20.day.ret <-Return.calculate(tw20.xts.1, method = "log")
head(tw20.day.ret)

#
con = gzcon(url('http://www.systematicportfolio.com/sit.gz', 'rb'))
source(con)
close(con)
load.packages('quantmod')

tw20.all<-readRDS("C:/Users/Sarah/Desktop/finDB-master/finDB/tw20.xts.rds")
head(tw20.all)
str(tw20.all)
tw20.all.1<-tw20.all[complete.cases(tw20.all),]
head(tw20.all.1)
tail(tw20.all.1)

library(xts)
data1<-new.env()
data1$prices<-tw20.all.1$`1101`
prices<-data1$prices
prices

sma90<-SMA(prices, 90)
head(sma90, 91)

bt.prep(data1, align='keep.all')
names(data1)
data1$dates
data1$prices
data1$prices = prices
data1$prices

data1$weight
data1$execution.price = data1$prices = tw20.all.1$`1101`
data1$weight[] = 1
buy.hold.1101 <- bt.run.share(data1, clean.signal=F, trade.summary = TRUE)
buy.hold.1101 <-bt.run(data1)

prices<-data1$prices
sma90<-SMA(prices, 90)
head(sma90, 91)
data1$weight[] <- iif(prices >= sma90, 1, 0)
sma90.1101 <- bt.run(data1, trade.summary=T)
sma90.1101$trade.summary

data1$weight[] <- iif(prices >= sma90, 1, -1)
sma90.1101.short <- bt.run(data1, trade.summary=T)

models<-list("SMA90"= sma90.1101, 
             "SMA90_short" = sma90.1101.short, 
             "BH 1101" = buy.hold.1101)
strategy.performance.snapshoot(models, T)
strategy.performance.snapshoot(models, control=list(comparison=T), sort.performance=T)
plotbt.strategy.sidebyside(models, return.table=T)

library(ggplot2)
all.1101<-merge.xts(sma90.1101$equity, 
                    sma90.1101.short$equity, 
                    buy.hold.1101$equity)
colnames(all.1101)<-c("sma90", "sma90 short", "BH")
head(all.1101)
all.1101.long<-fortify(all.1101, melt=T)
head(all.1101.long)
#
title = "Cumulative returns of 1101s"
p = ggplot(all.1101.long, aes(x = Index, y = Value)) +
  geom_line(aes(linetype = Series, color = Series)) +
  #geom_point(aes(shape = Series))+
  xlab("year") + ylab("cumulative returns")+
  ggtitle(title)
p

#1216
library(xts)
data1<-new.env()
data1$prices<-tw20.all.1$`1216`
prices<-data1$prices
prices

sma90<-SMA(prices, 90)
head(sma90, 91)

bt.prep(data1, align='keep.all')
names(data1)
data1$dates
data1$prices
data1$prices = prices
data1$prices

data1$weight
data1$execution.price = data1$prices = tw20.all.1$`1216`
data1$weight[] = 1
buy.hold.1216 <- bt.run.share(data1, clean.signal=F, trade.summary = TRUE)
buy.hold.1216 <-bt.run(data1)

prices<-data1$prices
sma90<-SMA(prices, 90)
head(sma90, 91)
data1$weight[] <- iif(prices >= sma90, 1, 0)
sma90.1216 <- bt.run(data1, trade.summary=T)
sma90.1216$trade.summary

data1$weight[] <- iif(prices >= sma90, 1, -1)
sma90.1216.short <- bt.run(data1, trade.summary=T)

models<-list("SMA90"= sma90.1216, 
             "SMA90_short" = sma90.1216.short, 
             "BH 1101" = buy.hold.1216)
strategy.performance.snapshoot(models, T)
strategy.performance.snapshoot(models, control=list(comparison=T), sort.performance=T)
plotbt.strategy.sidebyside(models, return.table=T)

library(ggplot2)
all.1216<-merge.xts(sma90.1216$equity, 
                    sma90.1216.short$equity, 
                    buy.hold.1216$equity)
colnames(all.1216)<-c("sma90", "sma90 short", "BH")
head(all.1216)
all.1216.long<-fortify(all.1216, melt=T)
head(all.1216.long)
#
title = "Cumulative returns of 1216s"
p = ggplot(all.1216.long, aes(x = Index, y = Value)) +
  geom_line(aes(linetype = Series, color = Series)) +
  #geom_point(aes(shape = Series))+
  xlab("year") + ylab("cumulative returns")+
  ggtitle(title)
p


#1301
library(xts)
data1<-new.env()
data1$prices<-tw20.all.1$`1301`
prices<-data1$prices
prices

sma90<-SMA(prices, 90)
head(sma90, 91)

bt.prep(data1, align='keep.all')
names(data1)
data1$dates
data1$prices
data1$prices = prices
data1$prices

data1$weight
data1$execution.price = data1$prices = tw20.all.1$`1301`
data1$weight[] = 1
buy.hold.1301 <- bt.run.share(data1, clean.signal=F, trade.summary = TRUE)
buy.hold.1301 <-bt.run(data1)

prices<-data1$prices
sma90<-SMA(prices, 90)
head(sma90, 91)
data1$weight[] <- iif(prices >= sma90, 1, 0)
sma90.1301 <- bt.run(data1, trade.summary=T)
sma90.1301$trade.summary

data1$weight[] <- iif(prices >= sma90, 1, -1)
sma90.1301.short <- bt.run(data1, trade.summary=T)

models<-list("SMA90"= sma90.1301, 
             "SMA90_short" = sma90.1301.short, 
             "BH 1301" = buy.hold.1301)
strategy.performance.snapshoot(models, T)
strategy.performance.snapshoot(models, control=list(comparison=T), sort.performance=T)
plotbt.strategy.sidebyside(models, return.table=T)

library(ggplot2)
all.1301<-merge.xts(sma90.1301$equity, 
                    sma90.1301.short$equity, 
                    buy.hold.1301$equity)
colnames(all.1301)<-c("sma90", "sma90 short", "BH")
head(all.1301)
all.1301.long<-fortify(all.1301, melt=T)
head(all.1301.long)
#
title = "Cumulative returns of 1301s"
p = ggplot(all.1301.long, aes(x = Index, y = Value)) +
  geom_line(aes(linetype = Series, color = Series)) +
  #geom_point(aes(shape = Series))+
  xlab("year") + ylab("cumulative returns")+
  ggtitle(title)
p
