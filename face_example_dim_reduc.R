setwd("/home/rogelio/Desktop/datasciencecoursera/exploratory_data_analysis")

load("./face.rda")
image(t(faceData)[,nrow(faceData):1])

# par(mar = rep(1,4))
# 
# svd1 <- svd(scale(faceData))
# plot(svd1$d^2/sum(svd1$d^2), pch = 19, xlab = "singular vector",
#      ylab = "variance explained")