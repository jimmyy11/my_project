#612 Project 1: Find top 10 highest and lowest growth countries between 1952 and 2007 - by both total and percent difference. Plotted change over time by continent
gapminder <- read.table(file="data/gapminder-FiveYearData.csv", sep = "," , header=T)
library(plyr)
library(ggplot2)
gap1952 <- cbind(gapminder$country[gapminder$year== "1952"], gapminder$gdpPercap[gapminder$year== "1952"])
gap2007 <- cbind(gapminder$country[gapminder$year== "2007"], gapminder$gdpPercap[gapminder$year== "2007"])
gapGdpGrowth <- gap2007 - gap1952
gapGdpGrowth[,1] <- gap2007[,1] #I want to readd in the countries  - there is likely a simpler (one line) way of doing this
highest10total <- cbind.data.frame(gapminder$country[gapminder$year == "2007"][head(sort.list(gapGdpGrowth[,2], decreasing = TRUE),10)], head(sort(gapGdpGrowth[,2], decreasing = TRUE),10))  #10 max total- goal here is to remove all duplicate country names and then output the name of the ones chosen in brackets
lowest10total <- cbind.data.frame(gapminder$country[gapminder$year == "2007"][head(sort.list(gapGdpGrowth[,2]),10)], head(sort(gapGdpGrowth[,2]),10)) #10 worst total
gapGdpGrowthPercent <- gap2007/gap1952*100 
gapGdpGrowthPercent[,1] <- gap2007[,1]
highest10percent <- cbind.data.frame(gapminder$country[gapminder$year == "2007"][head(sort.list(gapGdpGrowthPercent[,2], decreasing = TRUE),10)],head(sort(gapGdpGrowthPercent[,2], decreasing = TRUE),10)) #10 highest percent
lowest10percent <- cbind.data.frame(gapminder$country[gapminder$year == "2007"][head(sort.list(gapGdpGrowthPercent[,2]),10)], head(sort(gapGdpGrowthPercent[,2]),10)) #10 lowest percent
names(highest10total)[1] <- "Most Growth Countries"
names(highest10total)[2] <- "GDP Change"
names(lowest10total)[1] <- "Lowest Growth Countries"
names(lowest10total)[2] <- "GDP Change"
names(highest10percent)[1] <- "Most % Growth Countries"
names(highest10percent)[2] <- "% GDP Change"
names(lowest10percent)[1] <- "Least % Growth Countries"
names(lowest10percent)[2] <- "% GDP Change"
combinedGapResults <- cbind.data.frame(highest10total, highest10percent, lowest10total, lowest10percent)
gapGdpContinent <- ddply(.data = gapminder, .variables = c("continent","year") , .fun = function(x) mean(x$gdpPercap)) #flaw here is that this isnt a real gdp per cap, doesnt take into account differing populations
print(combinedGapResults)
my_plot <- ggplot(data = gapGdpContinent, aes(x = year, y = V1, color = continent)) + geom_point() + scale_y_log10() + labs(y = "Gdp Per Capita")
print(my_plot)