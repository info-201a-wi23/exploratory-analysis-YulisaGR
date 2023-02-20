install.packages("ggplot2")
library(ggplot2)
library("tidyverse")
library("dplyr")
library("RColorBrewer")

# This data includes the number of activism related deaths by each country.
# I've chosen to include this to see if there's any correlation between the number of deaths and the location of each country in the world.

mydata<-read.csv("https://github.com/info-201a-wi23/final-project-proposal-riyapatel24/blob/main/global_witness_led_22-09-22.csv")

View(mydata)

ggplot(mydata, aes(x = "", y = country_numeric, fill = country)) +
geom_bar(stat = "Deaths Per Country") +
coord_polar("y")

# The data reveals that Columbia has the most deaths compared to other countries. I believe this is important to discerning whether victims fell prey to
# malicious intent, or simply fell victim to their respective country's crime and violence rate. Were the victims we're focusing on targeted, or simply
# unlucky? I believe it's important to consider this aspect, since it would be inaccurate to immediately attribute deaths as a direct response to their
# "activism". This notion applies even when the perpetrator type is listed, since we don't have a way of validating the csv file's claims.
