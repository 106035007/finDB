rm(list=ls())

#
ifelse(!require(quantmod), install.packages('quantmod'), library(quantmod))
tw20_adj_close = read.csv("2018Q4_20.csv")

#
ifelse(!require(readr), install.packages('readr'), library(readr))
tw20.txt = read.table("tw20.txt", header=T)
#tw20.txt<-tw20.txt[-1,]
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

tw20.all<-read.table("D:/FinDB-master/finDB/tw20.txt")
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

library(xts)
data1<-new.env()
data1$prices<-etf4.all.1$`1101`
prices<-data1$prices
prices

sma90<-SMA(prices, 90)
head(sma90, 91)

