# histogram for cities

# Number of cities by lands
res <- as.data.frame(GISTools::poly.counts(shp_loc, shp_kgd))
res <- cbind(shp_kgd@data$name,res)
colnames(res) <- c("Land","Cities")
res <- res[order(-res$Cities),]

# Barplot to show the ranks of the lands according the number of cities
par(mar=c(5,5,5,5))
barplot(res$Cities, main="City distribution", xlab="Lands", names.arg = res$Land) 