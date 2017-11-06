install.packages("RColorBrewer")
library(RColorBrewer)

#### Histogram ####
hist(iris$Sepal.Length)                         # 히스토그램
hist(iris$Sepal.Length, breaks = 20)            # 계급을 20개로 나눈 히스토그램
histo <- hist(iris$Sepal.Length, breaks = 20)   # 히스토그램을 변수로 저장
histo                                           # 히스토그램 요소 확인

#mids : 도수분포표의 계급값 - 범위의 중간값이라고 생각하면됨
plot(histo)                                     # 저장된 변수를 plotting

#### Bar chart ####
boxoffice <- read.csv("boxoffice_170827.csv", stringsAsFactors = FALSE, fileEncoding = "UTF-8")
head(boxoffice)
table(boxoffice$대표국적)               # 빈도를 반환하는 함수로 table 사용
barplot(table(boxoffice$대표국적),rep(1,9), col = brewer.pal(9,"Greens"), axes = F)      # 변수가 너무 많아서 잘 보이지 않음
barplot(table(boxoffice$대표국적), las=2, col = brewer.pal(9,"Reds"))      # 글자를 세로로 출력

nations <- table(boxoffice$대표국적)    # table 변수를 저장
nations                               # table class
nations > 5         #논리연산 : true, false
nations[nations > 5] # [ ] : 5보다 큰애만 가져옴 
barplot(nations[nations > 5],col = brewer.pal(9,"Set1"))         # 벡터와 같이 TRUE FALSE로 접근 가능


#### Box plot #### 
boxplot(iris$Sepal.Length, col = brewer.pal(1,"Set2"))              # 일변수 박스플랏
boxplot(Sepal.Length ~ Species, iris , col = brewer.pal(4,"Set3"))   # 여러 변수의 박스플랏(수치 ~ 분류, 데이터프레임)


#### hist 실습####
boxoffice <- read.csv("boxoffice_170827.csv", stringsAsFactors = F, fileEncoding = "UTF-8") # 출처 : kobis
# macOS는 다음 코드를 실행하여 폰트 조정
# par(family = "Apple SD Gothic Neo")


# 박스오피스의 매출액 히스토그램
boxoffice$매출액
hist(boxoffice$매출액, breaks = 20, col = brewer.pal(9,"Set1"))

View(boxoffice)  # 데이터 확인
str(boxoffice)
dim(boxoffice)
boxoffice$매출액 # 매출액

#### barplot 실습####
revenue <- boxoffice$매출액
revenue
barplot(revenue, col = brewer.pal(9,"Set3"))
summary(revenue)
revenue01 <- revenue[revenue > 4.975e+06]
revenue01 <- revenue[revenue > quantile(revenue)[4]]
# 3쿼터이상의 값만 도출함
revenue01
barplot(revenue01, col = brewer.pal(9,"Set3"))


#### 장르에 대한 막대그래프 ???????????? ####
barplot(table(boxoffice$장르),las =2)

genre <- boxoffice$장르 
genre
genre_f <- factor(genre)
genre_f
barplot(table(genre_f),col = brewer.pal(9,"Set3"),las =2)


#### 데이터프레임 boxoffice[1:20, ]를 이용하여, 대표국적 별 매출액 박스플랏을 그려보세요. ####
bo20 <- boxoffice[1:20, ]
bo20
head(bo20,1)
boxplot(bo20$매출액~bo20$대표국적, bo20, col = brewer.pal(8,"Set1"))


#### Scatter Plot ####
plot(iris$Sepal.Length)                     # x축은 index, y축이 데이터
plot(iris$Sepal.Length, iris$Sepal.Width)   # 앞 변수가 x축, 뒤 변수는 y축
plot(iris[, -5])                            # 여러 조합으로 산점도를 그림
                                              # 세로 : x / 가로 : y  
#### 응용 ####
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species)      # 종별로 다른 색
factor(iris$Species)  #col : 1:black, 2:red , 3:green
plot(iris$Sepal.Length, iris$Sepal.Width, cex=sqrt(iris$Petal.Length) ,col= iris$Species) # 크기는 Petal.Length
plot(iris)
class(iris$Species)                         # Factor - 1, 2, 3으로 입력되어있음


############################## 데이터 전처리 ##############################
# spiderman <- read.csv("spiderman.csv", stringsAsFactors = F, fileEncoding='UTF-8')         # 데이터 로드 - 출처 : kobis
# ### Class에 맞게 전처리
# spiderman$날짜 <- as.Date(gsub('\\.', '-', spiderman$날짜))
# spiderman[, c(2:8, 10, 12:13)] <- sapply(spiderman[, c(2:8, 10, 12:13)], function(x) as.numeric(gsub('[%,]', '', x)))
# write.csv(spiderman, 'spiderman_clean.csv', row.names = F)
############################## 데이터 전처리 ##############################


spiderman <- read.csv('spiderman_clean.csv', stringsAsFactors = F, fileEncoding = 'UTF-8')
View(spiderman)

dim(spiderman)
1:dim(spiderman)[1]
spiderman$관객수

#### Line Chart ####
# x축 - row number, y축 - 관객 수
plot(1:dim(spiderman)[1], spiderman$관객수)                 # 산점도
plot(1:dim(spiderman)[1], spiderman$관객수, type='l')       # type = "l"로 line chart를 지정
                                                                # default 값은 p --> point
# x축 - 날짜,  y축 - 관객 수
as.Date(spiderman$날짜)
plot(as.Date(spiderman$날짜), spiderman$관객수, type='l')   # as.Date는 날짜 데이터를 다룰 때 사용
      #강제형변환 : char를 date로

plot(spiderman$순위, spiderman$관객수)

View(iris)
#### scatter plot 실습 #### 
# 스파이더맨 스크린수와 관객수로 scatter plot
plot(spiderman$스크린수, spiderman$관객수)
plot(spiderman$스크린수, spiderman$관객수, cex = spiderman$상영횟수/10000, col = spiderman$스크린수)

# line chat 실습
# spiderman 데이터를 이용하여 날짜와 스크린수로 꺾은선 그래프 그리기
plot(as.Date(spiderman$날짜), spiderman$스크린수, type="l")


# KOSPI.csv파일로 꺾은선 그래프 그리기
kospi <- read.csv("KOSPI.csv")  # 출처 : e나라지표
plot(kospi, type="l")

plot(kospi$year, kospi$KOSPI, type ="l")






