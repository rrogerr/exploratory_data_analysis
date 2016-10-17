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
qplot(hwy, data = mpg, facets = drv~., binwidth = 2)

# linear models as geoms
qplot(mpg, disp, data = mtcars, facets = cyl~.) + geom_smooth(method = "lm", se = FALSE)

# another way of plotting using "fundamentals"
g <- ggplot(mtcars, aes(mpg, disp))
print(g) # nothing

# add layers to g
p <- g + geom_point()
print(p)

# more layers
p + geom_smooth()
p + geom_smooth(method = "lm")
p + geom_smooth(method = "lm") + facet_grid(cyl~.)

# changing styles
g + geom_point(color = "steelblue", size = 4, alpha = 1/2)
h <- g + geom_point(aes(color = cyl), size = 4, alpha = 1/2)
print(h)

# annotating
i <- h + labs(title = "mtcars") + labs(x = "miles per gallon", y = "displacement")
print(i)
j <- i + geom_smooth(method = "lm", se = FALSE, size = 4, linetype = 3, color = "red")
print(j)
j + theme_bw(base_family = "Times")