library("ggplot2")
library("tidyverse")
library("dplyr")
library("RColorBrewer")


gw_data <- read.csv("~/Desktop/INFO201/global_witness_led_22-09-22 copy.csv", stringsAsFactors = FALSE)

perp_victems <- gw_data %>% 
  group_by(perpetrator_type) %>% 
  summarize(total_victims = sum(number_of_victims, na.rm = TRUE))

ggplot(perp_victems, aes(x = perpetrator_type, y = total_victims, fill = total_victims )) +
  labs(title = "Type of Perpetrator vs Total Victims",
       x = "Perpetrator Type",
       y = "Total Victims") +
  geom_bar(stat = "identity") +
  coord_flip()

