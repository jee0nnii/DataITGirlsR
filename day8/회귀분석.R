x <- c(3,3,4,5,6,6,7,8,8,9)
y <- c(9,5,12,9,14,16,22,18,24,22)

plot(y~x, xlab = "복용량",ylab= "지속기간")

#상관분석
?cor.test
cor.test(x,y)
##alternatives --> 상관분석에서는 less, greater는 음의 상관관계인지 양인지
##0.05보다 작음 : 귀무가설 기각, 대립 채택 / 유의 하다.


lm(y~x)


# Call:
#   lm(formula = y ~ x)
# 
# Coefficients: # 회귀계수
#   (Intercept)            x  
# -1.071        2.741  
# 
# ==> y= -1.071 + 2.741x
#     : x가 1 증가하면 y 가 2.741 정도 증가함
#                         : y의 변화량이 중요함****

fit3 <-lm(y~x)
summary(fit3)
# 
# Call:
#   lm(formula = y ~ x)
# 
# Residuals:
# 오차들에 대한 정보값들을 볼 수 있음
#     Min      1Q  Median      3Q     Max 
# -3.6333 -2.0128 -0.3741  2.0428  3.8851 
#  
# Coefficients:
# 회귀계수
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  -1.0709     2.7509  -0.389 0.707219    
# x             2.7408     0.4411   6.214 0.000255 ***
                                          # pvalue 해석
                                          #이들의 귀무가설은??
                                            # y = beta0 + beta1 x
                                          # h0는 (beta1) = 0 이다.(회귀계수가 0이다.)
                                                  #0.000255 *** : 0.05보다 작음 : 유의하다?
                                          # h1 !=0 : 
                                          # 
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.821 on 8 degrees of freedom
# Multiple R-squared:  0.8284,	Adjusted R-squared:  0.8069 
# F-statistic: 38.62 on 1 and 8 DF,  p-value: 0.0002555


