gw_data <- read.csv("global_witness_led_22-09-22.csv", stringsAsFactors = FALSE)
library('stringr')

# 1. Which country had the most deaths between 2012 and 2021? 
country_with_max_deaths <- gw_data %>% 
  group_by(country) %>% 
  summarize(total_deaths = sum(number_of_victims, na.rm = T)) %>% 
  filter(total_deaths == max(total_deaths)) %>%
  pull(country)
# Brazil

# 2. How many environmental defenders were killed in the country with the most deaths (Brazil) between 2012 and 2021?
max_deaths_country<- gw_data %>% 
  group_by(country) %>% 
  summarize(total_deaths = sum(number_of_victims, na.rm = T)) %>% 
  filter(total_deaths == max(total_deaths)) %>%
  pull(total_deaths)
# 342
  
# 3. What was the year with the most deaths worldwide?
year_max_deaths <- gw_data %>% 
  mutate(Year = str_sub(date, start = 1, end = 4)) %>% 
  group_by(Year) %>% 
  summarize(total_deaths = sum(number_of_victims, na.rm = T)) %>% 
  filter(total_deaths == max(total_deaths)) %>%
  pull(Year)
# 2020

# 4. What was the most common perpetrator type?
main_perpetrator <- gw_data %>% 
  group_by(perpetrator_type) %>% 
  summarize(total_deaths = sum(number_of_victims, na.rm = T)) %>% 
  filter(total_deaths == max(total_deaths)) %>%
  pull(perpetrator_type)
# Unspecified 
  
# 5. What was the main personal characteristic of the environmental defenders that were attacked?
main_person_characteristic <- gw_data %>% 
  group_by(person_characteristics) %>% 
  summarize(total_deaths = sum(number_of_victims, na.rm = T)) %>% 
  filter(total_deaths == max(total_deaths)) %>%
  pull(person_characteristics)
# Indigenous People

# 6. What was the top industry sector?
main_industry_sector <- gw_data %>% 
  group_by(industry_driver) %>% 
  summarize(total_deaths = sum(number_of_victims, na.rm = T)) %>% 
  filter(total_deaths == max(total_deaths)) %>%
  pull(industry_driver)
# Sector could not be confirmed
