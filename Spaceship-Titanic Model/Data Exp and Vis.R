#DATA EXPLORATION AND DATA VISUALIZATION 

#LOADING THE NECESSARY PACKAGES
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
library(reshape2)
library(GGally)
library(dplyr)
library(ggplot2)
options(dplyr.summarise.inform = FALSE)


#DISPLAYING THE PASSENGER ID AND AGE OF THE PASSENGER WHO IS GETTING TRANSPORTED
df2 <- df%>%
  filter(df$Transported=="TRUE")%>%
  group_by(PassengerId)%>%
  summarise(Age,Name,Transported) 

df2 

# RoomService, FoodCourt, ShoppingMall, Spa, VRDeck - Amount the passenger has billed at each of the Spaceship Titanic's many luxury amenities.
#SO LETS COMBINE THE COLUMNS AND FIND THE TOTAL SPENDING OF EACH PERSON WHO IS TRANSPORTED
df3 <- df%>%
  mutate(TotalSpending=RoomService+FoodCourt+ShoppingMall+Spa+VRDeck)%>%
  group_by(PassengerId,Name,Age,Transported)%>%
  summarise(TotalSpending)

df3
## data profiling ----
create_report(df, output_file = 'spaceship_titanic_report.html')

#DISPLAYING THE CORRELATION BETWEEN THE VARIABLES
cor <- cor(df[,c("Age","RoomService","FoodCourt","ShoppingMall","Spa","VRDeck")])
cor
#PLOTTING THE CORRELATION MATRIX
ggplot(melt(cor),aes(x=Var1,y=Var2,fill=value))+geom_tile()+scale_fill_gradient2(high="red",low="white",midpoint= 0)+theme(axis.text.x=element_text(angle=45,vjust=1,size=10,hjust=1))+labs(title="CORRELATION MATRIX")

#PLOTTING THE CORRELATION PLOT OF ALL VARIABLES
ggpairs(df[,c(6,8,9,10,11,12)])

#PLOTTING THE AGE OF PASSENGER VS TRANSPORTED 
ggplot(df,aes(x=Age,fill=Transported))+geom_bar()+labs(title="BAR PLOT OF AGE VS TRANSPORTED",x="AGE",fill="TRASNPORTED")

#PLOTTING THE PASSENGER COUNTS WHO ARE TRANSPORTED FROM EACH PLANET
ggplot(df,aes(x=HomePlanet,fill=Transported))+geom_bar()+labs(title="BAR PLOT OF HOME PLANET VS TRANSPORTED",x="HOME PLANET",fill="TRASNPORTED")

#BOX PLOT OF PASSENGER AGE BY TRANSPORTED STATUS
ggplot(df,aes(x=Age,y=Transported))+geom_boxplot()+labs(title="BOX PLOT OF AGE VS TRANSPORTED",x="AGE",fill="TRASNPORTED")

#SCATTER PLOT OF TOTAL SPENDING OF TRANSPORTED PASSENGER
ggplot(df3,aes(x=TotalSpending,y=Transported))+geom_point()+labs(title="SCATTER PLOT OF TOTAL SPENDING VS TRANSPORTED",x="TOTAL SPENDING",fill="TRANSPORTED")

#BAR PLOT OF VIP PASSENGER BEING TRANSPORTED
ggplot(df,aes(x=Transported,fill=VIP))+geom_bar(position="dodge")+labs(title="BAR PLOT OF VIP VS TRANSPORTED",x="TRANSPORTED",fill="VIP")