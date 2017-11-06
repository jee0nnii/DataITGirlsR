getwd()
sewwd()
install.packages("readxl")
library(readxl)

# install.packages("xlsx")
# library(xlsx)

list.files()
fishcatch <- read_xls("fishcatch_revise.xls",sheet = 2)
fishcatch
View(fishcatch)

fishcatch<- data.frame(fishcatch)

attach(fishcatch)
sex
is.na(sex)
sum(is.na(sex)) #결측치 수 :87개

sum(is.na(Species))
Species

table(Species) # 각각의 개수

summary(Weight) # 무게는 최소값이 0이 될 수 없음

##성별과 종류를 범주형으로 바꿔주기 
str(fishcatch)
fishcatch$Species <- factor(fishcatch$Species)
fishcatch$sex <- factor(fishcatch$sex)
str(fishcatch)
##

#수치형 데이터들의 summary
summary(Weight)
summary(Length1)
summary(Length2)
summary(Length3)
summary(Height)
summary(Width)

#범주형은 테이블형태로 출력
summary(Species) 
summary(sex)

head(fishcatch)

dim(fishcatch)
dim(fishcatch)[1] #행
dim(fishcatch)[2] #열

fishcatch[1,] #첫번째행 추출 (모든변수들의첫번째행)
fishcatch[,3] #세번째열 추출 (무게)

#summary 를 for문으로 
for (i in 1:dim(fishcatch)[2]){ 
  print(summary(fishcatch[,i]))
}

#결측치 처리#
#1.제거하기 - Y(반응변수, 종속변수)
#weight -반응변수 : NA 부분만을 삭제하기

is.na(Weight) #na인지 아닌지의 값을 논리값으로 나타냄

#na 값을 가지고 있는 물고기를 가져옴
fishcatch[is.na(Weight),]
#na 값을 가진 것을 제외한 물고기들을 가져옴
fishcatch[!is.na(Weight),]

# newfishcatch <-fishcatch[!is.na(Weight),]
# dim(newfishcatch)

fishcatch <-fishcatch[!is.na(fishcatch$Weight),]
dim(newfishcatch)

#2.대체하기 
#length 1 의 결측치를 평균으로 대체

a<-c(1,2,3)
a[c(TRUE,FALSE,TRUE)]

is.na(fishcatch$Length1)

mean(fishcatch$Length1) #null 값이 포함된 상태에서 평균을 구하기 때문에 na값이 나옴
mean(fishcatch$Length1, na.rm = TRUE)
fishcatch$Length1[is.na(fishcatch$Length1)] <- mean(fishcatch$Length1, na.rm = TRUE)

Length1

#length 2,3 의 결측치를 중앙값으로 대체

fishcatch$Length2
is.na(fishcatch$Length2)
median(fishcatch$Length2, na.rm = TRUE)
fishcatch$Length2[is.na(fishcatch$Length2)] <- median(fishcatch$Length2, na.rm = TRUE)
fishcatch$Length2

                                          #na값이 있어도 계산이 가능하게 해줌
fishcatch$Length3[is.na(fishcatch$Length3)] <-median(fishcatch$Length3, na.rm = TRUE)
Length3

#outlier 이상치 처리
which(newfishcatch$Weight == 0)
newfishcatch$Weight[which(newfishcatch$Weight == 0)]

fishcatch$Weight[which(fishcatch$Weight == 0)] <-mean(fishcatch$Weight,na.rm = TRUE)


#물고기 종류의 개수
table(fishcatch$Species)

# 1  2  3  4  5  6  7 
# 35  6 20 11 14 17 56 

#범주에 너무 적은 수의 객체가 들어있으면 비슷한 객체끼리 묶어줌
#군집화로 묶어줘야되는데 지금은 임의로 처리할 거임

#새로운 군집묶기
#if문 사용
#%in%

#######조건에 여러가지가 들어가면 안되서 실행이 안됨
# if (Species %in% c(1,2)){
#   fishcatch$NewSpecies <- 'A'
# }else if (Species %in% c(3:5)){
#   fishcatch$NewSpecies <- 'B'
# }else{
#   fishcatch$NewSpecies <- 'C'
# }

fishcatch$NewSpecies <- ifelse(fishcatch$Species %in% c(1,2),"A",
                               ifelse(fishcatch$Species %in% c(3:5),'B',"C"))
table(fishcatch$NewSpecies)

boxplot(fishcatch$Weight ~ fishcatch$NewSpecies, col=1:3,
        main ="New Species Box Plot",
        xlab ="New Species",
        ylab ="Weight")

head(fishcatch)

#correlation matrix
colnames(fishcatch)
numeric_fc <- fishcatch[, 3:8]

cor(numeric_fc)
plot(numeric_fc)

library(PerformanceAnalytics)
chart.Correlation(numeric_fc, histogram=TRUE, pch=19)



####[ , ]####
# dat[행, 열] 
# dat[행, ] dat[3, ] / dat[1:3, ]
# dat[, 열] dat[ ,3] / dat[ ,1:3]


####시각화####
# library(RColorBrewer)
# boxplot(fishcatch ,col = brewer.pal(4,"Set1"))
# boxplot(Weight ,col = brewer.pal(4,"Set1"))
# 
# search()


