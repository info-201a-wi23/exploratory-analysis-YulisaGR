gw_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/final-project-proposal-riyapatel24/main/global_witness_led_22-09-22.csv?token=GHSAT0AAAAAAB5ARTFKOGT7NKIEEVGZ5NL2Y7THPRA", stringsAsFactors = FALSE)

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

# Lastly, we decided to make a choropleth map to display the attacks on environmental defenders around the globe. We decided to use this chart since it provides a better visualization of where these incidents are occurring. In addition, the choropleth maps are suitable for revealing patterns and displaying the distribution of these incidents. 
# 
# The map reveals that sections of North America, South America, and Asia have countries with higher amounts of land and environmental defenders deaths. Some notable countries we see accentuated in red and orange include Mexico, Brazil, Colombia, India, the Philippines, and Honduras. 
# 
# The chart also reveals an important issue: there is missing information regarding some countries. For example, there is no way to know if a country actually has a lower number of deaths or if it was difficult to capture data in these countries. This issue is critical to reflect on when working and analyzing the data in the future.
