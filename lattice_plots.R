library(lattice)
library(datasets)

########################## SIMPLE ##########################

xyplot(Ozone ~ Wind, data = airquality)

####################### MULTIVARIATE #######################

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))

############################################################
# A lattice produces an object of class "trellis", that, 
# unlike base plots is a printable object. Base plots print
# directly in the device, they do not produce such objects
############################################################

p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)
class(p)

################# LATTICE PANEL FUNCTIONS #################

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1))

# custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...){
        panel.xyplot(x, y, ...)
        panel.abline(h = median(y), lty = 2)
})


xyplot(y ~ x | f, panel = function(x, y, ...){
        panel.xyplot(x, y, ...)
        panel.lmline(x, y, col = 2)
})

