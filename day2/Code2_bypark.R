rm(list=ls())

## 순열 1
s1 <- 1:100
s2 <- -1120.5 : 10.5

s2
head(s2)

## 순열 2
s3 <- seq(from=1, to=100, by=3)  #sequence
head(s3)
s4 <- seq(from=1, to=100, length.out=15)
head(s4, 10)
length(s4)  # 벡터의 길이 : length.out으로 벡터의 길이 조절함
length(s3)

## 순열 3
s5 <- rep(3, times=10)
s5
s6 <- rep(c(1, 2), times=10) #1,2를 열 번씩
s6
s7 <- rep(c(1, 2), each=10) #1과 2를 각각 열 번씩
s7

getwd()
setwd("C:/Users/Lucy Kim/Documents/dataitgirls/datahee")
## "$"를 통해 데이터 접근하기
list.files()
dat <- read.csv("dat14.csv", header=TRUE)
str(dat)
dim(dat)

View(dat)

dat$Xray <- as.factor(dat$Xray)
str(dat)
dat$TumorSize <- as.factor(dat$TumorSize)
dat$TumorState <- as.factor(dat$TumorState)

## attach() / detach() 접근하기

TumorSize

attach(dat)

TumorSize
TumorState

detach(dat)

TumorSize


## Index로 접근하기
dim(dat)
# dat[행(row), 열(column)]
dat[ ,3]  # Xray
head(dat)

dat[24, ]

dat[ ,c(3, 4)]

dat[ ,seq(from=1, to=6, by=2)] # 홀수 열 가져오기 / column
dat[seq(from=2, to=53, by=2), ]# 짝수 행 가져오기
dat[seq(from=2, to=dim(dat)[1], by=2), ]

## 논리값으로 데이터 접근하기
1 == 2
1 == 1
1 == c(1, 2, 3, 1, 1)

dat[dat$Xray == 1, ] #Xray가 1인 값만 전체를 불러옴

dat[dat$Age >= 60, ] #Xage 가 60이상인 사람을 불러옴


## 데이터를 이용한 기초통계
mean(dat$Age)
max(dat$Age)
min(dat$Age)
var(dat$Age)

median(dat$Age)

table(dat$Age)

table(dat$TumorSize)

summary(dat$Age)

