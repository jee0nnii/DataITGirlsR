install.packages(c('tidyr', 'dplyr', 'ggplot2', 'ggthemes', 'hexbin'))
install.packages('ggthemes')
install.packages('hexbin')
library(dplyr)
library(tidyr)
library(ggplot2)
library(ggthemes)
library(hexbin)

### ggplot 개념
ggplot() +                                         # 캔버스
    layer(data     = iris,                         # 사용할 데이터프레임 - iris 데이터
          mapping  = aes(x      = Sepal.Length,    # mapping은 aes 함수를 요소로 받음
                         y      = Sepal.Width,     # plot에서 변할 요소들을 aes함수 내에 넣음
                         colour = Species),        # 각각 x, y의 좌표, 종에 따라 변하는 색깔
          geom     = "point",                      # mapping하는 방법 - 산점도
          stat     = "identity",                   # 각 x, y를 계산하는 방법 - 각 인자를 그대로 사용
          position = "identity",                   # 인자의 위치를 보정 - 그대로 사용
          params   = list(na.rm = FALSE))          # 추가 parameters

# data 는 사용해야되니까 그에 해당하는 데이터프레임을 넣어주는 부분
# mapping은 aes 함수 안에 표현되어야됨 
# x,y 좌표

### 상속
ggplot(data      = iris, 
       mapping   = aes(x      = Sepal.Length, 
                       y      = Sepal.Width, 
                       colour = Species)) +
    layer(data     = NULL, 
          mapping  = NULL, 
          geom     = "point", 
          stat     = "identity", 
          position = "identity", 
          params   = list(na.rm = FALSE))

# 위 옵션이 지정되어있는 함수
ggplot(data    = iris, 
       mapping = aes(x      = Sepal.Length, 
                     y      = Sepal.Width, 
                     colour = Species)) +
    geom_point()




### Histogram
# 기본 히스토그램
hist(iris$Sepal.Length)
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram()

# 계급을 20개로 나눈 히스토그램
hist(iris$Sepal.Length, breaks = 20)
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(bins = 20) 
# hist의 breaks는 ggplot2에서 bins와 같음.

# 경계를 똑같이 만들어 같은 히스토그램 그리기
hist(iris$Sepal.Length, breaks = seq(4, 8, 0.2))
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(breaks = seq(4, 8, 0.2)) 
# hist의 breaks는 ggplot2에서 bins와 같음.

# 옵션이 mapping의 aes 내부에 들어가냐, 외부에 들어가냐에 따른 차이
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(bins = 20, colour = "white")# 흰색 경계선
ggplot(data = iris, aes(x = Sepal.Length, colour = "white")) + geom_histogram(bins = 20)# legend가 생김  
# ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(bins = 20, colour = Species) # 오류
ggplot(data = iris, aes(x = Sepal.Length, colour = Species)) + geom_histogram(bins = 20)

# fill
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(bins = 20, colour = "white", fill = "grey")

# 종별로 구분 - aes함수 내부와 밖의 차이
ggplot(data = iris, aes(x = Sepal.Length, fill = Species)) + 
    geom_histogram(bins = 20, colour = "white")


# Customizing
ggplot(data = iris, aes(x = Sepal.Length, fill = Species)) + 
    geom_histogram(bins = 20, colour = "white") + 
    scale_fill_manual(values = c("red", "blue", "green"))
ggplot(data = iris, aes(x = Sepal.Length, fill = Species)) + 
    geom_histogram(bins = 20, colour = "white") + 
    scale_fill_manual(values = c("#556270","#4ECDC4", "#FF6B6B"))
# 원하는 바에 따라 fill, colour, alpha 등 옵션 선택
browseURL("http://ggplot2.tidyverse.org/reference/scale_manual.html") # 참고

# layer 추가
ggplot(data = iris, aes(x = Sepal.Length)) + 
    geom_histogram(bins = 20) +
    geom_freqpoly(bins = 20)

ggplot(data = iris, aes(x = Sepal.Length, colour = Species)) + 
    geom_freqpoly(bins = 20)


# hist 실습
# [1] iris의 Petal.Length를 이용하여 Histogram 그리기
# Species로 색깔을 입히고, 경계선은 검은색으로!

ggplot(data = iris, mapping = aes(x=Petal.Length, fill=Species))+
  geom_histogram(bins = 20, colour ="black")
  

# [2] 1월 박스오피스의 매출액 히스토그램
boxoffice <- read.csv("일별박스오피스_2017-08-27.csv", stringsAsFactors = F, fileEncoding = "UTF-8") # 출처 : kobis
head(boxoffice)
colnames(boxoffice)

ggplot(data=boxoffice, aes(x=log(매출액),fill= 대표국적))+
  geom_histogram(bins = 20, colour ="white")+
  theme(text=element_text())


ggplot(data=boxoffice%>%filter(매출액>50000000), aes(x=매출액,fill= 대표국적))+
  geom_histogram(bins = 20, colour ="white")+
  theme(text=element_text())


### Bar chart
table(boxoffice$대표국적)               # 빈도를 반환하는 함수로 table 사용
barplot(table(boxoffice$대표국적))      # 변수가 너무 많아서 잘 보이지 않음
nations <- table(boxoffice$대표국적)    # table 변수를 저장
nations                               # table class
barplot(nations[nations > 5])         # 벡터와 같이 TRUE FALSE로 접근 가능

# ggplot을 이용한 bar chart
ggplot(data = boxoffice, aes(x = 대표국적)) + 
    geom_bar()# +
# theme(text = element_text(family = "Apple SD Gothic Neo"))

ggplot(data = boxoffice %>% filter(매출액 > 50000000), aes(x = 대표국적)) + 
    geom_bar()# +
# theme(text = element_text(family = "Apple SD Gothic Neo"))

# barplot 실습
# 장르에 대한 막대그래프

ggplot(data = boxoffice %>% filter(매출액 > 50000000), aes(x = 장르)) + 
  geom_bar()+
  theme(text=element_text())



### Box plot
boxplot(iris$Sepal.Length)              # 일변수 박스플랏
boxplot(Sepal.Length ~ Species, iris)   # 여러 변수의 박스플랏(수치 ~ 분류, 데이터프레임)

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_boxplot()

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_boxplot() + geom_point() # point 추가

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_boxplot() + geom_jitter(width = 0.2) # point로 겹치는 점을 흐트린다.
# 랜덤값을 이용하기에 매번 다른 plot

ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
    geom_boxplot() + coord_flip() # 좌표계 뒤집기

ggplot(data = iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
    geom_boxplot() + coord_flip()

# iris 데이터의 Petal.Length를 이용하여 Boxplot 그리기
# Sepcies로 컬러 입히기
ggplot(data = iris, aes(x = Species, y= Petal.Length, fill = Species))+
  geom_boxplot()

getwd()
setwd('C:/Users/joo/Documents/dataitgirls7')
### 가로등 데이터 로드
lamp <- read.csv("streetlamp.csv", stringsAsFactors = F, fileEncoding = "CP949")
head(lamp)
str(lamp)
dim(lamp)

??gather

# long format으로 변환
lamp_tidy <- lamp %>% 
    gather(key = year, value = lamp, 2:5)
names(lamp_tidy)[1] <- "dong" # 한글 관련 오류
head(lamp_tidy)

# 전처리
lamp_tidy$year <- gsub("X", "", lamp_tidy$year)  # lamp_tidy$year의 "X"를 ""로 대치
lamp_tidy$year <- gsub("년", "", lamp_tidy$year) # lamp_tidy$year의 "년"을 ""로 대치
lamp_tidy$year <- as.integer(lamp_tidy$year)     # lamp_tidy$year의 문자열 데이터를 정수형으로 변환
head(lamp_tidy)

# boxplot 실습
# 가로등 데이터의 연도별 box plot
# Hint : 연도에 as.factor를 이용해야함
ggplot(data = lamp_tidy, aes(x=as.factor(year), y= lamp))+ geom_boxplot()+
  labs(title="가로등 데이터의 연도별 box plot", x="연도", y="가로등 수")+
  theme(text=element_text())
  
  
### Scatter Plot
plot(iris$Sepal.Length)                     # x축은 index, y축이 데이터
plot(iris$Sepal.Length, iris$Sepal.Width)   # 앞 변수가 x축, 뒤 변수는 y축
plot(iris[, -5])                            # 여러 조합으로 산점도를 그림
plot(iris)

ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + 
    geom_point()
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, size = Petal.Length, colour = Petal.Width, shape = Species)) + 
    geom_point()



# scatter plot 실습
# 가로등 데이터의 연도별 scatter plot
ggplot(data = lamp_tidy, aes(x = year, y = lamp, colour = dong)) + 
    geom_point() +
    theme(text = element_text())
ggplot(data = lamp_tidy, aes(x = year, y = lamp, colour = dong)) + 
    geom_point() + geom_line() +
    theme(text = element_text())


# Line Chart
spiderman <- read.csv("spiderman_clean.csv", fileEncoding = 'UTF-8', stringsAsFactors = F)         # 데이터 로드 - 출처 : kobis
plot(as.Date(spiderman$날짜), spiderman$관객수, type = "l")            # type = "l"로 line chart를 지정

# as.Date는 날짜 데이터를 다룰 때 사용
ggplot(data = spiderman, aes(x = as.Date(날짜), y = 관객수)) + 
    geom_line() +
    geom_point()
ggplot(data = spiderman, aes(x = as.Date(날짜), y = 관객수)) + 
    geom_area()


# line chart 실습
# KOSPI.csv파일로 꺾은선 그래프 및 Area chart 그리기
kospi <- read.csv("KOSPI.csv")  # 출처 : e나라지표

ggplot(data = kospi, aes(x = year, y = KOSPI)) + geom_line()

?mtcars

# facet
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(bins = 20)
ggplot(data = iris, aes(x = Sepal.Length)) + geom_histogram(bins = 20) +
    facet_wrap(~ Species)

ggplot(data = mtcars, mapping = aes(x = mpg, y = wt)) + 
    geom_point() +
    facet_grid(cyl ~ .)

ggplot(data = mtcars, mapping = aes(x = mpg, y = wt)) + 
    geom_point() +
    facet_grid(cyl ~ am)

ggplot(data = mtcars, mapping = aes(x = mpg, y = wt)) + 
    geom_point() +
    facet_wrap( ~ cyl + am)


### theme
browseURL("http://ggplot2.tidyverse.org/reference/theme.html")      # 옵션 확인

ggplot(data = lamp_tidy, aes(x = year, y = lamp, colour = dong)) + 
    geom_point() + geom_line() +
    theme(text = element_text(family = "Apple SD Gothic Neo")) # 애플 산돌고딕 네오 폰트

ggplot(data = lamp_tidy, aes(x = year, y = lamp, colour = dong)) + 
    geom_point() + geom_line() +
    theme(text = element_text(family = "Apple SD Gothic Neo"), # 애플 산돌고딕 네오 폰트
          panel.background = element_rect(fill = "white"),     # 플랏 패널을 흰색으로 설정
          panel.grid.major = element_line(colour = "#EBEBEB"), # 주눈금선 색
          panel.grid.minor = element_line(colour = "#EBEBEB"), # 보조눈금선 색
          axis.ticks = element_line(colour = "#EBEBEB"))       # x, y축 tick 색



# ggtheme
ggplot(data = mtcars, mapping = aes(x = mpg, y = wt)) + 
    geom_point() +
    facet_wrap( ~ cyl + am) +
    theme_grey() # default

ggplot(data = mtcars, mapping = aes(x = mpg, y = wt)) + 
    geom_point() +
    facet_wrap( ~ cyl + am) +
    theme_bw() # Black & White

# ggthemes package
library(ggthemes)
ggplot(data = mtcars, mapping = aes(x = mpg, y = wt)) + 
    geom_point() +
    facet_wrap( ~ cyl + am) +
    theme_wsj()

ggplot(data = mtcars, mapping = aes(x = mpg, y = wt)) + 
    geom_point() +
    facet_wrap( ~ cyl + am) +
    theme_wsj() + 
    ggtitle("Cars")


### Quick plot
# diamonds : 53940 x 10
qplot(carat, price, data = diamonds, geom = "point")
qplot(carat, price, data = diamonds, geom = "point", colour = clarity)
# ggplot 문법에 맞춰 풀어쓰면 아래와 같다.
# ggplot(aes(carat, price, colour = clarity), data = diamonds) + geom_point()


qplot(carat, price, data = diamonds, geom = "point", alpha = 0.1)
qplot(carat, price, data = diamonds, geom = "hex") # geom_hex
qplot(carat, price, data = diamonds, geom = "hex", colour = clarity) # 좋지 않음

qplot(carat, price, data = diamonds, geom = "hex") + 
    facet_wrap( ~ clarity)
qplot(carat, price, data = diamonds, geom = "hex") + 
    facet_wrap( ~ clarity, nrow = 2) # 강제로 2행으로 만듦


# 입력값에 따라 자동으로 차트의 종류를 선택
qplot(Sepal.Length, data = iris)
qplot(Sepal.Length, Sepal.Width, data = iris)


### 레이어 겹치기
# "+"로 더해줄 수 있다.
ggplot(data = iris, aes(x = Sepal.Width, y = Sepal.Length, colour = Species)) + 
    geom_point() +
    geom_path()

# 상속 불가 오류
ggplot() + 
    geom_point(data = iris, aes(x = Sepal.Width, y = Sepal.Length, colour = Species)) +
    geom_path()
#geompoint에들어가 있는 건 path 가 인식하지 못함 그니까 윗줄 plot에 입력해줘야 됨 


# PPT 내의 플랏 예시
# Area charta
install.packages('gcookbook')
library(gcookbook) # For the data set
ggplot(uspopage, aes(x=Year, y=Thousands, fill=AgeGroup)) + geom_area()

a <- ggplot(economics, aes(x = date, y = unemploy)) # 객체로 저장

a + geom_point() + lims(y = c(0, 16000))
a + geom_line() + lims(y = c(0, 16000))
a + geom_area() + lims(y = c(0, 16000))
a + geom_bar(stat = "identity") + lims(y = c(0, 16000))
