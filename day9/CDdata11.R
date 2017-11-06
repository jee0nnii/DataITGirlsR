getwd()
setwd("C:/Users/joo/Documents/dataitgirls9")
CDdat <- read.table("CDdata.txt", header=TRUE)
head(CDdat)
par(mfrow=c(1,1))
plot(CD~Age, data=CDdat, 
     main="Cancer Diagnosis with Linear Regression",
     xlab="AGE",
     ylab="CD",
     pch=19)

lmfit2 <- lm(CD~Age, data=CDdat)
summary(lmfit2)
abline(lmfit2, col="red", lwd=3)

## Logistic regression
glmfit <- glm(CD~Age, family=binomial, data=CDdat) # binomial : 이항분포
# glmfit <- glm(CD~Age, family=gaussian, data=CDdat) # guassian : 정규분포

summary(glmfit)
