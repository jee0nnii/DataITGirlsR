# car 데이터를이용해, 자동차의가격에 대해 회귀분석을 시행해보자.
car <- read.csv('car.csv')
head(car)
str(car)
####년식을 factor로 바꾸기####
# car$년식 <- factor(car$년식)
# Call:
#   lm(formula = car$가격 ~ ., data = car)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -2281.3  -245.2   -27.6   237.1  5700.0 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  -4378.2800   558.6482  -7.837 4.55e-14 ***
#   회사명대우     811.5605   188.3919   4.308 2.10e-05 ***
#   회사명삼성     222.6473   203.9589   1.092   0.2757    
# 회사명쉐보레    24.4883    89.6611   0.273   0.7849    
# 회사명쌍용     890.2829   142.6791   6.240 1.16e-09 ***
#   회사명현대     -66.7786    87.8979  -0.760   0.4479    
# 년식2011       -45.7604   239.7635  -0.191   0.8487    
# 년식2012       185.8026   231.4411   0.803   0.4226    
# 년식2013       324.3807   230.6916   1.406   0.1605    
# 년식2014       316.0585   226.3951   1.396   0.1635    
# 년식2015       525.9752   224.2822   2.345   0.0195 *  
#   종류대형     -2290.3069   270.5717  -8.465 5.45e-16 ***
#   종류소형      -889.4902   119.0561  -7.471 5.39e-13 ***
#   종류준중형   -1472.7470   159.6269  -9.226  < 2e-16 ***
#   종류중형     -1581.7429   215.7161  -7.333 1.34e-12 ***
#   연비            97.6893    20.8936   4.676 4.06e-06 ***
#   마력             2.3399     2.3576   0.993   0.3216    
# 토크            27.7850    11.6677   2.381   0.0177 *  
#   연료가솔린    -120.5033   147.6669  -0.816   0.4150    
# 연료디젤      -951.8287   214.0514  -4.447 1.14e-05 ***
#   배기량           1.7267     0.1464  11.793  < 2e-16 ***
#   중량             1.4231     0.3214   4.427 1.24e-05 ***
#   변속기자동     307.1785    72.2290   4.253 2.65e-05 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 595.2 on 385 degrees of freedom
# Multiple R-squared:  0.8505,	Adjusted R-squared:  0.842 
# F-statistic: 99.56 on 22 and 385 DF,  p-value: < 2.2e-16
# factor변경
########
par(mfrow=c(1,1))
hist(car$년식)

colnames(car) 
# [1] "가격"   "회사명" "년식"  
# [4] "종류"   "연비"   "마력"  
# [7] "토크"   "연료"   "배기량"
# [10] "중량"   "변속기"
# 범주형 : "회사명""종류""연료""변속기" 

plot(car)
par(mfrow=c(2,2))
boxplot(car$가격 ~ car$변속기, car)
boxplot(car$가격 ~ car$회사명, car)
boxplot(car$가격 ~ car$종류, car)
boxplot(car$가격 ~ car$연료, car)

#car$회사명, car$종류, car$연료, 
which.max(car$회사명 == "쌍용")


1:dim(car)[2]
for (i in 1:dim(car)[2]){ 
  print(summary(car[i]))
}
# -->  연비, 중량에 널값이 존재함을 발견

is.na(car$연비)
car[is.na(car$연비),]
car[is.na(car$중량),]
# 동일한 애임 --> 지울까?

library(dplyr)
filter(car, car$마력 == 175)
hist(car$가격)
filter(car, car$토크 == 46)

#null값이 포함된 친구 지우기
car <-car[!is.na(car$연비),]
dim(car)

max(car$가격)
car$가격[car$가격 == 14570] <- mean(car$가격)

####회귀분석####
lm(formula = car$가격 ~ ., data =car)
fit0 <- lm(formula = car$가격 ~ ., data =car)
summary(fit0)

# Call:
#   lm(formula = car$가격 ~ ., data = car)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -2233.0  -268.1   -23.9   239.6  5710.6 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  -2.409e+05  5.496e+04  -4.383 1.51e-05 ***
#   회사명대우    8.265e+02  1.847e+02   4.475 1.01e-05 ***
#   회사명삼성    2.185e+02  2.032e+02   1.075   0.2828    
# 회사명쉐보레  7.776e+00  8.627e+01   0.090   0.9282    
# 회사명쌍용    9.065e+02  1.377e+02   6.583 1.50e-10 ***
#   회사명현대   -6.174e+01  8.478e+01  -0.728   0.4669    
# 년식          1.177e+02  2.723e+01   4.321 1.98e-05 ***
#   종류대형     -2.312e+03  2.692e+02  -8.586  < 2e-16 ***
#   종류소형     -9.002e+02  1.178e+02  -7.642 1.69e-13 ***
#   종류준중형   -1.482e+03  1.587e+02  -9.341  < 2e-16 ***
#   종류중형     -1.598e+03  2.149e+02  -7.435 6.71e-13 ***
####--> 경형이 빠짐 : 경형을 기본으로 잡고 비
#   연비          9.569e+01  1.971e+01   4.854 1.75e-06 ***
#   마력          2.526e+00  2.312e+00   1.093   0.2751    
# 토크          2.750e+01  1.156e+01   2.379   0.0178 *  
#   연료가솔린   -1.020e+02  1.452e+02  -0.702   0.4831    
# 연료디젤     -9.276e+02  2.095e+02  -4.429 1.23e-05 ***
#   배기량        1.711e+00  1.445e-01  11.839  < 2e-16 ***
#   중량          1.428e+00  3.188e-01   4.480 9.85e-06 ***
#   변속기자동    3.059e+02  7.163e+01   4.271 2.45e-05 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 593.9 on 389 degrees of freedom
# Multiple R-squared:  0.8496,	Adjusted R-squared:  0.8427 
# F-statistic: 122.1 on 18 and 389 DF,  p-value: < 2.2e-16
# 
# p-value 값이 0.05보다 작음 귀무가설 기각, 대립가설 채택 : 유의하다.
# 종속변수 : 가격 / 독립변수 : 나머지들

####회귀분석####
lm(formula = car$가격 ~ car$연비+car$마력+car$토크+car$배기량+car$중량, data =car)
carfit <- lm(formula = car$가격 ~ car$연비+car$마력+car$토크+car$배기량+car$중량, data =car)
summary(carfit)
# p-value 값이 0.05보다 작음 귀무가설 기각, 대립가설 채택 : 유의하다.
# 변수가 많을 수록 rsquared 값이 커짐 but많다고 좋지않음 더 복잡함




#### car 과제 풀이 ####
dat_car <- read.csv("car.csv", header=TRUE)

str(dat_car)                          # 01. 년식->factor / 02. 토크 hist 확인 / 
dim(dat_car)                          # 409, 11
View(dat_car)

# 01.
dat_car$년식 <- factor(dat_car$년식)   # 년식 factor로 바꾸기


summary(dat_car)                       # 03. 04. NA : 연비_01, 중량_01 / 05. 06. 가격, 마력 max 확인

# 02.
hist(dat_car$토크)                     # 별거없는듯

# 03. 
is.na(dat_car$연비)                                      # 연비 na값 평균 대체
dat_car$연비[is.na(dat_car$연비)] <- mean(dat_car$연비, na.rm = T)
is.na(dat_car$연비)

# 04. 
is.na(dat_car$중량)                                      # 중량 na값 평균 대체
dat_car$중량[is.na(dat_car$중량)] <- mean(dat_car$중량, na.rm = T)

# 05. 
dat_car$가격                                         # 11150 14570 10687
max(dat_car$가격)                                    # 14570
which.max(dat_car$가격)                              # 3 (2,3,4 과하게 높음->평균 대체)
median(dat_car$가격)                                 # 1845        
dat_car$가격[dat_car$가격 == 11150] <- median(dat_car$가격) 
dat_car$(가격 == 14570) <- median(dat_car$가격)
dat_car$(가격 == 10687) <- median(dat_car$가격)

# 06. 
lm(가격 ~ ., data = dat_car)
fit <- lm(가격 ~ ., data = dat_car)
summary(fit)

dat_car$종류
