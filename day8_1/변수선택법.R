
##NBA
nba <-read.csv('NBA.csv', header = TRUE, row.names = 1)
nbafit11 <- lm(Spoint ~ . -Name, data= nba)  
summary(nbafit11)  

# ##전진 선택법
# # : 하나도 없는 상태에서 추가
# nbafit11 <- lm(Spoint ~ . -Name, data= nba) 
# step()

#### 변수선택법 ####
nba <- read.csv("C:/Users/HK_PARK/Desktop/DATAIT_GIRLS/데잇걸즈170907/NBA.csv", 
                header=TRUE, row.names=1)
plot(nba)
View(nba)

NBA_lmfit <- lm(Spoint~., data=nba)
summary(NBA_lmfit)

par(mfrow=c(2,2))
plot(NBA_lmfit)

# 전진선택법
NBA_forward <- step(NBA_lmfit, direction="forward")
summary(NBA_forward)

# 후진제거법
NBA_backward <- step(NBA_lmfit, direction="backward")
summary(NBA_backward)

# 단계적선택법
NBA_stepwise <- step(NBA_lmfit, direction="both")
summary(NBA_stepwise)

par(mfrow=c(2,2))
plot(NBA_lmfit)


#### NBA Data ####
rm(list=ls())

nba <- read.csv("C:/Users/HK_PARK/Desktop/DATAIT_GIRLS/데잇걸즈170907/NBA.csv", 
                header=TRUE, row.names=1)

set.seed(123)
RandomIndex <- sample(x=1:nrow(nba), size=round(nrow(nba)*0.7), replace=FALSE)
TrainNBA <- nba[RandomIndex, ]
TestNBA <- nba[-RandomIndex, ]

NBA_lmfit <- lm(Spoint~., data=TrainNBA)
Null_lmfit <- lm(Spoint~1, data=TrainNBA)

## 전진선택법
NBA_forward <- step(Null_lmfit, direction="forward", scope=formula(NBA_lmfit))

## 후진제거법
NBA_backward <- step(NBA_lmfit, direction="backward", scope=formula(Null_lmfit))
NBA_backward <- step(NBA_lmfit, direction="backward")

## 단계적선택법
NBA_stepwise <- step(Null_lmfit, direction="both", scope=formula(NBA_lmfit))

## 모델 가정 평가
par(mfrow=c(2,2))
plot(NBA_forward)
par(mfrow=c(1,1))

## 모델 예측 평가
Pred_forward <- predict(NBA_forward, TestNBA)

# MAE (Mean Absolute Error : 평균 절대 오차)
MAE_forward <- mean(abs(TestNBA$Spoint - Pred_forward))

# MSE (Mean Squared Error : 평균 제곱 오차)
MSE_forward <- mean((TestNBA$Spoint - Pred_forward)^2)

plot(Pred_forward~TestNBA$Spoint)
abline(a=0, b=1, col="red", lwd=3)


## Backward, Stepwise 비교


