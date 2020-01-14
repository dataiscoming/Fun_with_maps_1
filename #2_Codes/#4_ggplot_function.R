# ggplot function from the package ggplot2

# Data management for the shapefile
for_ctnt <- fortify(shp_ctnt)
for_isl <- fortify(shp_isl)
for_kgd <-fortify(shp_kgd)
for_kgd$id[for_kgd$id==0] <- "New Gift"
for_kgd$id[for_kgd$id==1] <- "Riverlands"
for_kgd$id[for_kgd$id==2] <- "Land beyond the Wall"
for_kgd$id[for_kgd$id==3] <- "Bran's Gift"
for_kgd$id[for_kgd$id==4] <- "The North"
for_kgd$id[for_kgd$id==5] <- "The Iron Islands"
for_kgd$id[for_kgd$id==6] <- "Dorne"
for_kgd$id[for_kgd$id==7] <- "Stormlands"
for_kgd$id[for_kgd$id==8] <- "The Vale"
for_kgd$id[for_kgd$id==9] <- "The Westerlands"
for_kgd$id[for_kgd$id==10] <- "Crownsland"
for_kgd$id[for_kgd$id==11] <- "The Reach"
for_loc <- cbind(shp_loc@data,shp_loc@coords)

# Map of the continents, islands, kingdoms
print(ggplot() +
  geom_polygon(data = for_ctnt, aes(x = long, y = lat, group = group), fill="#69b3a2", color="white") +
  geom_polygon(data = for_isl, aes(x = long, y = lat, group = group), fill="#69b3a2", color="white") +
  geom_polygon(data = for_kgd, aes(x = long, y = lat, group = group, fill=id), color="white") +
  theme_void()+
  coord_fixed(1.3)+
  ggtitle("Map of the world of ASOIAF"))
  

# Map of the continents, islands, kingdoms and cities
print(ggplot() +
        geom_polygon(data = for_ctnt, aes(x = long, y = lat, group = group), fill="#69b3a2", color="white") +
        geom_polygon(data = for_isl, aes(x = long, y = lat, group = group), fill="#69b3a2", color="white") +
        geom_polygon(data = for_kgd, aes(x = long, y = lat, group = group, fill=id), color="white") +
        geom_point(data =for_loc, aes(x=coords.x1, y=coords.x2),color="red")+
        theme_void()+
        coord_fixed(1.3)+
        ggtitle("Map of the world of ASOIAF"))
    


