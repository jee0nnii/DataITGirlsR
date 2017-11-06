# 참게데이터(crab_data.txt)를 이용하여, 
# 로지스틱회귀분석을 적합해보자.
setwd("C:/Users/Lucy Kim/Documents/dataitgirls/day9")
crab <- read.table('crab_data.txt',header=TRUE)
head(crab)
str(crab)

#종속변수는 y : 부수체의 여부
#해줘야될 eda : color / spine : 범주형으로 변환

crab$color <- factor(crab$color)
crab$spine <- factor(crab$spine)

dim(crab)[2]
for(i in 1: dim(crab)[2]){
  print(summary(crab[i]))
}

par(mar=c(1,1,1,1))

boxplot(crab$satell)
boxplot(crab$weight)
boxplot(crab$width)

which.max(crab$width)
which.max(crab$weight)

crab[which.max(crab$weight),]

crab <- crab[-c(141),]

RandomIndex <- sample(1:nrow(crab), size=round(nrow(crab)*0.7), replace=F)

train.crab <- crab[RandomIndex,]
test.crab <- crab[-RandomIndex,]

#로지스틱 회귀분석 적합???????????
crabfit<-glm(y~., family=binomial, data=crab)
summary(crabfit)
par(mfrow=c(2,2))
plot(crabfit)

coef(crabfit)

# http://www.datamarket.kr/xe/index.php?mid=board_BoGi29&listStyle=viewer&document_srl=22328

predcrab <- predict(crabfit, test.crab, type = "response")
table(test.crab$y)
cutoff0.5 <- ifelse(predcrab > 0.5, 1, 0)
pred_tab <- table(test.crab$y, cutoff0.5)

## 정확ㄷ
(pred_tab[1,1] + pred_tab[2,2]) /sum(pred_tab)

## 민감도
pred_tab[2,2] / sum(pred_tab[2, ])

## 특이도
pred_tab[1,1] / sum(pred_tab[1, ])

