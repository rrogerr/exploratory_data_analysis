###################### CLUSTERED DATA ######################

set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

###################### K-MEANS OBJECT ######################

df <- data.frame(x, y)
k_means_obj <- kmeans(df, centers = 3)
names(k_means_obj)
k_means_obj$cluster

setwd("/home/rogelio/Desktop/datasciencecoursera/exploratory_data_analysis")

png("./clusters.png")
par(mar = rep(0.2, 4))
plot(x, y, col = k_means_obj$cluster, pch = 19, cex = 2)
points(k_means_obj$centers, col = 1:3, pch = 3, cex = 3, lwd = 3)
dev.off()