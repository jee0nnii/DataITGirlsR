install.packages('tidyverse')
# 많은 패키지가 설치됨

library(tidyverse)
# 자동으로 ggplot2, dplyr, tidyr, readr, purrr, tibble이 로드됨

# Working directory 설정
# setwd('/Users/ParkJason/Downloads/데잇걸즈/20170913')

######################### Pipe operator #########################
sum(1:10)
1:10 %>% sum     # sum 함수의 인풋으로 앞의 1:10을 사용
1:10 %>% sum()

iris$Sepal.Length %>% 
  plot(iris$Sepal.Width) # 인풋이 2개인 함수



######################### 숫자에 해당하는 Row 가져오기 #########################
# base
iris[1:10, ]

# dplyr
iris %>% 
  slice(1:10)
slice(iris, 1:10)


######################### 조건에 맞는 행만 가져오기 #########################
View(mtcars) # 자동차 정보 데이터
mtcars[mtcars$cyl == 6, ] # cyl이 6인 행
mtcars[mtcars$cyl == 6 | mtcars$am == 1, ] # cyl이 6이거나 am이 1인 행

# dplyr
mtcars %>% 
  filter(cyl == 6)
filter(mtcars, cyl == 6)

mtcars %>% 
  filter(cyl == 6 | am == 1)
mtcars %>% 
  filter(cyl %in% c(6, 8)) # cyl이 6 또는 8



#######################################################
###################### readr ##########################
#######################################################
# lamp <- read.csv("streetlamp.csv", stringsAsFactors = F, fileEncoding = "CP949")

# readr의 읽기
lamp <- read_csv("streetlamp.csv", locale=locale(encoding='CP949'))


# csv 쓰기 내장함수
# write.csv(lamp, "streetlamp_base.csv")
# readr
# write_csv(lamp, "streetlamp_base.csv") # 자동으로 UTF-8로 인코딩

#######################################################
###################### readr ##########################
#######################################################


######################### 실습 #########################
# 1. iris 데이터에서 Species가 setosa인 것만 가져오세요.
iris %>% 
  filter(Species == 'setosa')

# 2. boxoffice 데이터에서 대표국적이 한국인 영화만 가져오세요
boxoffice <- read_csv('boxoffice_daily.csv', locale=locale(encoding='UTF-8'))
View(boxoffice)

boxoffice %>% 
  filter(대표국적 == '한국') %>% View


# 3. boxoffice 데이터에서 등급이 
# '18세관람가', '청소년관람불가', '18세관람가,청소년관람불가'
# 인 영화만 가져오세요
unique(boxoffice$등급) # 데이터에 존재하는 등급의 종류
boxoffice %>% 
  filter(등급 %in% c('18세관람가', '청소년관람불가', '18세관람가,청소년관람불가')) %>% 
  View





######################### 열 선택 #########################
##### 1
iris[, c('Sepal.Length', 'Sepal.Width')]

##### 2
iris[, 1:2]

##### 3
Sepal_names <- names(iris) %in% c('Sepal.Length', 'Sepal.Width')
Sepal_names

iris[, Sepal_names]

##### 4
subset(iris, select=c(Sepal.Length, Sepal.Width))

##### dplyr
iris %>% 
  select(Sepal.Length, Sepal.Width)



######################### 열 추가 #########################
##### 1
for (i in 1:dim(iris)[1]) {
  iris$Sepal_sum[i] <- iris$Sepal.Length[i] + iris$Sepal.Width
}

##### 2
iris$Sepal_sum <- rowSums(iris[, 1:2])
iris$Pepal_sum <- rowSums(iris[, 3:4])

iris$Sepal_ratio <- iris$Sepal.Width/iris$Sepal.Length
iris$Petal_ratio <- iris$Petal.Width/iris$Petal.Length

##### dplyr
iris %>% 
  mutate(Sepal_sum = sum(Sepal.Length, Sepal.Width), 
         Petal_sum = sum(Petal.Length, Petal.Width), 
         Sepal_ratio = Sepal.Width / Sepal.Length, 
         Petal_ratio = Petal.Width / Petal.Length)

# 더하기 등의 연산도 가능
iris %>% 
  mutate(Sepal_sum = Sepal.Length+Sepal.Width)


######################### binding #########################
lamp_row1 <- read_csv('lamp_split/streetlamp_2011_2012_1.csv', locale=locale(encoding='CP949'))
lamp_row2 <- read_csv('lamp_split/streetlamp_2011_2012_2.csv', locale=locale(encoding='CP949'))
lamp_row3 <- read_csv('lamp_split/streetlamp_2011_2012_3.csv', locale=locale(encoding='CP949'))
lamp_row4 <- read_csv('lamp_split/streetlamp_2011_2012_4.csv', locale=locale(encoding='CP949'))

# base
lamp_col1 <- rbind(lamp_row1, lamp_row2, lamp_row3, lamp_row4)
lamp_col2 <- read_csv('lamp_split/streetlamp_2013_2014.csv', locale=locale(encoding='CP949'))

lamp_binded <- cbind(lamp_col1, lamp_col2)


# dplyr
lamp_col1 <- bind_rows(lamp_row1, lamp_row2, lamp_row3, lamp_row4)
lamp_col2 <- read_csv('lamp_split/streetlamp_2013_2014.csv', locale=locale(encoding='CP949'))

lamp_binded <- bind_cols(lamp_col1, lamp_col2)




######################### 실습 #########################
# 데이터 로드
library(readxl)

# 출처
# http://stat.seoul.go.kr/octagonweb/jsp/WWS7/WWSDS7100.jsp?re_stc_cd=8001&re_lang=kor

pop <- read_excel('population.xls')
View(pop)
# 1. 기간, 총인구, 0~14세, 15~64세, 65세이상 Column만 가져와서
# pop1에 저장하세요.
pop1 <- pop %>%      # 이렇게 시작
  select(기간, 총인구, `0~14세`, `15~64세`, `65세이상`) # 숫자로 시작하는 column이라 문제가 있어서 ``로 묶어야함


# 2. 1에서 만든 데이터프레임을 이용하여 
# 각각 총인구 대비 연령대의 비율(연령대/총인구)을 구하고, 이를 새로운 열로 추가하세요.
pop1 %>% 
  mutate(youth_ratio = `0~14세`/총인구, 
         audult_ratio = `15~64세`/총인구, 
         elder_ratio = `65세이상`/총인구) %>%View
View(pop)

pop1 <- pop %>%
  select(기간, 총인구, 
           youth = `0~14세`, 
           adult = `15~64세`, 
           elder = `65세이상`)

pop1 %>% 
  mutate(youth_ratio = youth/총인구, 
         audult_ratio = audult/총인구, 
         elder_ratio = elder/총인구)

# 3. 서울시 환승 데이터를 이용하여 토요일과 일요일을 합쳐 주말 열을 추가하세요.
# http://data.seoul.go.kr/openinf/sheetview.jsp?infId=OA-12033&tMenu=11
metro <- read_csv('seoul_metro_transfer.csv', locale=locale(encoding='UTF-8'))
head(metro)
View(metro)

metro <- metro %>% 
  mutate(주말 = 토요일+일요일)


# 4. 3의 데이터를 이용하여 평일 - 주말 산점도를 그려보세요
qplot(x = 평일, y = 주말, data=metro) + 
  theme(text=element_text(family='Apple SD Gothic Neo'))




######################### group_by #########################
iris_group <- iris %>% 
  group_by(Species)
print(iris_group) # 특별히 변한게 없어보인다.

groups(iris_group) # 어떤 변수로 그룹지어져 있는지 반환

by_cyl <- mtcars %>% 
  group_by(cyl)
groups(by_cyl)

cyl_am <- mtcars %>% 
  group_by(cyl, am)
groups(cyl_am)

ungroup(cyl_am) # group 해제


######################### summarise #########################
iris %>% 
  group_by(Species) %>% 
  summarise(Sepal_Length_Mean = mean(Sepal.Length))


iris %>% 
  group_by(Species) %>% 
  summarise(Species_n = n()) # 종별로 데이터의 개수

# Species를 제외한 모든 변수에 대하여 mean 계산
iris %>% 
  group_by(Species) %>% 
  summarise_all(mean)


######################### join #########################

band_members
band_instruments

band_members %>% 
  inner_join(band_instruments)
band_members %>% 
  left_join(band_instruments)
band_members %>% 
  right_join(band_instruments)
band_members %>% 
  full_join(band_instruments)




######################### 실습 #########################
# 1. mtcars의 cyl별로 hp의 평균을 구하세요.
mtcars %>% 
  group_by(cyl) %>% 
  summarise(mean_hp = mean(hp))

# 2. wifi data를 이용하여 구별 wifi의 개수를 구하세요.
wifi <- read_csv('wifi.csv', locale=locale(encoding='UTF-8'))
names(wifi) # 구명에 오류가 있으므로 변환
names(wifi)[1] <- '구명'
View(wifi)
wifi %>% 
  group_by(구명) %>% 
  summarise(number = n()) %>% 
  arrange(number)

wifi %>% 
  group_by(구명) %>% 
  summarise(number = n()) %>% 
  arrange(desc(number))

wifi %>% 
  group_by(구명) %>% 
  summarise(number = n()) %>% 
  top_n(10, number)

# 3. 2에서 구한 wifi의 개수를 이용하여 bar plot을 그리세요.
ggplot(data=wifi %>% 
         group_by(구명) %>% 
         summarise(number = n()), 
       aes(x = 구명, y = number)) + 
  geom_bar(stat='identity') + 
  theme(text=element_text(family='NanumGothic'))

ggplot(data=wifi %>% 
         group_by(구명) %>% 
         summarise(number = n()), 
       aes(x = factor(구명, levels=구명[order(number, decreasing=T)]), 
           y = number)) + 
  geom_bar(stat='identity') + 
  theme(text=element_text(family='NanumGothic'), 
        axis.text.x = element_text(angle=30))

ggplot(data = wifi, 
       aes(x=구명)) + 
  geom_bar() + 
  theme(text=element_text(family='NanumGothic'))
  

# 4. boxoffice의 대표국적별로 관객수, 스크린수, 매출액의 
#    평균, 중앙값, 최댓값, 최솟값을 구하세요.
boxoffice %>% 
  select(관객수, 스크린수, 매출액, 대표국적) %>% 
  group_by(대표국적) %>% 
  summarise_all(funs(mean, median, max, min)) %>% View


# 5. batting_df 데이터에 person_df를 left_join 하세요.
#    playerID로 join
install.packages('Lahman')
library(Lahman) # MLB Dataset

batting_df <- tbl_df(Batting)
person_df <- tbl_df(Master)

batting_df %>% 
  left_join(person_df)




######################### 추가 실습 or 과제 #########################
# 1. batting_df에서 2001년부터의 데이터만을 이용하여 SO(삼진), H(안타)의 산점도를 
# 그려보세요
ggplot(data = batting_df %>% 
  filter(yearID >= 2001), 
  aes(x=SO, y=H)) + 
  geom_point()

ggplot(data = batting_df %>% 
         filter(yearID >= 2001), 
       aes(x=SO, y=H)) + 
  geom_hex()


# 2. 연도별로 SO와 H의 median을 구하여 이를 이용한 산점도를 그려보세요.
batting_summar <- batting_df %>% 
  group_by(yearID) %>% 
  summarise(SO_year = median(SO), 
            H_year = median(H))

View(batting_summar)

batting_df %>% 
  select(SO) %>% 
  filter(is.na(SO))

batting_summar1 <- batting_summar %>% 
  mutate(SO_year_interp = ifelse(is.na(SO_year), 0, SO_year))

View(batting_summar1)

ggplot(data = batting_summar1,
  aes(x = SO_year_interp, y= H_year)) + 
  geom_point()

ggplot(data = batting_summar1,
       aes(x = SO_year_interp, y= H_year)) + 
  geom_jitter()
