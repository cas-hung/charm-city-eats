library(leaflet) # For making the interactive map
library(jsonlite) # For parsing JSON files

## Leaflet documentation: https://cran.r-project.org/web/packages/leaflet/leaflet.pdf

# Read in restaurant information
place <- fromJSON("~/Downloads/place.json")

# Extract coordinates for this restaurant
coord <- as.numeric(place$geocoding$results$geometry$location) # [1] = lat, [2] = long
name <- place$place_details$displayName$text # Restaurant name

map <- leaflet() |>
  addTiles() |>
  setView(lng = -76.6122, lat = 39.2904, zoom = 12) |> # Approximate coordinates of Baltimore City
  addMarkers(
    lng = coord[2], # Can also add vectors of coordinates to create multiple markers
    lat = coord[1],
    popup = c(name) # Use HTML to add additional details
  )

map
