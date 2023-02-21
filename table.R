library(kableExtra)
library(dplyr)

gw_data <- read.csv("global_witness_led_22-09-22.csv", stringsAsFactors = FALSE)

gw_data$date <- as.Date(gw_data$date, "%m/%d/%y")
  
  
aggregated_table <- gw_data %>% 
  select('person_characteristics', 'industry_driver',
         'perpetrator_type', 'continent', 'country', 'number_of_victims') %>%
  group_by(country, person_characteristics, industry_driver, perpetrator_type) %>% 
  summarize(total_deaths = sum(number_of_victims, na.rm = TRUE)) %>%
  filter(total_deaths >= 15) %>% 
  arrange(desc(total_deaths))

kable(aggregated_table)
