# adm에서제공하는데이터셋을이용하여, 
# 로지스틱회귀분석을이용하여 지원자의입학여부에대한모델을세워보자.

# 종속변수 : admit 지원자의 입학여부 범주형 0:입학안함/ 1:입학함
# 독립변수 :
# gre 시험점수 1 수치형
# gpa 시험점수 2 수치형
# rank 학교등급 ? 1(가장높음) ~ 4(가장낮음)

getwd()
setwd("C:/Users/Lucy Kim/Documents/dataitgirls/day9")

adm <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

head(adm)
tail(adm)
str(adm)
dim(adm)

for (i in 1:dim(adm)[2]){
  print(summary(adm[i]))
}

RandomIndex <- sample(1:nrow(adm), size=round(nrow(adm)*0.7), replace=F)

##separating data into test and train
train.adm<-adm[RandomIndex,]
test.adm <- adm[-RandomIndex,]

admfit <- glm(adm$admit~., family=binomial, data=adm)
summary(admfit)

predadm <- predict(admfit, test.adm, type="response")

table(test.adm$admit)
cutoff0.5 <- ifelse(predadm > 0.5, 1, 0)
pred_tab <- table(test.adm$admit, cutoff0.5)

## 정확도
(pred_tab[1,1] + pred_tab[2,2]) /sum(pred_tab)

## 민감도
pred_tab[2,2] / sum(pred_tab[2, ])

## 특이도
pred_tab[1,1] / sum(pred_tab[1, ])

##패키지를 쓰지 않고 ROC커브를 그리기
cutoff <- seq(from =0, to =1, length.out = 101)
head(cutoff)

accuracy <- sensitivity <- specificity <- c()
for(i in 1: length(cutoff)){
  pred <- ifelse(predadm >= cutoff[i], 1, 0)
  
  pred_tab <- table(test.adm$admit, pred)

  if(sum(pred %in% 1)==length(pred)){
    acc <- sum(test.adm$admit)/length(test.adm$admit)
    sen <- 1
    spe <- 0
  }else if(sum(pred %in% 0)==length(pred)){
    acc <- 1-sum(test.adm$admit)/length(test.adm$admit)
    sen <- 0
    spe <- 1
  }else{
    acc <- (pred_tab[1,1] + pred_tab[2,2]) /sum(pred_tab)
    sen <- pred_tab[2,2] / sum(pred_tab[2, ])
    spe <- pred_tab[1,1] / sum(pred_tab[1, ])
  }

  accuracy <- c(accuracy, acc)
  sensitivity<- c(sensitivity,sen)
  specificity <- c(specificity, spe)
}
  
head(accuracy)  
head(sensitivity)
tail(sensitivity)  

ROCadm <- data.frame(Y = sensitivity,
                     X = 1-specificity)  
plot(Y~X, data = ROCadm,
     type = "l",
     xlab = "1-specificity",
     ylab = "sensitivity",
     lwd = 2)
abline(a=0,b=1,col="red",lwd=2)  
  
install.packages("Epi")
library(Epi)
ROC(form=admit ~.,data=train.adm)
  
  
  