# Loading packages

pck = c("ggplot2", "ggspatial", "sf")
lapply(pck, require, character.only = TRUE)

# Getting shapefile
## https://geodata.lib.berkeley.edu/?f%5Bdc_format_s%5D%5B%5D=Shapefile&f%5Bdct_spatial_sm%5D%5B%5D=Iceland
shp = st_read(dsn = "C:/Shapefile4/ISL_adm1.shp")


x11() # open graphic window 

# Map visualization
ggplot(data = shp) + geom_sf() 

# Improving the map visualization 
ggplot(data = shp) + geom_sf() +
  coord_sf(xlim = c(-27.9, -12.5),
           ylim = c(63, 67)) +
  annotation_north_arrow(location = "tl",
                         which_north = "true",
                         pad_x = unit(0.2, "cm"),
                         pad_y = unit(0.2, "cm"),
                         style = north_arrow_nautical,
                         width = unit(2, "cm"),
                         height = unit(2,"cm")) + 
  annotation_scale() +
  labs(x = "Latitude", y = "Longitude")

shp_LAM = st_transform(shp, 9947)
st_bbox(shp_LAM)

# Improving the map visualization using specific projection
ggplot(data = shp_LAM) + geom_sf() +
  coord_sf(xlim = c(1229383.1, 2050290.9),
           ylim = c(1102427.1, 1502427.1)) +
  annotation_north_arrow(location = "tl",
                         which_north = "true",
                         pad_x = unit(0.2, "cm"),
                         pad_y = unit(0.2, "cm"),
                         style = north_arrow_nautical,
                         width = unit(2.2, "cm"),
                         height = unit(2.2,"cm")) + 
  annotation_scale() +
  labs(x = "Latitude", y = "Longitude")

