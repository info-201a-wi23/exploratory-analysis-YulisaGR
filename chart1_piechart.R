library("ggplot2")
library("tidyverse")
library("dplyr")
library("RColorBrewer")

# This data includes the number of activism related deaths by each country.
# I've chosen to include this to see if there's any correlation between the number of deaths and the location of each country in the world.

gw_data <- read.csv("global_witness_led_22-09-22.csv")

deathcount_country <- gw_data %>% 
  group_by(country) %>% 
  summarize(total_victims = sum(number_of_victims, na.rm = TRUE)) %>% 
  arrange(desc(total_victims)) %>% 
  top_n(10)

ggplot(deathcount_country, aes(x = "", y = total_victims, fill = country)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start=0) +
  labs(title = "Countries with Most Deaths",
       x = "Perpetrator Type",
       fill = "Countries") +
  theme_void()

# The visualization reveals that Brazil, Columbia, and the Philippines have a significant gap of most deaths compared to other countries.
# I believe this is important to discerning whether victims fell prey to malicious intent, or simply fell victim to their respective country's crime and
# violence rate. Were the victims we're focusing on targeted, or simply unlucky? I believe it's important to consider this aspect, since it would be
# inaccurate to immediately attribute deaths as a direct response to their "activism". This notion applies even when the perpetrator type is listed,
# since we don't have a way of validating the csv file's claims.
