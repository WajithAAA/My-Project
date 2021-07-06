setwd("D:\\Workshops\\R Programming for Data Science Workshop\\Part 03 - Data Visualization\\Datasets")
data=read.csv("gapminder.CSV")
head(data)

#install.packages("ggplot2")
library(ggplot2)

#Demonstration of the concepts using a scatter plot
#Creating a grid for drawing with axes
ggplot(data, aes(x = gdpPercap, y = lifeExp))

#Draw the graph
ggplot(data, aes(x = gdpPercap, y = lifeExp))+geom_point()

#Adding more aesthetics
ggplot(data, aes(x = gdpPercap, y = lifeExp))+geom_point(alpha = 0.5)
ggplot(data, aes(x = gdpPercap, y = lifeExp))+
  geom_point(alpha = 0.3, col = "grey")
ggplot(data, aes(x = gdpPercap, y = lifeExp))+
  geom_point(alpha = 0.5, col = "red", size = 2)

#Color the points with another category
ggplot(data, aes(x = gdpPercap, y = lifeExp, color=continent))+
  geom_point(alpha = 0.5, size = 2)
#This is overwritten by the color in the geom
ggplot(data, aes(x = gdpPercap, y = lifeExp, color=continent))+
  geom_point(alpha = 0.5, size = 2,col="black")

#Changing the sizes of points with another numeric variable
ggplot(data, aes(x = gdpPercap, y = lifeExp, color=continent, size=pop))+
  geom_point(alpha = 0.5)
#This is overwritten by the size in the geom
ggplot(data, aes(x = gdpPercap, y = lifeExp, color=continent, size=pop))+
  geom_point(alpha = 0.5, size = 2)

#Fitting a smooth line
ggplot(data, aes(x = gdpPercap, y = lifeExp, color=continent, size=pop))+
  geom_point(alpha = 0.5)+
  geom_smooth(se = FALSE, color = "grey30")

#Change the scale
ggplot(data, aes(x = gdpPercap, y = lifeExp, color=continent, size=pop))+
  geom_point(alpha = 0.5)+
  geom_smooth(se = FALSE, color = "grey30")+
  scale_x_log10()

#Changing the labels and title
ggplot(data, aes(x = gdpPercap, y = lifeExp, color=continent, size=pop))+
  geom_point(alpha = 0.5)+
  geom_smooth(se = FALSE, color = "grey30")+
  scale_x_log10()+
  labs(title = "GDP VS Life Expectancy",
       x = "GDP Per Capita (log scale)",
       y = "Life Expectancy",
       size = "Popoulation (millions)",
       color = "Continent")

#Faceting
ggplot(data, aes(x = gdpPercap, y = lifeExp, color=continent, size=pop))+
  geom_point(alpha = 0.5)+
  geom_smooth(se = FALSE, color = "grey30")+
  scale_x_log10()+
  labs(title = "GDP VS Life Expectancy",
       x = "GDP Per Capita (log scale)",
       y = "Life Expectancy",
       size = "Popoulation (millions)",
       color = "Continent")+facet_wrap(~continent)
