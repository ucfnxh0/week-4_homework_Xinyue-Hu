library(sf)      
library(dplyr)   
library(readr)   

inequality_data_path <- "D:/UCL(GIS)/week 4/GII.csv"  
geojson_data_path <- "D:/UCL(GIS)/week 4/World_Countries_(Generalized)_9029012925078512962.geojson"

inequality_data <- read_csv(inequality_data_path)

world_data <- st_read(geojson_data_path)

combined_data <- world_data %>%
  left_join(inequality_data %>% select(COUNTRY, value), by = "COUNTRY")  

st_write(combined_data, "D:/UCL(GIS)/week 4/combined_data.geojson")

