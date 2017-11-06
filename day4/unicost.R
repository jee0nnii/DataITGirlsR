# 이전 정보를 가지고 단가를 예측

# outlier 발견해서 처리
# 어떤 변수를 범주형으로 볼지
# 연속형 변수?
# 범주형 변수에 중점 두기

getwd()
setwd("C:/Users/Lucy Kim/Documents/dataitgirls/datahee")
install.packages("readxl")
library(readxl)

dat <- read_xlsx("Unitcost_dat.xlsx", sheet = 1)
head(dat)
View(dat)

colnames(dat)
dim(dat)

dat$detail <- factor(dat$detail)
dat$rush <- factor(dat$rush)

plot(dat)

#데이터의 가장 큰 값 위치
which.max(dat$ave_cost)
#데이터의 가장 큰 값을 가져옴
dat$ave_cost[which.max(dat$ave_cost)] 
#1523 을 15.23으로 변경
dat$ave_cost[which.max(dat$ave_cost)] <- 15.23

####goal_sd####
hist(dat$goal_sd)
table(dat$goal_sd)
#3가지 값만 가지는 것을 확인할 수 있음 
#범주형으로 취급해서 처리함
dat$goal_sd <- factor(dat$goal_sd)

install.packages("GGally")
library(GGally)
#eda 할때 유용함
ggpairs(dat)

##ave_cost_outlier 제거
dat <- dat[-which.max(dat$ave_cost),]

detach(dat)
##범주형 변수 : goal_sd, detail, rush
table(goal_sd, detail)  #관측치가 아예 없는 값이 나타남
table(goal_sd, rush)
table(rush, detail)


##3번째 인자의 값을 기준으로
table(rush, detail, goal_sd)

##gold_sd = 0.1 이면 A그룹 
# 0.5 이고 detailed 면 B그룹
# 0.5 이고 rough 면 C그룹
# 나머지는 D그룹

str(dat$goal_sd)

goalgroup <- c()

dat$NewGroup <- if (dat$goal_sd == 0.1){
  'A'
  }else if (dat$goal_sd == 0.5 & dat$detail =="detailed"){
  'B'
    }else if (dat$goal_sd == 0.5 & dat$detail == "rough"){
  'C'
      }else{
        'D'
}

dat$NewGroup <- ifelse(dat$goal_sd == 0.1, 'A', 
                        ifelse(dat$goal_sd == 0.5 & dat$detail =="detailed",'B',
                               ifelse(dat$goal_sd == 0.5 & dat$detail == "rough",'C','D')))

##Units변수
plot(dat$ave_cost ~ dat$units)
table(dat$units)
#200 이면 a, 300이면 b, 나머지는 c
dat$NewUnits <- ifelse(dat$units == 200, 'A',
                       ifelse(dat$units == 300, 'B', 'C'))


####,,,,,####
#컬럼별 summary
for (i in 1:dim(dat)[2]){
  print(summary(dat[,i]))
}

#결측치는 없음
for (i in 1:dim(dat)[2]){
  print(sum(is.na(dat[,i])))
}

#미세작업과 작업속도 간의 상관관계
dd <- data.frame(dat$detail,dat$rush)
dd

fdetail<-as.numeric(factor(dat$detail))
frush<-as.numeric(factor(dat$rush))

df <- data.frame(fdetail,frush)
df
library(PerformanceAnalytics)
chart.Correlation(df,histogram = TRUE, pch=19)
