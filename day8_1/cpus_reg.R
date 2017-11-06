# {MASS} 패키지의cpus데이터를이용하여, cpu의퍼포먼스에대한예측모델을만들어보자.
library(MASS)
View(cpus)
class(cpus)
dim(cpus)
head(cpus)

data(cpus)
#### ?cpus ####
# name
# manufacturer and model.
# 
# syct
# cycle time in nanoseconds.
# 
# mmin
# minimum main memory in kilobytes.
# 
# mmax
# maximum main memory in kilobytes.
# 
# cach
# cache size in kilobytes.
# 
# chmin
# minimum number of channels.
# 
# chmax
# maximum number of channels.
# 
# perf
# published performance on a benchmark mix relative to an IBM 370/158-3.

#### .####
row.names(cpus) <- cpus$name
cpus <- cpus[ ,-1]
cpus <- cpus[ ,-ncol(cpus)]

plot(cpus)

sort(cpus$perf, decreasing = TRUE)[1:3]
#3번째 큰 값까지 뽑아내기

cpus_rm <- cpus[!cpus$perf %in% sort(cpus$perf, decreasing = TRUE)[1:3],]
plot(cpus_rm)

hist(cpus_rm$perf, breaks =100)
cpus_lmfit <- lm(perf~., data = cpus_rm)
summary(cpus_lmfit)
####res####
# Call:
#   lm(formula = perf ~ ., data = cpus_rm)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -165.328  -16.471   -0.174   16.642  228.007 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) -1.697e+01  5.855e+00  -2.898  0.00418 ** 
#   syct         1.608e-02  1.175e-02   1.368  0.17276    
# mmin         1.394e-02  1.375e-03  10.138  < 2e-16 ***
#   mmax         3.431e-03  4.607e-04   7.448 2.82e-12 ***
#   cach         7.285e-01  9.318e-02   7.818 3.06e-13 ***
#   chmin        2.828e+00  6.094e-01   4.641 6.27e-06 ***
#   chmax       -2.561e-03  1.743e-01  -0.015  0.98829    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 39.54 on 199 degrees of freedom
# Multiple R-squared:  0.8764,	Adjusted R-squared:  0.8726 
# F-statistic: 235.1 on 6 and 199 DF,  p-value: < 2.2e-16

#### .. ####
par(mfrow=c(2,2))

plot(cpus_lmfit)

cpus_lmfit2 <- lm(log(perf)~., data = cpus_rm)
plot(cpus_lmfit2)

cpus_rm$logperf <- log(cpus_rm$perf)
par(mfrow=c(1,1))

plot(cpus_rm)

cpus_lmfit3 <- lm(log(perf)~. -logperf-syct+I(1/syct), data = cpus_rm)
                                        #-->변수 변환 식을 넣어줄때 - 로 빼주고 +I 삽입
plot(cpus_lmfit3)
summary(cpus_lmfit3)


# 데이터 간의 상관관계가 커도 문제가 있음
cor(cpus_rm$mmin, cpus_rm$mmax)
# 추정하는 회귀식에는 문제가 없지만
# 데이터들 x간의 선형이 커서 --> 다중공산성
cor(cpus_rm$chmin, cpus_rm$chmax)

cpus_rm$meanmemory <- mean(cpus_rm$mmin, cpus_rm$mmax)
# 변수들끼리 독립일 때 상관관계가 있을 때 : lasso & ridge


####으응????####
RandomIndex <- sample(x = 1: nrow(dat), size =round(nrow(dat)*0.7),replace = FALSE)
TrainDAT <- dat[RandomIndex,]
TestDAT <- dat[-RandomIndex,]

DAT_lmfit <- lm(dat$perf ~ ., data= TrainDAT)
Null_lmfit<- lm(dat$perf ~ 1, data= TrainDAT)
