library("ggplot2")
library("tidyverse")
library("dplyr")
library("RColorBrewer")

#This data includes the amount of the type of perpetrators that led to the deaths of victims.
#It is included to let us know what type of perpetrators that led to the downfall of victims
#and if there is a correlation on the type.

gw_data <- read.csv("global_witness_led_22-09-22.csv", stringsAsFactors = FALSE)

perp_victems <- gw_data %>% 
  group_by(perpetrator_type) %>% 
  summarize(total_victims = sum(number_of_victims, na.rm = TRUE))

ggplot(perp_victems, aes(x = perpetrator_type, y = total_victims, fill = total_victims )) +
  labs(title = "Type of Perpetrator and Their Total Victims",
       x = "Perpetrator Type",
       y = "Total Victims",
       fill = "Total Victims") +
  geom_bar(stat = "identity") +
  coord_flip()

# The data reveals that corporations have the smallest amount of victems and that (besides unknown)
# hitman have led to the most amount of victims. 

