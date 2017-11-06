library(stringr)

fruits <- c("banana", "apple", "pear", 
            "strawberry", "orange", 
            "BANANA")
str_extract_all(fruits, "a[nw]")

str_extract_all(fruits, "a[n-w]")


txt <- 
  c("010-9760-4809", "019-345-3563", 
    "032-565-7765", "02-745-8425",
    "010-3950-2351", "053-634-4031", 
    "054-754-1452", "011-4830-4352", 
    "010-532-6948", "02-265-5325")

str_extract_all(txt, "01[0-9]")

str_extract_all(txt, "01[0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]")
str_extract_all(txt, "01[0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]")


str_extract_all(txt, "01\\d-\\d{3,4}-\\d{4}")



# 한글 적용
korean <- '한글과 영어가 섞여있습니다. ㅎㄱㄱ ㅇㅇㄱ ㅅㅇㅇㅅㄴㄷ. Korean and English'

# 완성된 한글 추출
str_extract_all(korean, '[가-힣]')
str_extract_all(korean, '[가-힣][가-힣 ]+[가-힣]') # 문장을 추출

# 자모음 추출
str_extract_all(korean, '[ㄱ-ㅎ]')
str_extract_all(korean, '[ㄱ-ㅎㅏ-ㅣ]') # 모음 포함


# 특정 문자 제외
str_extract_all(korean, '[^가-힣]') # 가-힣에 해당하는 문자 제외
str_extract_all(korean, '[^가-힣]+') # 가-힣에 해당하는 문자 제외





lazy_test <- '<name>데잇걸즈</name><city>서울</city><name>뉴로어소시에이츠</name>'

str_extract_all(lazy_test, '<name>.+</name>')
str_extract_all(lazy_test, '<name>.+?</name>')


# 전방 탐색
won <- c("1000원", "3000원", "5000원", "4000원", "2000원")
str_extract(won, "\\d+(?=원)")


# 후방 탐색
dollar <- c("$70", "$60", "$80", "$90", "$100")
str_extract(dollar, "(?<=\\$)\\d+")



# 전후방 탐색
str_extract_all(lazy_test, '(?<=<name>).+(?=</name>)')
str_extract_all(lazy_test, '(?<=<name>).+?(?=</name>)')


text <- 'abcabcabc'
str_extract_all(text, 'abcabc')
str_extract_all(text, '(abc){2,}')


# for loop
system.time({
x <- numeric(10^6)
  for (i in 1:length(x)) {
    x[i] <- i^2
  }
})


# vectorization
system.time(y <- (1:(10^6))^2)


# 10^5까지만 실행한다고 해도 매우 느림
system.time({z <- NULL
for (i in 1:10^5) {
  z[i] <- i^2
}})
