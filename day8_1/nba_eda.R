# NBA 데이터를이용해, 슛확률(Spoint)에대해회귀분석을시행해보자.

nba <-read.csv('NBA.csv')
head(nba)

library(GGally)
plot(nba)
str(nba)

for (i in 1:dim(nba)[2]){ 
  print(summary(nba[i]))
}

test <- subset(nba, select=c(2:11))
ggpairs(test)

colnames(nba)
# [1] "Name"      "height"    "games"     "minutes"   "age"       "point"    
# [7] "assist"    "rebound"   "fieldgoal" "freethrow" "Spoint" 

hist(nba$point) 

attach(nba)

#anova test
nbafit2 <- aov(Spoint ~ height, data = nba)
# height 변수가 유의한가? 하는 변수를 선택할 때 사용
# lm(Spoint ~ 1, data = nba)
# lm(Spoint ~ height, data = nba)


####회귀분석####
lm(Spoint ~ . -Name, data= nba)
nbafit <- lm(Spoint ~ . -Name, data= nba)
summary(nbafit)

# Call:
#   lm(formula = Spoint ~ height + games + minutes + age + point + 
#        assist + rebound + fieldgoal + freethrow, data = nba)
# 
# Residuals:
#   Min        1Q    Median        3Q       Max 
# -0.143506 -0.038752  0.000045  0.032880  0.285624 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  3.295e-01  2.403e-01   1.371 0.173553    
# height      -1.188e-04  1.115e-03  -0.107 0.915384    
# games        1.389e-04  7.311e-04   0.190 0.849729    
# minutes     -6.732e-05  2.647e-05  -2.543 0.012612 *  
#   age         -3.275e-03  1.915e-03  -1.710 0.090551 .  
# point        2.558e-02  2.476e-03  10.330  < 2e-16 ***
#   assist      -9.280e-03  4.434e-03  -2.093 0.039004 *  
#   rebound     -1.789e-02  8.759e-03  -2.042 0.043929 *  
#   fieldgoal    5.451e-03  1.545e-03   3.528 0.000648 ***
#   freethrow   -1.674e-03  7.797e-04  -2.147 0.034309 *  
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.06221 on 95 degrees of freedom
# Multiple R-squared:  0.7368,	Adjusted R-squared:  0.7118 
# F-statistic: 29.54 on 9 and 95 DF,  p-value: < 2.2e-16

####회귀분석####
nbafit1 <- lm(Spoint ~ games + minutes + point + assist + rebound + fieldgoal +
     freethrow, data= nba)
summary(nbafit1)


getwd()
setwd("C:/Users/Lucy Kim/Documents/dataitgirls/day8_1")
#### nba 과제 풀이 ####
nba <- read.csv("NBA.csv")

View(nba)
str(nba)

lm(Spoint ~ height + games + minutes + age + point + assist + rebound + fieldgoal + freethrow, data=nba)
fit <- lm(Spoint ~ . -Name, data=nba)
summary(fit)


## anova test
fit0 <- aov(height ~ Spoint, data = nba)
summary(fit0)

fit0 <- aov(Spoint ~ height, data=nba)

#1 ) lm(Spoint ~ 1, data=nba)
#2 ) lm(Spoint ~ height, data=nba)

fit1 <- aov(games ~ Spoint, data = nba)
summary(fit1)
TukeyHSD(fit1)

fit2 <- aov(minutes ~ Spoint, data = nba)
summary(fit2)

fit3 <- aov(age ~ Spoint, data = nba)
summary(fit3)

fit4 <- aov(point ~ Spoint, data = nba) # ***
summary(fit4)

fit5 <- aov(assist ~ Spoint, data = nba) 
summary(fit5)

fit6 <- aov(rebound ~ Spoint, data = nba) # ***
summary(fit6)

fit7 <- aov(fieldgoal ~ Spoint, data = nba) # ***
summary(fit7)

fit8 <- aov(freethrow ~ Spoint, data = nba) # .
summary(fit8)

model_nba <- lm(Spoint ~ point + assist + fieldgoal, data=nba)
summary(model_nba)

