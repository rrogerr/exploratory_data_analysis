data("mtcars")

summary(mtcars$hp)

boxplot(mtcars$hp, col = "blue")

hist(mtcars$hp, col = "green")
rug(mtcars$hp)

hist(mtcars$hp, col = "green", breaks = 20)
rug(mtcars$hp)

boxplot(mtcars$hp, col = "blue")
abline(h = 200)

hist(mtcars$hp, col = "green")
rug(mtcars$hp)
abline(v = mean(mtcars$hp))
abline(v = 200)

boxplot(hp ~ cyl, data = mtcars)

# look at three different variables using color
with(mtcars, plot(hp, mpg, col = cyl))