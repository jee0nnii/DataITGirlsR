##NBA
rm(list = ls())
nba <-read.csv('NBA.csv', header = TRUE, row.names = 1)
View(nba)

#데이터 짜르기
#train :7 / test :3
#랜덤으로 가져와서 뽑기

set.seed(123)     #123번째의 패턴을 갖는 랜덤값을 고정으로 뽑아냄

RandomIndex <- sample(x = 1: nrow(nba), size =round(nrow(nba)*0.7),replace = FALSE)
TrainNBA <- nba[RandomIndex,]
TestNBA <- nba[-RandomIndex,]

NBA_lmfit <- lm(Spoint ~ ., data= TrainNBA)
Null_lmfit<- lm(Spoint ~ 1, data= TrainNBA)

#전진선택법
NBA_forward <- step(Null_lmfit, direction = "forward", scope=formula(NBA_lmfit))
#point추가
#minutes추가
#fieldgoal -> assist -> freethrow -> rebound

#후진제거법
NBA_backward <- step(NBA_lmfit, direction = "backward", scope=formula(Null_lmfit))
#games -> height

#단계적선택법
NBA_stepwise <- step(Null_lmfit, direction = "both", scope=formula(NBA_lmfit))
# scope 최대 혹은 최소로 어디까지 비교할지?

par(mfrow=c(1,1))
par(mfrow=c(2,2))
plot(NBA_forward)


####예측평가####
#전진선택법
Pred_forward <- predict(NBA_forward, TestNBA)

#MAE (평균 절대 오차 : MEAN ABSOLUTE ERROR )
# 절대값 (실제값 - 예측값)
MAE_forward <- mean(abs(TestNBA$Spoint - Pred_forward)) #0.03436299
#MSE (평균 제곱 오차 :MEAN SQUARED ERROR )
MSE_forward <- mean((TestNBA$Spoint - Pred_forward)^2)  #0.001813627
#plot
plot(Pred_forward~TestNBA$Spoint)
abline(a=0,b=1,col="red",lwd=2)

#후진제거법
Pred_backward <- predict(NBA_backward, TestNBA)

MAE_backward <- mean(abs(TestNBA$Spoint- Pred_backward)) #0.03436299
MSE_backwawrd <- mean((TestNBA$Spoint- Pred_backward)^2) #0.001813627

plot(Pred_backward~TestNBA$Spoint)
abline(a=0,b=1,col="red",lwd=2)

#단계적선택법
Pred_stepwise <- predict(NBA_stepwise, TestNBA)
MAE_stepwise <- mean(abs(TestNBA$Spoint- Pred_stepwise)) #0.03436299
MSE_stepwise <- mean((TestNBA$Spoint- Pred_stepwise)^2) #0.001813627

plot(Pred_stepwise~TestNBA$Spoint)
abline(a=0,b=1,col="red",lwd=2)




