library(ggplot2)
str(mpg)
data("mtcars")

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

# Axis limits
testdata <- data.frame(x = 1:100, y = rnorm(100))
testdata[50, 2] <- 100 #outlier
plot(testdata$x, testdata$y, type ="l", ylim = c(-3,3))

A <- ggplot(testdata, aes(x = x, y = y))
B <- A + geom_line()

B + ylim(-3,3) #excludes the outlier from the dataset
B + coord_cartesian(ylim = c(-3,3)) #includes the point but doesn't plot it

# categorize a continuous variable
cutpoints <- quantile(mtcars$wt, seq(0, 1, length = 4), na.rm = TRUE)
mtcars$new_fact <- cut(mtcars$wt, cutpoints)
levels(mtcars$new_fact)
ggplot(mtcars, aes(mpg, disp)) + geom_point() + facet_grid(.~new_fact)
ggplot(mtcars, aes(mpg, disp)) + geom_point() + facet_grid(cyl~new_fact)