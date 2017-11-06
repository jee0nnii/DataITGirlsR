reg <- read.table('C:/Users/Lucy Kim/Documents/dataitgirls/datahee/reg_ex1.txt', header = TRUE)
reg
str(reg)

lm(reg$S ~ reg$X + as.factor(reg$E)+as.factor(reg$M), data=reg)
fit5 <- lm(reg$S ~ reg$X + as.factor(reg$E)+as.factor(reg$M), data=reg)
summary(fit5)


# Call:
#   lm(formula = reg$S ~ reg$X + as.factor(reg$E) + as.factor(reg$M), 
#      data = reg)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -1884.60  -653.60    22.23   844.85  1716.47 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)        8035.60     386.69  20.781  < 2e-16 ***
#   reg$X               546.18      30.52  17.896  < 2e-16 ***
#   as.factor(reg$E)2  3144.04     361.97   8.686 7.73e-11 ***
#   as.factor(reg$E)3  2996.21     411.75   7.277 6.72e-09 ***
#   as.factor(reg$M)1  6883.53     313.92  21.928  < 2e-16 ***
#   --- 변수가 여러개여서 인터셉트가 여러개가 뜸

        # 8035.60 +  546.18x + 3144.04 Ie2 + 2996.21 Ie3 + 6883.53 Im1

  #         x 는 경력변수
  #         x이 1씩 증가할때 연봉이 546.18 만큼 증가한다
  #         
  #         E 고졸이랑 학부 비교했을때 3144.04 차이남                
  #         E고졸이랑 그이상의 학력과 비교했을때 2996.21 차이남
  #           --> 학부랑 그이상은 2년정도 차이 난다.
  #         
  #         M 관리직이 없는 사람보다 있는 사람의 연봉이 6883.53 차이남
  # ex )
  #         if (x =10, e =고졸,  m = 관리)
  #           --> ie2, ie3에 고졸이 없으니까 ㅇㅒ의 값은 0이 됨
  #         if (x =5, e =학부,  m = 관리x)
  #           --> ie2에 1 대입, ie3 은 0, Im1 은 0

          
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 1027 on 41 degrees of freedom
# Multiple R-squared:  0.9568,	Adjusted R-squared:  0.9525 

# R-squared : 이 모형이 데이터를 설명하고 있는 정도
#                 --> 모델, 모형은? : 
#   산점도에서 회귀식을 여러가지 도출할 수 있는데 그중 유의성을 가장 잘보여주는 모델을 선택하는 것임
# 
# x가 y를 95% 정도 설명할 수 있다.
# r-square 는 변수가 많을수록 높아짐
# 변수가 많다고 좋은 건 아님
# 
# Ad : 보정을 했지만 완벽한 척도를 보여주진 않음


# F-statistic: 226.8 on 4 and 41 DF,  p-value: < 2.2e-16
# ***로 각자의 pvalue를 보고 유의한지 파악

