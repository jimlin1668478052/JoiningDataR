grades <- read.csv("Data/grades.csv")
houses <- read.csv("Data/houses.csv")
library(dplyr)
grades_houses <- full_join(grades,houses,by = "student")
grades_houses2 <- left_join(grades,houses,by = "student")
grades_houses3 <- inner_join(grades,houses,by = "student")