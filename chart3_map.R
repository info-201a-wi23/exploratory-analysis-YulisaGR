gw_data <- read.csv("global_witness_led_22-09-22.csv", stringsAsFactors = FALSE)

library("ggplot2")
library("plotly")
library("dplyr")
library("scales")

world_shape <- map_data("world")

blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank(), # remove border around plot
  )

world_shape <- map_data("world")

gw_world_data <- gw_data %>% 
  group_by(country) %>% 
  summarize(total_victims = sum(number_of_victims, na.rm = TRUE))

gw_world_shape_data <- left_join(world_shape, gw_world_data, by = c("region" = "country"))

ggplot(gw_world_shape_data) +
  geom_polygon(mapping = aes(x = long, 
                             y = lat, 
                             group = group,
                             fill = total_victims)) +
  labs(title = 'Land and Enviornmental Defenders Killed (2012-2021)', fill = 'Victims') + 
  scale_fill_continuous(low = 'yellow', high = 'red') +
  blank_theme
