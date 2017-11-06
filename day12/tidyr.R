library(tidyverse) # tidyr이 자동으로 로드됨


#################### gather ####################

# tidyr 내장 데이터
print(table4a) # wide format

##### Using dplyr
bind_rows(table4a %>% 
            select(country, cases='1999') %>% 
            mutate(year=1999), 
          table4a %>% 
            select(country, cases='2000') %>% 
            mutate(year=2000)) %>% 
  select(country, year, cases)


##### Using tidyr
table4a %>% 
  gather(key = "year", value = "cases", '1999', '2000')



##### lamp 데이터
lamp <- read_csv("streetlamp.csv", locale=locale(encoding='CP949'))

head(lamp) # wide format

# long format으로 변환
lamp_long <- lamp %>% 
  gather(key = year, value = lamp, "2011년", "2012년", "2013년", "2014년")

# 다양한 방법들
lamp_long <- lamp %>% 
  gather(key = year, value = lamp, 2:5) # 몇 번쨰 열인지?
lamp_long <- lamp %>% 
  gather(key = year, value = lamp, paste0(2011:2014, '년')) # 열 이름을 paste0로 생성
lamp_long <- lamp %>% 
  gather(key = year, value = lamp, ends_with('년')) # '년'으로 끝나는 열

# 플라팅
ggplot(data = lamp_long, aes(x = year, y = lamp, fill=year)) + geom_boxplot() + 
  labs(title = "가로등 연도별 boxplot", x = "연도", y = "가로등 수") + 
  guides(fill=guide_legend(title='연도')) +
  theme(text = element_text(family = "Apple SD Gothic Neo")) # Mac에서 실행


#################### Spread ####################


# tidyr 내장 데이터
print(table2) # long format

##### Using dplyr
inner_join(table2 %>%
             filter(type == 'cases') %>% 
             select(-type) %>% 
             rename(cases=count), 
           table2 %>% 
             filter(type == 'population') %>% 
             select(-type) %>% 
             rename(population=count), 
           by = c('country', 'year'))


##### Using tidyr
table2 %>% 
  spread(key = type, value = count)



#################### separate ####################

# tidyr 내장 데이터
View(table3)


##### Using dplyr
library(stringr)
str_split_fixed('안녕_하세요', '_', 2)
str_split_fixed(c('안녕_하세요', '안녕', '안_녕'), '_', 2)

split_string_2 <- function (x, sep, i) {
  splited <- str_split_fixed(x, sep, 2)
  return(splited[, i])
}

# stringr 패키지를 이용한 함수 이용
table3 %>% 
  mutate(cases = split_string_2(rate, '/', 1), 
         population = split_string_2(rate, '/', 2)) %>% 
  select(-rate)

# 정규표현식 이용
table3 %>% 
  mutate(cases = gsub('/.+', '', rate), 
         population = gsub('.+/', '', rate)) %>%
  select(-rate)



##### Using tidyr
sep1<- table3 %>% 
  separate(col = rate, into = c('cases', 'population'))
?separate

sep2<-table3 %>% 
  separate(col = rate, into = c('cases', 'population'), sep='/')

# convert 옵션으로 변수별 클래스를 자동으로 맞춤
sep3 <- table3 %>% 
  separate(col = rate, into = c('cases', 'population'), convert=T)


# sep에 숫자를 넣어서 문자의 개수로 나누기
table3 %>% 
  separate(col = year, into = c("century", "year"), sep = 2)


#################### unite ####################

# tidyr 내장 데이터
View(table5)

##### Using dplyr
table5 %>% 
  mutate(new = paste0(century, year)) %>% 
  select(-century, -year)


##### Using tidyr
table5 %>% 
  unite(col = new, century, year)

# sep의 기본값이 '_' 이기에 이를 ''로 강제한다.
table5 %>% 
  unite(col = new, century, year, sep = "") %>% View

