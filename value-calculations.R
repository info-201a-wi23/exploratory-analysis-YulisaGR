gw_data <- read.csv("global_witness_led_22-09-22.csv", stringsAsFactors = FALSE)

# county with the most deaths 
country_max <- gw_data %>% 
  group_by(country) %>% 
  summarize(total_deaths = sum(number_of_victims, na.rm = T)) %>% 
  filter(total_deaths == max(total_deaths)) %>%
  pull(country)