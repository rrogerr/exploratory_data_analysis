setwd("/home/rogelio/Desktop/datasciencecoursera/exploratory_data_analysis/")
data("mtcars")

png(file = "./boxplot.png")
boxplot(mtcars$mpg)
dev.off()

x <- rnorm(20)
y <- rnorm(20)
jpeg(file = "./plot.jpeg", width = 640, height = 480)
plot(x, y)
dev.off()