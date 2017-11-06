rm(list=ls())

## 디렉토리 찾기
getwd()

setwd("C:/Users/HK_PARK/Desktop/DATAIT_GIRLS/데잇걸즈170829")


dat1 <- read.table(file="readtable_ex1.txt", header=TRUE)
dat2 <- read.table(file="readtable_ex1.txt", header=FALSE)

dim(dat1) # dimension (데이터의 형태) 행/열
dim(dat2)

str(dat1) # structure (데이터의 구조)
str(dat2)

head(dat1, 8)
head(dat2, 4)

tail(dat1)
tail(dat2, 3)

## readtable_ex2 불러오기
list.files()
dat3 <- read.table(file="readtable_ex2.txt", header=TRUE, sep=",")
dat4 <- read.table(file="readtable_ex2.txt", header=TRUE, 
                   sep=",", na.strings=c("Kim", "Lee"))


## csv 형식 불러오기
dat5 <- read.csv(file="C:\\Users\\HK_PARK\\Desktop\\DATAIT_GIRLS\\readcsv_ex.csv",
                 header=TRUE)
str(dat5)
dat6 <- read.csv(file="C:\\Users\\HK_PARK\\Desktop\\DATAIT_GIRLS\\readcsv_ex.csv",
                 header=TRUE, stringsAsFactors=TRUE)
str(dat6)
dat7 <- read.csv(file="C:\\Users\\HK_PARK\\Desktop\\DATAIT_GIRLS\\readcsv_ex.csv",
                 header=TRUE, stringsAsFactors=FALSE, row.names=1)
str(dat7)
dim(dat7)
dat8 <- read.csv(file="C:\\Users\\HK_PARK\\Desktop\\DATAIT_GIRLS\\readcsv_ex.csv",
                 header=TRUE, stringsAsFactors=FALSE, row.names=2)

## 클립보드 불러오기
dat9 <- read.table(file="clipboard", header=TRUE)

## stringsAsFactors 알기 !
list.files()
dat10 <- read.csv("readtable_ex1.csv", header=TRUE, encoding="UTF-8")
str(dat10)

dat11 <- read.csv("readtable_ex1.csv", header=TRUE, stringsAsFactors=FALSE)
str(dat11)  


## excel 불러오기.
# install.packages("readxl")
library(readxl)

list.files()
excel_sheets("gyunggi_rain_170530.xlsx")

dat12 <-read_xlsx("gyunggi_rain_170530.xlsx", sheet=1)
str(dat12)
dat13 <- read_xlsx("gyunggi_rain_170530.xlsx", 
                   sheet="695", col_types="text")
str(dat13)


## spss 파일 불러오기
install.packages("foreign")
library(foreign)

list.files()
dat14 <- read.spss(file="ProstateCancer.sav")
# dat14 <- read.spss(file="ProstateCancer.sav", reencode="euc-kr") # MAC
dat14 <- as.data.frame(dat14)


## SAS 파일 불러오기
install.packages("sas7bdat")
library(sas7bdat)
dat15 <- read.sas7bdat("nhefs_book.sas7bdat")
str(dat15)
dim(dat15)


## data 저장하기 

write.csv(x=dat14, file="dat14.csv")

write.csv(x=dat14, file="dat14.csv", row.names=FALSE)

write.table(x=dat14, file="dat14.txt")


