library(tidyverse)

#################### 실습(1) ####################


# 1. 다음 wide format의 지하철 환승 데이터를 이용하여 
# long format으로 변환한 뒤, 이를 다시 wide format으로 변환하세요.
metro_transfer <- read_csv('seoul_metro_transfer.csv', locale=locale(encoding='UTF-8'))
names(metro_transfer)[1] <- '순번' # 첫 열 이름이 "\"순번\""로 입력되어 수정
View(metro_transfer)


# 2. 1에서 만든 long format을 이용하여 자주 이용하는 환승역 3개에 대하여 
# bar chart를 그리세요. fill을 요일로 설정하세요.

sort(unique(metro_long$역명)) # 존재하는 역명 - 가나다 순



# 3. 다음과 같이 2개의 그림을 한 그래프 위에 그릴 수 있습니다.
# 그런데 범례가 제대로 안나오죠.
# tidyr을 이용해서 long format으로 바꾼 뒤, 범례까지 잘 나오게 그려봅시다.
library(readxl)

# 출처
# http://stat.seoul.go.kr/octagonweb/jsp/WWS7/WWSDS7100.jsp?re_stc_cd=8001&re_lang=kor

pop <- read_excel('population.xls')
tail(pop) # 마지막 행이 NA로 채워짐

pop <- pop[1:(dim(pop)[1]-1), ] # 마지막 NA 제거
tail(pop)

pop$기간 <- as.integer(pop$기간)
ggplot(data = pop) + 
  geom_line(aes(x = 기간, y = 여자), colour = 1) +
  geom_line(aes(x = 기간, y = 남자), colour = 2) + 
  labs(y = '인구') + 
  theme(text=element_text(family='NanumGothic'))

### 여기부터 작성해보세요.




# 4. 같은 방법으로 연령대에 대하여 꺾은선 그래프를 그려보세요.




#################### 실습 (2) ####################

# 1. lamp 데이터를 long format으로 다시 한번 변환하고, 
# 연도를 century와 연도로 나누어보세요. (Ex) 2011년 -> 20, 11년
head(lamp)





# 월별 버스 승하차 데이터
# http://data.seoul.go.kr/openinf/sheetview.jsp?tMenu=11&leftSrvType=S&infId=OA-12913

# 용량이 너무 커서 2017년 8월 데이터만 사용
# bus_count <- read_csv('~/Downloads/bus_count.csv', locale=locale(encoding='UTF-8'))
# names(bus_count)[1] <- '사용년월'
# bus_count %>%
#   filter(사용년월 == 201708) %>% write_csv('bus_count_201708.csv')

bus_count <- read_csv('bus_count_201708.csv', locale=locale(encoding='UTF-8'))
head(bus_count)
names(bus_count)

# 2. 위 승하차 데이터에서 승하차 승객수에 대하여 long format으로 변환하고
# 시간과 승차/하차를 나누세요.
# (Ex) 20시승차승객수 -> 20, 승차승객수
######### 모든 역에 대해서 시행하면 오래걸립니다. 
######### 좋아하는 노선번호 3개를 골라서 시행하세요.




#################### 실습 및 과제 ####################

# 1. 위 버스 데이터로부터 시간별 승차 및 하차 꺾은선 그래프를 그리세요.
# 자신이 이용하는 노선 3개 버스에 대해서 정류장 상관 없이 전부 더할 것
# 승차와 하차는 구분




# 2. 노선번호가 같은데 노선명이 다른 짝(pair)이 12개 있습니다.
# 직접 세지 말고 dplyr을 이용해서 이 짝을 찾아보세요.

# 다른 데이터가 있다는 것을 확인
bus_count %>% 
  distinct(노선번호, 노선명) %>% 
  dim() # [1] 622   2

bus_count %>% 
  distinct(노선번호) %>% 
  dim()  # [1] 610   1

bus_count %>% 
  distinct(노선명) %>% 
  dim()  # [1] 622   1



# 3. 다음 일별 지하철 승하차 데이터에서, 
# 2016년 데이터를 모두 다운받아 데이터프레임을 한개로 합치세요.
# http://data.seoul.go.kr/openinf/fileview.jsp?infId=OA-12914
# 인코딩은 CP949로 하세요.

file_list <- paste0('daily_metro/', list.files('daily_metro'))



# 4. 3에서 만든 데이터를 이용하여 집 근처의 지하철 역 3개를 선택하고, 
# 그 역의 월별 승하차 데이터를 산출하세요.
# 산출한 데이터를 이용하여 꺾은선 그래프를 그려보세요.
