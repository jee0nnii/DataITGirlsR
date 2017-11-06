# 단순선형회귀분석example 2
# 회귀분석을통해두변수의관계를설명하여라.
# : 스타벅스의초콜릿크림칩프라푸치노는370kcal, 
# 이디야의초콜릿칩플랫치노는384kcal라고알려져있다. 
# 사실인지확인하기위해, 전국스타벅스와이디야에서
# 각각랜덤으로50개의매장에서50개의프라푸치노와플랫치노의칼로리를측정했다.


coffee <- read.csv('coffee2.csv')
head(coffee)
str(coffee)
# 범주형 데이터를 포함하고 있으니까 박스플랏으로 데이터들을 확인한다.
boxplot(coffee$coffee~coffee$group)

#독립ttest
t.test(coffee$coffee~coffee$group)
# pvalue가 0.05보다 작으니까 귀무가설 기각, 대립가설 채택
# 둘의 열량에는 차이가 있다.

# 회귀분석
lm(coffee$coffee~coffee$group)

fit4 <- lm(coffee$coffee~coffee$group)
summary(fit4)
# 
# Call:
#   lm(formula = coffee$coffee ~ coffee$group)
# 
# Residuals: 잔차 오차
#   Min     1Q Median     3Q    Max 
# -11.52  -3.52   0.08   3.48  14.68 
# 
# Coefficients:  회귀계수
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)           384.3200     0.7292  527.06   <2e-16 ***
#   coffee$groupstarbucks -13.8000     1.0312  -13.38   <2e-16 ***

#   ttest의 t값과 pvalue값은 동일
#   결국 ttest는 회귀분석을 함

#   베타1은 범주형 데이터에서
#   x를 범주로 골랐을 때 그걸 기본으로 잡고 다른 것과의 차이를 비교함?
# 
# ex) 이디야와 스타벅스의 평균차이
  # y star = -384.32 - 13.8 *1
  # y edi  = -384.32 - 13.8 *0
    # 둘의 값을 빼면 뒤에 13.8만 나옴

#   t : 두그룹의 차이
  

#   ---                                   
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 5.156 on 98 degrees of freedom
# Multiple R-squared:  0.6463,	Adjusted R-squared:  0.6427 
# F-statistic: 179.1 on 1 and 98 DF,  p-value: < 2.2e-16