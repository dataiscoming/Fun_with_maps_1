# leaflet function from the leaflet package

# Colors to identify the different kingdoms
colors <- colorFactor(palette = rainbow(12) ,levels = as.factor(shp_kgd@data$name))

# Map of the continents, islands and kingdoms
print(leaflet() %>% 
  setMapWidgetStyle(list(background= "skyblue")) %>%
  addPolygons(data = shp_ctnt, fillColor = topo.colors(1, alpha = NULL),stroke = FALSE, opacity=1, fillOpacity = 1) %>%
  addPolygons(data = shp_isl, fillColor = topo.colors(1, alpha = NULL),stroke = FALSE, opacity=1, fillOpacity = 1) %>%
  addPolygons(data = shp_kgd, fillColor = colors(shp_kgd@data$name),stroke = TRUE, opacity=1, fillOpacity = 1,
              color = "black",weight = 1,
              popup=paste0("<b>",shp_kgd@data$name,", claimed by the ", shp_kgd@data$ClaimedBy,"'s</b>"),
              popupOptions = popupOptions(maxWidth ="100%", closeOnClick = TRUE)) %>%
  addLegend("bottomright", pal = colors, values = shp_kgd@data$name,
            title = "Kingdom Name",
            opacity = 1) %>%
  addResetMapButton())

# Map of the continents, islands, kingdoms and locations
print(leaflet() %>% 
  setMapWidgetStyle(list(background= "skyblue")) %>%
  addPolygons(data = shp_ctnt, fillColor = topo.colors(1, alpha = NULL),stroke = FALSE, opacity=1, fillOpacity = 1) %>%
  addPolygons(data = shp_isl, fillColor = topo.colors(1, alpha = NULL),stroke = FALSE, opacity=1, fillOpacity = 1) %>%
  addPolygons(data = shp_kgd, fillColor = colors(shp_kgd@data$name),stroke = TRUE, opacity=1, fillOpacity = 1,
              color = "black",weight = 1,
              popup=paste0("<b>",shp_kgd@data$name,", claimed by the ", shp_kgd@data$ClaimedBy,"'s</b>"),
              popupOptions = popupOptions(maxWidth ="100%", closeOnClick = TRUE)) %>%
  addLegend("bottomright", pal = colors, values = shp_kgd@data$name,
            title = "Kingdom Name",
            opacity = 1) %>%
  addMarkers(popup = ~as.character(name), label = ~as.character(type), data=shp_loc) %>%
  addResetMapButton())

# Better visualization for the cities
# I have to link the point with the polygones, to know from which land is a city
shp_loc@data = cbind(shp_loc@data, as.vector(over(shp_loc,shp_kgd[,"name"])))
shp_loc@data[,6] = as.factor(shp_loc@data[,6])
shp_loc.df <- split(shp_loc, shp_loc@data[,6])

# Similar with the code above
l <- leaflet() %>% 
  addTiles(urlTemplate = "") %>%
  addResetMapButton() %>%
  addLegend("bottomright", pal = colors, values = shp_kgd@data$name,
            title = "Kingdom Name",
            opacity = 1) %>%
  setMapWidgetStyle(list(background= "skyblue")) %>%
  addPolygons(data = shp_ctnt, fillColor = topo.colors(1, alpha = NULL),stroke = FALSE, opacity=1, fillOpacity = 1) %>%
  addPolygons(data = shp_isl, fillColor = topo.colors(1, alpha = NULL),stroke = FALSE, opacity=1, fillOpacity = 1) %>%
  addPolygons(data = shp_kgd, fillColor = colors(shp_kgd@data$name),stroke = TRUE, opacity=1, fillOpacity = 1,
              color = "black",weight = 1,
              popup=paste0("<b>",shp_kgd@data$name,", claimed by the ", shp_kgd@data$ClaimedBy,"'s</b>"),
              popupOptions = popupOptions(maxWidth ="100%", closeOnClick = TRUE)) 
  
# Tricky part of the code : instead of addMarkers once like above, the function walk will add markers as many time as 
# there are lands/kingdoms (ex: shp_loc.df[[df]])
names(shp_loc.df) %>%
  purrr::walk(function(df) {
    l <<- l %>%
      addMarkers(data=shp_loc.df[[df]], popup = ~as.character(name), label = ~as.character(type), 
                 clusterOptions = markerClusterOptions(),group = df) 
  })  
 
# Function to choose which layer (land/kingdom) I want to show
print(l %>%
  addLayersControl(
    overlayGroups = names(shp_loc.df),
    options = layersControlOptions(collapsed = FALSE)
))
