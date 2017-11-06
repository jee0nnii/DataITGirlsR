iris
plot(iris, col=iris$Species)

lm(iris$Petal.Length~., data=iris)
irisfit <- lm(iris$Petal.Length~., data=iris)
summary(irisfit)

####결과####
# Call:
#   lm(formula = iris$Petal.Length ~ ., data = iris)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.78396 -0.15708  0.00193  0.14730  0.65418 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)       -1.11099    0.26987  -4.117 6.45e-05 ***
#   Sepal.Length       0.60801    0.05024  12.101  < 2e-16 ***
#   Sepal.Width       -0.18052    0.08036  -2.246   0.0262 *  
#   Petal.Width        0.60222    0.12144   4.959 1.97e-06 ***
#   Speciesversicolor  1.46337    0.17345   8.437 3.14e-14 ***
#   Speciesvirginica   1.97422    0.24480   8.065 2.60e-13 ***
##--> Speciessetosa 보다 1.46/1.97크다.
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.2627 on 144 degrees of freedom
# Multiple R-squared:  0.9786,	Adjusted R-squared:  0.9778 
# F-statistic:  1317 on 5 and 144 DF,  p-value: < 2.2e-16



####교차항(Interaction)####
## 교차항 (Interaction term) 추가
# (범주들끼리 기울기가 다르다면! )

irisfit2 <- lm(iris$Petal.Length~. + iris$Sepal.Width * Species, data=iris)
summary(irisfit2)

####결과####
# Call:
#   lm(formula = iris$Petal.Length ~ . + iris$Sepal.Width * Species, 
#      data = iris)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.76342 -0.13309 -0.00199  0.11670  0.67634 
# 
# Coefficients: (1 not defined because of singularities)
# Estimate Std. Error t value Pr(>|t|)    
# (Intercept)                         -0.4261     0.3570  -1.194 0.234590    
# Sepal.Length                         0.6053     0.0490  12.353  < 2e-16 ***
#   Sepal.Width                         -0.3679     0.1022  -3.598 0.000442 ***
#   Petal.Width                          0.4848     0.1260   3.849 0.000179 ***
#   Speciesversicolor                    0.1376     0.4674   0.294 0.768868    
# Speciesvirginica                     1.2504     0.4847   2.580 0.010908 *  
#   iris$Sepal.Width                         NA         NA      NA       NA    
# Speciesversicolor:iris$Sepal.Width   0.4808     0.1577   3.049 0.002740 ** 
#   Speciesvirginica:iris$Sepal.Width    0.2865     0.1569   1.826 0.069883 .  
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.2561 on 142 degrees of freedom
# Multiple R-squared:  0.9799,	Adjusted R-squared:  0.9789 
# F-statistic: 990.8 on 7 and 142 DF,  p-value: < 2.2e-16

##--> 
# yhat = -0.4261 +0.6053Sepal.Length -0.3679Sepal.Width +0.4848Petal.Width 
#      +0.1376Speciesversicolor +1.2504Speciesvirginica 
#      +0.4804Sepal.Width:Speciesversicolor +0.2865Sepal.Width:Speciesvirginica

# when data is Setosa :
# yhat = -0.4261 +0.6053Sepal.Length -0.3679Sepal.Width +0.4848Petal.Width

# when data is versicolor : Speciesversicolor = 1
# yhat = -0.4261 +0.6053Sepal.Length -0.3679Sepal.Width +0.4848Petal.Width
#       +0.1376Speciesversicolor +0.4804Sepal.Width:Speciesversicolor
# yhat = (-0.4261 +0.1376Speciesversicolor) +0.6053Sepal.Length +0.4848Petal.Width
#       +(-0.3679 +0.4804Speciesversicolor)Sepal.Width
  


