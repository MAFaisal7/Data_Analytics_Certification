test <- test
train<- train
View(train)

library(statsr)
library(dplyr)
library(BAS)
library(ggplot2)
library(MASS)
library(broom)
library(lubridate)
library(gridExtra)
library(GGally)

# Retrieve data structure of the variables in the dataset #
train <- tbl_df(train)
str(train)

#BOX plot price Vs Neighbourhood
ggplot(train, aes(x=Neighborhood, y=SalePrice)) + 
  geom_boxplot(outlier.colour="red", outlier.shape=8,
               outlier.size= 1)
#BOX Plot price vs Overall quality
  
ggplot(train, aes(x=OverallQual)) + 
geom_bar()

#MS Zoning and Sale Price

ggplot(data = train, aes(x= MSZoning, y=SalePrice, fill= OverallQual)) + 
  geom_boxplot()

#Coorelation 
library(tidy)
chooseCRANmirror(graphics=FALSE, ind=1)
knitr::opts_chunk$set(echo = TRUE)

subdata <- select(train, LotArea,GrLivArea,TotalBsmtSF,
                  SalePrice)

cor.matrix <- round(cor(subdata),2)
# Here is the corrleation matrix
cor.matrix
library(corrplot)
corrplot(cor.matrix, type="upper",
         order = "hclust", tl.col="black",
         tl.srt=45)


## Development and assessment of an initial model, following a semi-guided process of analysis





## EDA and Least Square Regression
# kitchen sink model
all.model <- lm(SalePrice ~ OverallQual, data = train)
# predict on test set
pred.all <- predict(all.model, test)
RMSE.all <- sqrt(mean((pred.all - test)^2))

