install.packages("quantmod")
library(quantmod)
tickers = c("1101.TW","1102.TW","1216.TW","1301.TW")
getSymbols(tickers,from = '2016-01-01',auto.assign = T)
