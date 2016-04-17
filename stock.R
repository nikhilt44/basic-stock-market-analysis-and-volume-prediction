
#install.packages("quantmod")
#install.packages("devtools")
#install_github('quandl/R-package')
#install.packages("googleVis")
library(googleVis)
library(devtools)
library(Quandl)
library("quantmod")

rm(list=ls())

#st_data = read.csv("data_HCL.csv")

st_data = Quandl("NSE/HCLTECH", type = "xts")
ncol(st_data)

names(st_data)[6]<-"Volume"
names(st_data)[7]<-"Turnover"
st_data1 = st_data;
st_data1$Turnover = NULL
st_data1$Last = NULL


st_data$Volume = NULL
st_data$Turnover = NULL
st_data$Last = NULL


#m = data.frame(date = as.Date(index(st_data)) , open = as.numeric(st_data$Open) , close = as.numeric(st_data$Close) , high = as.numeric(st_data$High) , low = as.numeric(st_data$Low))

p = gvisCandlestickChart(m, xvar = "date", low = "low", open = "open", close = "close",
                     high = "high", options=list(legend='none'))
plot(p)


#getSymbols('HCLTECH.NS',src='yahoo') 
#st_data <- HCLTECH.NS['2008-01-01::2016-01-01'] # download from 01/01/2015 till 31/05/2015 
chartSeries(st_data1 , subset = 'last 3 months')
addBBands(n = 20, sd = 2, ma = "SMA", draw = 'bands', on = -1)


st_data
dim(st_data)

#addBBands()
candleChart(st_data,multi.col=TRUE,theme='white')

