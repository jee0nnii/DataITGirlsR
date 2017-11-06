# install.packages(c("ggmap", "RColorBrewer"))

library(dplyr)
library(ggplot2)
library(ggmap)

qmap("seoul")                          # 서울 지도, maptype = "terrain"
qmap("seoul", maptype = "satellite")   # 서울 위성지도
qmap("seoul", maptype = "roadmap")     # 서울 로드맵
qmap("seoul", maptype = "hybrid")      # 위성지도 & 로드맵 혼합

# 위 지도들은 Google을 source로 가져온 것이며, 
# source = "옵션"을 Open Street Map의 "osm", Stamen Maps의 "stamen" 등을 사용 가능
# 하지만 한국은 표현되지 않는 source가 있음
# zoom 옵션을 적절한 자연수로 조절하여 지도를 확대할 수 있음

?qmap     # get_map의 확장판이므로, get_map함수의 옵션을 사용
?get_map

qmap("seoul", source = "osm") 
qmap("seoul", source = "stamen")                  # 소스 변경
qmap("seoul", maptype = "roadmap", zoom = 13)     # 줌 조절

coord <- c(lon = 127, lat = 37.5)                 # 경위도 좌표 변수
qmap(coord, maptype = "roadmap")                  # 해당 좌표 중심의 지도

# 한글 사용
qmap(enc2utf8("서울 강남구 학동로 171 삼익악기빌딩 2층"), maptype = "roadmap", zoom = 18) # 광화문 우체국

# 실습
# 원하는 지역의 지도 그리기
qmap(enc2utf8("전남 광양시 중동 1418"), maptype = "roadmap", zoom = 18)

# 한글 지도
qmap("서울")
qmap("서울&language=ko")


?geocode
geocode("gwanghwamun")
# geocode함수는 구글의 geocoding API를 이용
# 이는 URL에서의 query로 우리가 원하는 것을 찾으며, 
# 한글을 사용하기 위해서 URL 인코딩을 하기 전에 UTF-8로 인코딩을 필요로 한다.
# 따라서 enc2utf8 함수가 필요
# 맥의 기본 인코딩은 UTF-8이라 한글만 넣어도 무방하게 작동하지만, 윈도우 환경하에서는 enc2utf8함수가 필수적.
# 한글의 URL인코딩은 UTF-8 -> URL encoding 순서로 사용해야하며, URL encoding은 함수 내에서 자동화 되어있다.

geocode(enc2utf8("광화문"))                                   # output의 default 옵션 : latlon - 위도와 경도
geocode(enc2utf8("광화문"), output = "latlona")               # 경위도 + 주소 출력
geocode(enc2utf8("광화문&language=ko"), output = "latlona")   # 경위도 + 한글주소 출력
geocode(enc2utf8("광화문"), output = "more")                  # 추가정보
geocode(enc2utf8("광화문&language=ko"), output = "more")


a <- qmap("seoul", maptype = "roadmap") # 서울 지도 저장

##### 참고
##### 모든 지하철 노선
# 하나만 실행
setwd("C:/Users/joo/Documents/dataitgirls7")
# metro_geo <- read.csv("metro_geo_UTF8.csv", stringsAsFactors = F)  # Mac
metro_geo <- read.csv("metro_geo_CP949.csv", stringsAsFactors = F) # Window

a + geom_point(data = metro_geo, aes(x = lon, y = lat, colour = 호선)) +
  theme(text = element_text())

# 1-9호선 매핑
a + geom_point(data    = metro_geo %>% filter(호선 %in% 1:9), 
               mapping = aes(x = lon, y = lat, colour = 호선)) +
  # 컬러 지정
  scale_colour_manual(values = c("#00498B", "#009246", "#F36630", "#00A2D1", "#A064A3", "#9E4510", "#5D6519", "#D6406A", "#8E764B")) + 
  theme(text = element_text(family = "Apple SD Gothic Neo"))

# 1-9호선 노선도
a + geom_path(data    = metro_geo %>% filter(호선 %in% 1:9) %>% arrange(외부코드), 
              mapping = aes(x = lon, y = lat, colour = 호선), 
              size    = 1) +
  scale_colour_manual(values = c("#00498B", "#009246", "#F36630", "#00A2D1", "#A064A3", "#9E4510", "#5D6519", "#D6406A", "#8E764B")) + 
  theme(text = element_text(family = "Apple SD Gothic Neo"))


### 서울시 공중 화장실 heatmap
toilet <- read.csv("서울시공중화장실위치정보.csv", stringsAsFactors = F, skip = 1)

# 히트맵
a + geom_polygon(data    = toilet, 
                 mapping = aes(x = X_WGS84,           # 경도
                               y = Y_WGS84,           # 위도
                               fill = ..level..,      # 채우기
                               alpha = ..level..),    # 투명도
                 stat    = "density_2d",              # 통계 산출법
                 size    = 0) +                       # 경계선의 두께
  scale_fill_gradient(low = "green", high = "red") +  # 채우기색 지정
  scale_alpha(range = c(0.1, 1), guide = FALSE)       # 투명도 지정, 범례 False

# 산점도
a + geom_point(data    = toilet, 
               mapping = aes(x = X_WGS84, y = Y_WGS84), 
               alpha   = 0.1, 
               colour = "green")

# 중명칭의 분류 조사
unique(toilet$ANAME)
a + geom_point(data    = toilet, 
               mapping = aes(x = X_WGS84, y = Y_WGS84, colour = ANAME), # ANAME - 중명칭으로 색 구분
               alpha   = 0.1) +
  guides(colour = guide_legend(override.aes = list(alpha = 1))) +       # 범례의 투명도를 1로 조정
  theme(text = element_text(family = "Apple SD Gothic Neo"))


# 실습
# 서울시 공공WiFi 위치정보를 이용
# 히트맵 그려보기
browseURL("http://data.seoul.go.kr/openinf/sheetview.jsp?infId=OA-1218&tMenu=11")
