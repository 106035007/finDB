etf4.all<-readRDS("etf4_xts_all")
head(etf4.all)
etf4.all.1 = etf4.all[complete.cases(etf4.all),]
head(etf4.all.1)






etf4.all<-readRDS("D:/FinDB-master/finDB/etf4_xts_all")
head(etf4.all)
str(etf4.all)
etf4.all.1<-etf4.all[complete.cases(etf4.all),]
head(etf4.all.1)
tail(etf4.all.1)
# 0050
library(xts)
data1<-new.env()
data1$prices<-etf4.all.1$`0050`
prices<-data1$prices
prices

sma50<-SMA(prices, 50)
head(sma50, 51)

# 0056
library(xts)
data1<-new.env()
data1$prices<-etf4.all.1$`0056`
prices<-data1$prices
prices

sma56<-SMA(prices, 50)
head(sma50, 51)

# 006205
library(xts)
data1<-new.env()
data1$prices<-etf4.all.1$`006205`
prices<-data1$prices
prices


sma6205<-SMA(prices, 50)
head(sma50, 51)

# 00646
library(xts)
data1<-new.env()
data1$prices<-etf4.all.1$`00646`
prices<-data1$prices
prices

sma646<-SMA(prices, 50)
head(sma50, 51)

# buy and hold for 0050
bt.prep(data1, align='keep.all')
names(data1)
data1$dates
data1$prices
data1$prices = prices
data1$prices

data1$weight
data1$execution.price = data1$prices = etf4.all.1$`0050`
data1$weight[] = 1
buy.hold.0050 <- bt.run.share(data1, clean.signal=F, trade.summary = TRUE)
buy.hold.0050 <-bt.run(data1)

#0056
bt.prep(data1, align='keep.all')
names(data1)
data1$dates
data1$prices
data1$prices = prices
data1$prices

data1$weight
data1$execution.price = data1$prices = etf4.all.1$`0056`
data1$weight[] = 1
buy.hold.0056 <- bt.run.share(data1, clean.signal=F, trade.summary = TRUE)
buy.hold.0056 <-bt.run(data1)

#006205
bt.prep(data1, align='keep.all')
names(data1)
data1$dates
data1$prices
data1$prices = prices
data1$prices

data1$weight
data1$execution.price = data1$prices = etf4.all.1$`006205`
data1$weight[] = 1
buy.hold.006205 <- bt.run.share(data1, clean.signal=F, trade.summary = TRUE)
buy.hold.006205 <-bt.run(data1)

#00646
bt.prep(data1, align='keep.all')
names(data1)
data1$dates
data1$prices
data1$prices = prices
data1$prices

data1$weight
data1$execution.price = data1$prices = etf4.all.1$`00646`
data1$weight[] = 1
buy.hold.00646 <- bt.run.share(data1, clean.signal=F, trade.summary = TRUE)
buy.hold.00646 <-bt.run(data1)

# sma 200 for 0050
prices<-data1$prices
sma200<-SMA(prices, 200)
head(sma200, 201)
data1$weight[] <- iif(prices >= sma200, 1, 0)
sma200.0050 <- bt.run(data1, trade.summary=T)
sma200.0050$trade.summary

#0056
prices<-data1$prices
sma200<-SMA(prices, 200)
head(sma200, 201)
data1$weight[] <- iif(prices >= sma200, 1, 0)
sma200.0056 <- bt.run(data1, trade.summary=T)
sma200.0056$trade.summary

#006205
prices<-data1$prices
sma200<-SMA(prices, 200)
head(sma200, 201)
data1$weight[] <- iif(prices >= sma200, 1, 0)
sma200.006205 <- bt.run(data1, trade.summary=T)
sma200.006205$trade.summary

#00646
prices<-data1$prices
sma200<-SMA(prices, 200)
head(sma200, 201)
data1$weight[] <- iif(prices >= sma200, 1, 0)
sma200.00646 <- bt.run(data1, trade.summary=T)
sma200.00646$trade.summary

# sma 50 for 0050
sma50<-SMA(prices, 50)
head(sma50, 51)
data1$weight[] <- iif(prices >= sma50, 1, 0)
sma50.0050 <- bt.run(data1, trade.summary=T)

#0056
sma50<-SMA(prices, 50)
head(sma50, 51)
data1$weight[] <- iif(prices >= sma50, 1, 0)
sma50.0056 <- bt.run(data1, trade.summary=T)

#006205
sma50<-SMA(prices, 50)
head(sma50, 51)
data1$weight[] <- iif(prices >= sma50, 1, 0)
sma50.006205 <- bt.run(data1, trade.summary=T)

#00646
sma50<-SMA(prices, 50)
head(sma50, 51)
data1$weight[] <- iif(prices >= sma50, 1, 0)
sma50.00646 <- bt.run(data1, trade.summary=T)

# sma 50 for 005, short allowed
data1$weight[] <- iif(prices >= sma50, 1, -1)
sma50.0050.short <- bt.run(data1, trade.summary=T)

#0056
data1$weight[] <- iif(prices >= sma50, 1, -1)
sma50.0056.short <- bt.run(data1, trade.summary=T)

#006205
data1$weight[] <- iif(prices >= sma50, 1, -1)
sma50.006205.short <- bt.run(data1, trade.summary=T)

#00646
data1$weight[] <- iif(prices >= sma50, 1, -1)
sma50.00646.short <- bt.run(data1, trade.summary=T)


# summary of investment
models<-list("SMA50"= sma50.0050, 
             "SMA200"= sma200.0050, 
             "SMA50_short" = sma50.0050.short, 
             "BH 0050" = buy.hold.0050)
strategy.performance.snapshoot(models, T)
strategy.performance.snapshoot(models, control=list(comparison=T), sort.performance=T)
plotbt.strategy.sidebyside(models, return.table=T)

#0056
models<-list("SMA50"= sma50.0056, 
             "SMA200"= sma200.0056,
             "SMA50_short" = sma50.0056.short, 
             "BH 0050" = buy.hold.0056)
strategy.performance.snapshoot(models, T)
strategy.performance.snapshoot(models, control=list(comparison=T), sort.performance=T)
plotbt.strategy.sidebyside(models, return.table=T)

#006205
models<-list("SMA50"= sma50.006205, 
             "SMA200"= sma200.006205, 
             "SMA50_short" = sma50.006205.short, 
             "BH 0050" = buy.hold.006205)
strategy.performance.snapshoot(models, T)
strategy.performance.snapshoot(models, control=list(comparison=T), sort.performance=T)
plotbt.strategy.sidebyside(models, return.table=T)

#00646
models<-list("SMA50"= sma50.00646, 
             "SMA200"= sma200.00646, 
             "SMA50_short" = sma50.00646.short, 
             "BH 0050" = buy.hold.00646)
strategy.performance.snapshoot(models, T)
strategy.performance.snapshoot(models, control=list(comparison=T), sort.performance=T)
plotbt.strategy.sidebyside(models, return.table=T)


# You can plot in ggplot2
library(ggplot2)
all.0050<-merge.xts(sma50.0050$equity, 
                    sma50.0050.short$equity, 
                    sma200.0050$equity, 
                    buy.hold.0050$equity)
colnames(all.0050)<-c("sma50", "sma50 short", "sma200", "BH")
head(all.0050)
all.0050.long<-fortify(all.0050, melt=T)
head(all.0050.long)
#
title = "Cumulative returns of 0050s"
p = ggplot(all.0050.long, aes(x = Index, y = Value)) +
  geom_line(aes(linetype = Series, color = Series)) +
  #geom_point(aes(shape = Series))+
  xlab("year") + ylab("cumulative returns")+
  ggtitle(title)
p

#0056
library(ggplot2)
all.0056<-merge.xts(sma50.0056$equity, 
                    sma50.0056.short$equity, 
                    sma200.0056$equity, 
                    buy.hold.0056$equity)
colnames(all.0056)<-c("sma50", "sma50 short", "sma200", "BH")
head(all.0056)
all.0056.long<-fortify(all.0056, melt=T)
head(all.0056.long)
#
title = "Cumulative returns of 0056s"
p = ggplot(all.0056.long, aes(x = Index, y = Value)) +
  geom_line(aes(linetype = Series, color = Series)) +
  #geom_point(aes(shape = Series))+
  xlab("year") + ylab("cumulative returns")+
  ggtitle(title)
p


#006205
library(ggplot2)
all.006205<-merge.xts(sma50.006205$equity, 
                    sma50.006205.short$equity, 
                    sma200.006205$equity, 
                    buy.hold.006205$equity)
colnames(all.006205)<-c("sma50", "sma50 short", "sma200", "BH")
head(all.006205)
all.006205.long<-fortify(all.006205, melt=T)
head(all.0050.long)
#
title = "Cumulative returns of 006205s"
p = ggplot(all.006205.long, aes(x = Index, y = Value)) +
  geom_line(aes(linetype = Series, color = Series)) +
  #geom_point(aes(shape = Series))+
  xlab("year") + ylab("cumulative returns")+
  ggtitle(title)
p


#00646
library(ggplot2)
all.00646<-merge.xts(sma50.00646$equity, 
                    sma50.00646.short$equity, 
                    sma200.00646$equity, 
                    buy.hold.00646$equity)
colnames(all.00646)<-c("sma50", "sma50 short", "sma200", "BH")
head(all.00646)
all.00646.long<-fortify(all.00646, melt=T)
head(all.00646.long)
#
title = "Cumulative returns of 00646s"
p = ggplot(all.00646.long, aes(x = Index, y = Value)) +
  geom_line(aes(linetype = Series, color = Series)) +
  #geom_point(aes(shape = Series))+
  xlab("year") + ylab("cumulative returns")+
  ggtitle(title)
p


