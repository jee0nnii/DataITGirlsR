####1월_박스오피스.excel 파일을이용해, 다음문제를풀어보자!####
getwd()
setwd()

boxoffice_jan <- read.csv("boxoffice_jan.csv")
head(boxoffice_jan)
View(boxoffice_jan)
####1.매출액의최대값, 최소값, 평균을구하여라.####
bo_j_revenue <- boxoffice_jan$매출액
bo_j_revenue
bo_j_max <- max(bo_j_revenue)
bo_j_max
bo_j_min <- min(bo_j_revenue)
bo_j_min
bo_j_mean <- mean(bo_j_revenue)
bo_j_mean

summary(bo_j_revenue)

####2.스크린수의평균과분산을구하여라.####
bo_j_screen <- boxoffice_jan$스크린수
bo_j_screen
bo_j_screen_mean <- mean(bo_j_screen)
bo_j_screen_mean
bo_j_screen_var <- var(bo_j_screen)
bo_j_screen_var

summary(bo_j_screen)

####3.국적이가장많은나라를구하여라.####

head(boxoffice_jan)
dim(boxoffice_jan)
#빈도수 출력(table)
bo_j_country <- table(boxoffice_jan$대표국적)
bo_j_country

cnt <- which.max(table(boxoffice_jan$대표국적)) 
# : 8번째 미국이 가장 많은 값을 가진다? : INDEX를 알려주는 WHICH
cnt
bo_j_country[cnt]

names(bo_j_country)[table(boxoffice_jan$대표국적)==max(bo_j_country)]
names(bo_j_country)[cnt] #테이블의 이름만 가져올 수 있음

#boxoffice_jan$대표국적[boxoffice_jan$대표국적==""]<-NA #NA는 카운트를 하지 않음
#table(boxoffice_jan$대표국적)

#TABLE SORT
sort(bo_j_country) #오름차순
sort(bo_j_country, decreasing = TRUE) #내림차순
sort(bo_j_country, decreasing = TRUE)[1]


####4.한국국적을갖은영화의평균상영횟수를구하여라.####
movies <- data.frame(boxoffice_jan$대표국적, boxoffice_jan$상영횟수)
movies
koreamovies <- movies[movies$boxoffice_jan.대표국적 == "한국", ]
koreamovies
mean(koreamovies$boxoffice_jan.상영횟수)

####5.미국국적을갖은영화의스크린수의summary를구하여라.####
movies_s <- data.frame(boxoffice_jan$대표국적, boxoffice_jan$스크린수)
movies_s
usamovies <- movies_s[movies_s$boxoffice_jan.대표국적 == "미국", ]
usamovies
summary(usamovies)
