# Import the different shapefiles

# Import of the shape of the three different continents
shp_ctnt <- readOGR(
  dsn="#1_Data/continents/continents.shp", 
  verbose=FALSE
)

# Import of the shape different kingdoms 
shp_kgd <- readOGR( 
  dsn="#1_Data/political/political.shp", 
  verbose=FALSE
)

# Import of the shape different inslands
shp_isl <- readOGR( 
  dsn="#1_Data/islands/islands.shp", 
  verbose=FALSE
)

# Import of the shape different locations (cities ...)
shp_loc <- readOGR( 
  dsn="#1_Data/locations/locations.shp", 
  verbose=FALSE
)

# I need to modify a land name from the file political.shp, because it is not declared
shp_kgd@data$name <-  as.character(shp_kgd@data$name)
shp_kgd@data$name[3] <- "Land beyond the Wall"

