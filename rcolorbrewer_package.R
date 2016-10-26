library(RColorBrewer)

cols <- brewer.pal(3, "BuGn")

cols

pal <- colorRampPalette(cols)

par(mfrow = c(1, 2), mar = c(1,1,1,1))
image(volcano, col = pal(20)) #more shades
image(volcano, col = pal(5)) #less shades

cols2 <- brewer.pal(3, "Set3")
cols2

x <- rnorm(1000000)
y <- rnorm(1000000)
smoothScatter(x, y, colramp = colorRampPalette(cols2))