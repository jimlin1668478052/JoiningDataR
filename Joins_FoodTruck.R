# Create a data frame called "price"
price <- data.frame("Food" = c("Burger","Hot Dog","Curry"),
                "Location" = c("Van","Van","Restaurant"),
                "Price" = c("$3.00", "$2.00", "$12.00"),
                stringsAsFactors=FALSE)
# Create a data frame called "calories"
calories <- data.frame("Food" = c("Burger","Hot Dog","Chips"),
                "Type" = c("Main","Main","Side"),
                "Calories" = c(200, 150, 120),
                stringsAsFactors=FALSE)
# join the two datas 
library(dplyr)
#based on the primary key of first data
Joined_data_left <- left_join(price, calories, by = "Food")
#based on the second data
Joined_data_right <- right_join(price, calories, by = "Food")
#only include the common primary key
Joined_data_inner <- inner_join(price, calories, by = "Food")
#include all primary keys
Joined_data_full <- full_join(price, calories, by = "Food")
#just comparison, not join
#include the primary keys in A that are also contained in B
Joined_data_semi <- semi_join(price, calories, by = "Food")
#include the primary keys in A that are not contained in B
Joined_data_anti <- anti_join(price, calories, by = "Food")
#copy and paste style join
class(price)