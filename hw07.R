etf4.all<-readRDS("etf4_xts_all")
head(etf4.all)
etf4.all.1 = etf4.all[complete.cases(etf4.all),]
head(etf4.all.1)

