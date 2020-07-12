# Analyze Tesla stock price script
#load TSLA.csv
Tesla <- read.csv("Data/TSLA.csv")

library(dplyr)
Tesla %>%
  head()
head(Tesla)
summary(head(Tesla,15))
Tesla %>%
  head(15) %>%
  summary()
Tesla %>%
  str()
Tesla$Volume <- as.numeric(Tesla$Volume)
Tesla %>%
  colnames()
#divide dates of Tesla into year, month, and day
library(tidyr)
Tesla <- separate(Tesla, Date, c("Year", "Month", "Day"), sep="-")
#calculate average stock TSLA price for each year
Tesla_Year <- Tesla %>% 
  group_by(Year) %>%
  summarize_if(is.numeric, mean)
#no pipe way
Tesla_Group <- group_by(Tesla,Year)
Tesla_Year2 <- summarize_if(Tesla_Group,is.numeric,mean)
#to see the trend with arrange()
Tesla_Year <- arrange(Tesla_Year,Open)
#return back
Tesla_Year <- arrange(Tesla_Year,Year)
#recode data with case_when()
# by season
Tesla <- mutate(Tesla, Season = case_when(Month == "01"|Month == "02"|Month == "03" ~ "Winter",
                                          Month == "04"|Month == "05"|Month == "06" ~ "Spring",
                                          Month == "07"|Month == "08"|Month == "09" ~ "Summer",
                                          Month == "10"|Month == "11"|Month == "12" ~ "Fall",
                                          TRUE ~ "NA"))
Tesla_Season <- Tesla %>%
  group_by(Season) %>%
  summarize_if(is.numeric,mean) %>%
  arrange(desc(Open))
# visualize Tesla dataset with esquisser
Tesla2 <- read.csv("Data/TSLA.csv")
# joining data
