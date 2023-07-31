library(plotly)
library(canvasXpress)
library(caret)
library(rpart)
library(rpart.plot)
library(pROC)
options(dplyr.summarise.inform = FALSE)

#DATA PREPARATION AND PREPROCESSING OF TESTING DATA


## LOAD DATA ----

# https://www.kaggle.com/competitions/spaceship-titanic/data
df1 <- read_csv('data/spaceship-titanic/test.csv')
view(df1)
head(df1)

dim(df1)

summary(df1)

str(df1)

#CHECKING FOR ANY MISSING VALUES IN THE DATA
sum(is.na(df1))

colSums(is.na(df1))

#CLEANING THE DATA
# Clean the data by replacing missing values with NA
df1$HomePlanet[is.na(df1$HomePlanet)] <- NA
df1$CryoSleep[is.na(df1$CryoSleep)] <- NA
df1$Cabin[is.na(df1$Cabin)] <- NA
df1$Destination[is.na(df1$Destination)] <- NA
df1$VIP[is.na(df1$VIP)] <- NA
df1$Name[is.na(df1$Name)] <- NA

df1$Age[is.na(df1$Age)] <- median(df1$Age,na.rm=TRUE)
df1$RoomService[is.na(df1$RoomService)] <- median(df1$RoomService,na.rm=TRUE)
df1$FoodCourt[is.na(df1$FoodCourt)] <- median(df1$FoodCourt,na.rm=TRUE)
df1$ShoppingMall[is.na(df1$ShoppingMall)] <- median(df1$ShoppingMall,na.rm=TRUE)
df1$Spa[is.na(df1$Spa)] <- median(df1$Spa,na.rm=TRUE)
df1$VRDeck[is.na(df1$VRDeck)] <- median(df1$VRDeck,na.rm=TRUE)