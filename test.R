
library(googleVis)
library(devtools)
library(Quandl)
library(quantmod)

a = Quandl("NSE/HCLTECH", type="raw" , start_date="2016-02-01", end_date="2016-03-30");

#a = Quandl("GOOG/NASDAQ_GOOG", type="raw");

write.csv(a, file = "Data_goog.csv")

ncol(a);

names(a)[7]<-"Volume"
names(a)[8]<-"Turnover"

a$Volume = NULL
a$Turnover = NULL
a$Last = NULL

p = gvisCandlestickChart(a, xvar = "Date", low = "Low", open = "Open", close = "Close",
                         high = "High", options=list(legend='none'))
plot(p)

chartSeries(a , subset = 'last 2 months')
addBBands(n = 20, sd = 2, ma = "SMA", draw = 'bands', on = -1)

