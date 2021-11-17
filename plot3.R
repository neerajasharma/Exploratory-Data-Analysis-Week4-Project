#Question 3 :emissions from 1999–2008 for Baltimore City w.r.t type  (point, nonpoint, onroad, nonroad) variable

#calculate total emission in the Baltimore city w.r.t type variable and year
TotalEmissionsBaltimoreType <- NEI %>% subset(fips=="24510") %>% group_by(year,type) %>% summarize(TotalEMbaltimoreType = sum(Emissions, na.rm=TRUE), .groups = 'drop')

#install required R package
library(ggplot2)

# plotting
png(filename ="plot3.png")

qplot(year,TotalEMbaltimoreType,data=TotalEmissionsBaltimoreType,color=type,geom="line")+ggtitle("Total Emissions ")+ylab("Total Emissions in the Baltimore city w.r.t type variable")+xlab("Year")


dev.off()