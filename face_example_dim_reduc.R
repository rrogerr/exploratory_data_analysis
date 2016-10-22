setwd("/home/rogelio/Desktop/datasciencecoursera/exploratory_data_analysis")

load("./face.rda")
image(t(faceData)[,nrow(faceData):1])

svd1 <- svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2), pch = 19, xlab = "singular vector",
     ylab = "variance explained")

################# APPROXIMATIONS OF IMAGE #################

approx1 <- svd1$u[,1] %*% t(svd1$v[,1]) * svd1$d[1]

approx5 <- svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])

approx10 <- svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])

setwd("/home/rogelio/Desktop/datasciencecoursera/exploratory_data_analysis")

png(file = "./svd_faces_approxs.png", height = 200, width = 800)
par(mfrow = c(1,4))
image(t(approx1)[,nrow(approx1):1], main = "(a)")
image(t(approx5)[,nrow(approx5):1], main = "(b)")
image(t(approx10)[,nrow(approx10):1], main = "(c)")
image(t(faceData)[,nrow(faceData):1], main = "(d)")
dev.off()