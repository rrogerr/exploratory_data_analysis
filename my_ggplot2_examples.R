library(ggplot2)
str(mpg)

qplot(displ, hwy, data = mpg)

# automatic legend
qplot(displ, hwy, data = mpg, col = drv)

# adding a geom
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))

# plot histogram by specifying only one variable
qplot(hwy, data = mpg, fill = drv)

# facets
qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(hwy, data = mpg,, facets = drv~., binwidth = 2)