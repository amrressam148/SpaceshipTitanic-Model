
library(tidyverse)
library(skimr)
library(DataExplorer)
library(GGally)
library(esquisse)
library(plotly)
library(canvasXpress)
library(caret)
library(rpart)
library(rpart.plot)
library(pROC)
options(dplyr.summarise.inform = FALSE)



## LOAD DATA ----

# https://www.kaggle.com/competitions/spaceship-titanic/data
df <- read_csv('data/spaceship-titanic/train.csv')

# FIRST LOOK
View(df)

# see first rows
head(df)

# returns the dimension
dim(df)

# get the summary of Data Frame
summary(df)

# displays structures of my data
str(df)

#CHECKING FOR ANY MISSING VALUES IN THE DATA
sum(is.na(df))

colSums(is.na(df))

## CLEANING THE DATA ##

# Replace missing values in HomePlanet with "Unknown"
df$HomePlanet <- ifelse(is.na(df$HomePlanet), "Unknown", df$HomePlanet)

# Replace missing values in CryoSleep with median value of the column
df$CryoSleep <- ifelse(is.na(df$CryoSleep), median(df$CryoSleep, na.rm = TRUE), df$CryoSleep)

# Replace missing values in Cabin with "Not Available"
df$Cabin <- ifelse(is.na(df$Cabin), "Not Available", df$Cabin)

# Replace missing values in Destination with "Unknown"
df$Destination <- ifelse(is.na(df$Destination), "Unknown", df$Destination)

# Replace missing values in VIP with FALSE
df$VIP <- ifelse(is.na(df$VIP), FALSE, df$VIP)

# Replace missing values in Name with "Unknown"
df$Name <- ifelse(is.na(df$Name), "Unknown", df$Name)

# Replace missing values in Age column with median
df$Age[is.na(df$Age)] <- median(df$Age, na.rm = TRUE)

# Replace missing values in RoomService column with median
df$RoomService[is.na(df$RoomService)] <- median(df$RoomService, na.rm = TRUE)

# Replace missing values in FoodCourt column with median
df$FoodCourt[is.na(df$FoodCourt)] <- median(df$FoodCourt, na.rm = TRUE)

# Replace missing values in ShoppingMall column with median
df$ShoppingMall[is.na(df$ShoppingMall)] <- median(df$ShoppingMall, na.rm = TRUE)

# Replace missing values in Spa column with median
df$Spa[is.na(df$Spa)] <- median(df$Spa, na.rm = TRUE)

# Replace missing values in VRDeck column with median
df$VRDeck[is.na(df$VRDeck)] <- median(df$VRDeck, na.rm = TRUE)


#ENCODING THE CATEGORICAL VARIABLES

df$CryoSleep <- as.factor(df$CryoSleep)

df$Transported <- as.factor(df$Transported)

df$VIP <- as.factor(df$VIP)
