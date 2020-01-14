# Use of plot function from the package basis

# Simple plot for the continent
par(mar=c(3,3,3,3))
plot(shp_ctnt, col="#f2f2f2", bg="skyblue", lwd=0.25, border=0)
title(main = "Map of the world of ASOIAF")

# Specify the colors for the different lands
colors <- rainbow(15)

#simple plot for the continent, island, and kingdoms
plot(shp_ctnt, col="#f2f2f2", bg="skyblue", lwd=0.25, border=0)
plot(shp_isl, col="#f2f2f2", bg="skyblue", lwd=0.25, border=0, add=TRUE)
plot(shp_kgd, col=colors , bg="skyblue", lwd=0.25, border=0, add=TRUE)
legend("topright", legend = shp_kgd@data$name, col =  colors, pch = 19)
title(main = "Map of the world of ASOIAF")

#simple plot for the continent, island, and kingdoms, cities
plot(shp_ctnt, col="#f2f2f2", bg="skyblue", lwd=0.25, border=0)
plot(shp_isl, col="#f2f2f2", bg="skyblue", lwd=0.25, border=0, add=TRUE)
plot(shp_kgd, col=colors, bg="skyblue", lwd=0.25, border=0, add=TRUE)
plot(shp_loc, col="red", add=TRUE,pch = 20)
legend("topright", legend = shp_kgd@data$name, col =  colors, pch = 19)
title(main = "Map of the world of ASOIAF")

# Then, I export manually these plots.



