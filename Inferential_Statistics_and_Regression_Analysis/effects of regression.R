df_transformations <- data.frame(X = 1:50)
library(dplyr)
df_transformations %>% mutate(X1 = X,
                              XSquare = X^2,
                              XSqRoot = sqrt(X),
                              logX = log(X)) -> df_transformations

library(ggplot2)
 
log(13)-log(10)

  x <- cigaretteConsumption
  View(x)
  lm_x()
  summary(x)
  
  
  df <- newYorkRivers
  View(newYorkRivers)
  
  df1 <- salary
  View(salary)
  summary(salary)
  ?salary
