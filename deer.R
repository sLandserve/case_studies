library(sf)
library(tidyverse)

deer_habitat <- st_read("data/MR_deer_SEIF_dissolved_less5removed.shp") %>% 
  select(AREA_HA, deer_media, deer_mean, deer_min, deer_max) %>% 
  na.omit %>% 
  mutate(qual_norm = (deer_media - min(deer_media))/(max(deer_media) - (min(deer_media))),
         area_norm = (AREA_HA - min(AREA_HA))/(max(AREA_HA) - (min(AREA_HA))),
         deer_area = qual_norm*area_norm)


