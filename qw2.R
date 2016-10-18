library(nlme)
library(lattice)
library(ggplot2)
data("airquality")

xyplot(weight ~ Time | Diet, BodyWeight)

airquality <- transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = .~Month)

A <- ggplot(airquality, aes(Wind, Ozone))
print(A) # nothing happens