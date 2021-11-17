# base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

#set working directory
setwd("C:/Users/b002882/Documents/exploratorydata_w4")

#unzip the downloaded file
unzip (zipfile = "C:/Users/b002882/Documents/exploratorydata_w4/exdata_data_NEI_data.zip",exdir="C:/Users/b002882/Documents/exploratorydata_w4/exdata_data_NEI_data")

#set working directory to the location where we extracted unzip file
setwd("C:/Users/b002882/Documents/exploratorydata_w4/exdata_data_NEI_data")

# read each of the two files using the readRDS() function 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#install required R package
library(dplyr)

#calculate total emission from all sources for each year
TotalEmissions <- NEI %>% group_by(year) %>% summarize(TotalEM = sum(Emissions, na.rm=TRUE))

#plotting
png("plot1.png")

with(TotalEmissions,plot(x=year,y=TotalEM,ylab="Total Emission ",xlab="Year",pch=19,cex=2, col="blue",lwd=3))

dev.off()
