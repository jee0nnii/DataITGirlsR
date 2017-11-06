getwd()
# insurance.csv 데이터를이용하여, 보험금액에대한예측모형을만들어보자. 
# (EDA, 데이터분할, 회귀분석, 변수선택법, 모형성능평가… )
# -age : 제1순위보험금수령인의나이나타내는정수형(63이하) 
# -sex : male / female 
# -bmi: body mass index 
# -children : 보험에서보장하는아이들의수 
# -smoker : yes/no 
# -region : 거주지역 
# -charge : 보험금액
setwd("C:/Users/Lucy Kim/Documents/dataitgirls/day9")

dat <- read.csv("insurance.csv")
