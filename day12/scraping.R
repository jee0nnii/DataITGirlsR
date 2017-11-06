install.packages('httr')

library(tidyverse)
library(rvest)
library(httr)
library(stringr)

# 다음 뉴스

# 문서 주소
news_url <- 'http://v.media.daum.net/v/20170915171203952'

# 문서 읽기 : rvest 함수
news_doc <- news_url %>% 
  read_html()

# 문서 공급자 : 
news_doc %>% 
  html_nodes('#cSub > div.head_view > em > a > img') %>% 
  html_attr('alt')

#크롬에서 가지고 오고 싶은 태그 부분을 클릭하고 우클릭 copy selector를 하면
## #cSub > div.head_view > em > a > img 이 친구를 반환 해줌

# 문서 내용
news_doc %>% 
  html_nodes('#harmonyContainer > section') %>% 
  html_text()
  # str_replace_all('\\s+', ' ') # gsub와 유사한 stringr의 함수
# 정규표현식 참고 페이지
# http://blog.eairship.kr/category/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D%20%EA%B4%80%EB%A0%A8/%EC%A0%95%EA%B7%9C%20%ED%91%9C%ED%98%84%EC%8B%9D

#저장하기 
title <- news_doc %>%
  html_nodes('#harmonyContainer > section') %>% 
  html_text()

##### 태그 긁어오기
news_doc %>% 
  html_nodes('#mArticle > div.foot_view > div.relate_tag.hc_news_pc_mArticle_relatedTags > span:nth-child(2) > a > span:nth-child(2)')
# 관련 태그는 불가하다.
# 소스보기에서 볼 수 없기 때문


##### 이건 크롬에서 봅시다.
library(jsonlite)
tag_url <- 'http://cc.media.daum.net/contentsview/more.json?contentsId=20170915171203952&service=news&callback=newsCallback1'

# JSON 다루기
fromJSON(tag_url) # error 발생
# 완전한 JSON이 아님

# 고치기
tag_raw <- readLines(tag_url, encoding = "UTF-8")
tag_raw <- tag_raw %>% 
  str_replace('^/\\*\\*/newsCallback1\\(', '') %>% 
  ## \\( 소괄호 표현 
  ## 앞부분의 ^/\\*\\*/ 안지워도 동일 : 앞에 주석을 없애주는 거임
  str_replace('\\);$', '')

tag_list <- fromJSON(tag_raw)

tag_list$cluster
tag_list$cluster$title

tag_list$popularKeyword

#############################0920오전끄

##### 댓글 긁어오기
news_doc %>% 
  html_nodes('#comment173217911 > div > p')
# 마찬가지로 나오지 않음

comments_url <- 'http://comment.daum.net/apis/v1/posts/24835172/comments?parentId=0&offset=0&limit=3&sort=CHRONOLOGICAL'

comment_df <- comments_url %>% 
  fromJSON()



##### 멜론 윤종신 노래 목록 가져오기

melon_yjs <- 'https://www.melon.com/artist/songPaging.htm?startIndex=1&pageSize=50&listType=0&orderBy=ISSUE_DATE&artistId=437'
# 본래 http://www.melon.com/artist/song.htm?artistId=437
# 여기지만 실제로 데이터를 가져오기 위해서는 위 페이지를 이용해야함

# 일반적으로 URL에서 "?" 뒤의 문자들은 query임
# 요청에 따라 DB에서 정보를 가져와 HTML로 뿌려주는 것
# "&"로 query의 요청인자 구분하며 "="으로 인자를 할당

# 요청 인자를 쉽게 고쳐주는 함수
melon_url <- modify_url(melon_yjs, 
                        query=list('startIndex' = 1))

# 단순히 url을 이용하여 read_html()함수를 사용하면 에러 발생
melon_doc <- melon_url %>% 
  read_html()

# 이유는 자세히 모르지만 다음과 같이 실행하면 읽을 수 있음
# melon_doc <- melon_url %>% 
#   readLines() %>% 
#   paste(collapse='') %>% 
#   read_html() # 불완전한 마지막행 오류는 무시
# 
# melon_doc <- GET(melon_url)$content %>% 
#   rawToChar() %>% 
#   iconv('UTF-8', 'CP949') %>% 
#   read_html()

# Table을 통째로 가져오기
melon_table <- melon_doc %>% 
  html_table() %>%  # <table>...</table>를 Data Frame으로 가져오는 함수
  .[[1]]

# 1:5 %>% .[3] # pipe operator 뒤의 "."은 인덱스를 조회하기 위해 사용
# iris %>% .$Sepal.Length # Sepal.Length 열 가져오기

# 데이터 확인
melon_table %>%
  View()

##얘만 한글 인식함ㅋㅋㅋㅋㅋㅋ
# 곡명만 가져오기
melon_doc %>% 
  html_nodes('#frm > div > table > tbody > tr > td:nth-child(3) > div > div > a.btn.btn_icon_detail > span') %>% 
  html_text()


yjs_title <- function (page_number) {
  start_index <- (page_number-1)*50 + 1
  melon_yjs <- 'http://www.melon.com/artist/songPaging.htm?startIndex=1&pageSize=50&listType=0&orderBy=ISSUE_DATE&artistId=437'
  # 요청 인자를 쉽게 고쳐주는 함수
  melon_url <- modify_url(melon_yjs, 
                          query=list('startIndex' = start_index))
  
  # 이유는 자세히 모르지만 다음과 같이 실행하면 읽을 수 있음
  suppressWarnings({
    melon_doc <- melon_url %>% 
    readLines() %>% 
    paste(collapse='') %>% 
    read_html() # 불완전한 마지막행 오류는 무시
  }) # suppressWarnings는 경고 메시지가 나와도 출력하지 않게 함
  
  # 곡명만 가져오기
  title <- melon_doc %>% 
    html_nodes('#frm > div > table > tbody > tr > td:nth-child(3) > div > div > a.btn.btn_icon_detail > span') %>% 
    html_text()
  
  return(title)
}

yjs_title(2)

######################### 실습 #########################
# 1. 윤종신 노래 목록 중, 가수명을 가져오세요.

# 2. 윤종신 노래 목록 중, 노래명과 가수명을 10페이지까지 가져오세요.

# 3. 다음 뉴스에서 오늘자 IT 뉴스의 1페이지 모든 뉴스와 그에 대한 댓글을 수집하세요.
# http://media.daum.net/breakingnews/digital 여기에서 날짜 URL 탐색
