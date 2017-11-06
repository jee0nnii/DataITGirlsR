#### Intro Logistic Regression ####
getwd()
## example 1
# SBPdata.txt 데이터는33명의여성에대해 
# 나이와혈압을나타내는데이터이다. 
# 나이에따른혈압의관계를추정해보자.

SBPdat <- read.table("SBPdata.txt",header=TRUE)
str(SBPdat)
head(SBPdat)
plot(SBP~Age, data=SBPdat, pch=19)

lmfit1 <- lm(SBP~Age, data=SBPdat)
summary(lmfit1)
abline(lmfit1, col="red", lwd=3)

## example 2
# CDdata.txt 데이터는33명의여성을대상으로나이와암진단여부를나타낸다. 
# (CD = 1 : 암진단Yes, CD= 2 : 암진단No) 
# 이때, 나이에따른암진단여부의관계를추정해보고, 산점도로나타내보자.
CDdat <- read.table("CDdata.txt",header=TRUE)
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


#### logistic regression ####

## example 1
CDdat <- read.table("C:/Users/HK_PARK/Desktop/DATAIT_GIRLS/데잇걸즈170912/CDdata.txt",
                    header=TRUE)
head(CDdat)
plot(CD~Age, data=CDdat, 
     main="Cancer Diagnosis with Linear Regression",
     xlab="AGE",
     ylab="CD",
     pch=19)

glmfit <- glm(CD~Age, family=binomial, data=CDdat)
summary(glmfit)
plot(glmfit)

exp(0.132)

## example 2 (Prostate Cancer)
PCdat <- read.csv("ProstateCancer.csv",header=TRUE)
head(PCdat)
str(PCdat)
PCdat$Xray <- as.factor(PCdat$Xray)
PCdat$Size <- as.factor(PCdat$Size)
PCdat$State <- as.factor(PCdat$State)
PCdat$Y <- as.factor(PCdat$Y)

glmfit2 <- glm(Y~., family=binomial, data=PCdat)
glmfit2 <- glm(Y~Age+Pho+as.factor(Xray)+as.factor(Size)+as.factor(State),
               family=binomial, data=PCdat)
summary(glmfit2)

