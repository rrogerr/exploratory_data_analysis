# functions: plot, xyplot, qplot, boxplot, par, title, points, legend, lm
# parameters: main, col, type, legend, pch, lwd, mfrow, mar, oma


####################### BASE SYSTEM #######################

library(datasets)
data(cars)
with(cars, plot(speed, dist))


####################### LATTICE PLOT #######################

library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))


######################### GGPLOT2 #########################

library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)


####################### BASE SYSTEM #######################

airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")


################ MANAGING GRAPH PARAMETERS ################

par("mar")

with(airquality, plot(Wind, Ozone))
title(main = "i'm bored")
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))

with(airquality, plot(Wind, Ozone, main = "blablablabla", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other"))
with(airquality, plot(Wind, Ozone, main = "blablablabla", pch = 10))


###################### LINEAR MODELS ######################

with(airquality, plot(Wind, Ozone, main = "blablablabla"))
model <- lm(airquality$Ozone ~ airquality$Wind)
abline(model, lwd = 2)


###################### MULTIPLE PLOTS ######################

par(mfrow = c (1,2))
with(airquality, {
        plot(Wind, Ozone, main = "ozone and wind")
        plot(Solar.R, Ozone, main ="ozone and solar radiation")
        })

par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(airquality, {
        plot(Wind, Ozone, main = "ozone and wind")
        plot(Solar.R, Ozone, main ="ozone and solar radiation")
        plot(Temp, Ozone, main = "ozone and temperature")
        mtext("ozone and weather in New York City", outer = TRUE)
})
