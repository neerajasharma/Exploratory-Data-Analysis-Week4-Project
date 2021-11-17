#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

#Subset motor vehicle sources in Baltimore City & Los Angeles County
NEIfipstypeBaltimore <- subset(NEI, fips =="24510" & type =="ON-ROAD" )
NEIfipstypeLosAngeles <- subset(NEI, fips =="06037" & type =="ON-ROAD" )
#calculate total emission  for each year in Baltimore City & Los Angeles County
TotalEmissionsBal <- NEIfipstypeBaltimore %>% group_by(year) %>% summarize(TotalEM = sum(Emissions, na.rm=TRUE))
TotalEmissionsLA <- NEIfipstypeLosAngeles %>% group_by(year) %>% summarize(TotalEM = sum(Emissions, na.rm=TRUE))

TotalEmissionsBal1 <- cbind(TotalEmissionsBal, "city"="bal")
TotalEmissionsLA1 <- cbind(TotalEmissionsLA, "city"="LA")

TotalEmissionsfinal <- rbind(TotalEmissionsBal1,TotalEmissionsLA1)

#plotting
library(ggplot2)

png("plot6.png")

qplot(year,TotalEM,data=TotalEmissionsfinal,color=city,geom="point")+ggtitle("Total Emissions ")+ylab("Total Emissions in the Baltimore & LA")+xlab("Year")

dev.off()