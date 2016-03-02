heights <- c(34, 54, 34, 50, 53, 56,60)
ave_height <- mean(heights)
sd_height <- sd(heights)
# IPLOT FOR FUN
plot_life_expectancy <- function(country_name, color){
  
  country <- gapminder[gapminder$country == country_name,]
  plot(country$year, country$lifeExp, xlab="Year", ylab = "Life Expectancy", ylim = c(0,80), type = "l", main = country_name, col = color)
  
}
plot_life_more_expectancy <- function(country_name, color){
  
  country <- gapminder[gapminder$country == country_name,]
  points(country$year, country$lifeExp, xlab="Year", ylab = "Life Expectancy", ylim = c(0,80), type = "l", main = country_name, col = color)
  
}
plot_life_expectancy(country_name = "Zimbabwe", color = "blue")
plot_life_more_expectancy(country_name = "Canada", color = "red")
plot_life_more_expectancy(country_name = "Japan", color = "yellow")