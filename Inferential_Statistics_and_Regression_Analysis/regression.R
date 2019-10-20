
            
df_gglMerchandise %>%
  group_by(source_medium) %>%
  summarise(totalPurchases = sum(purchasUSRe_completed_goal_1_completions))

#price with cut (continious and continious)
ggplot(diamonds, aes(x=carat, y = price))+ geom_point()

#price with cut (categorial and continious)
ggplot(diamonds, aes(x=cut, y = price))+ geom_boxplot()

ggplot(diamonds, aes(x=color, y = price))+ geom_boxplot()

#categorical vs categorical Barchart

#count
ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~ cut)

#fit model
lm_diamonds1 <- lm(log(price) ~ log(carat), data = diamonds)
View(lm_diamonds1)

##GGPLOT TO SEE LOG REGRESSION
ggplot(diamonds,aes(x=log(carat), y=log(price))) + geom_point() + geom_smooth()
 #extend dataframe by adding column for residual prices
df_diamondsExtndd <- cbind(diamonds, exp(lm_diamonds1$residuals))
df_diamondsExtndd %>%
  rename(resPrice = 'exp(lm_diamonds1$residuals)') -> df_diamondsExtndd


