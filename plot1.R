## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- transform(NEI, year=factor(year))

png(file="plot1.png")
totalEmissions <- aggregate(NEI$Emissions, by=list(NEI$year), sum)
names(totalEmissions)[names(totalEmissions) == 'Group.1'] <- 'Year'
names(totalEmissions)[names(totalEmissions) == 'x'] <- 'Total_Emissions'
plot(totalEmissions$Year, totalEmissions$Total_Emissions, type="l", xlab="Year", ylab="Total Emissions", main="Total PM2.5 from All Sources")
dev.off()