##### 조건문 if
### 논리 연산
10 >  5 # TRUE
10 >= 5 # TRUE
10 <  5 # FALSE
10 <= 5 # FALSE
10 == 5 # FALSE
10 != 5 # FALSE

1:10 %in% 6:11 # 앞 벡터의 요소들이 뒤 벡터에 포함되는가?
# FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE

TRUE & FALSE    # AND 연산
TRUE | FALSE    # OR 연산
xor(TRUE, TRUE) # XOR 연산

# All: 모두 True이면 TRUE, 아니면 FALSE
all(c(T, T, T))
all(c(T, T, F))

# Aby: 하나라도 True이면 True, 아니면 False
any(c(T, T, T))
any(c(T, T, F))
any(c(F, F, F))

# Negation(Not): TRUE이면 False, FALSE이면 TRUE
!TRUE
!FALSE

### if 문
if (10 > 5) {     # 조건
    print("True")   # 조건이 참일 때 실행
} else {
    print("False")  # 조건이 거짓일 때 실행
}

if (10 < 5) {     # 조건
    print("True")   # 조건이 참일 때 실행
} else {
    print("False")  # 조건이 거짓일 때 실행
}


##### 반복문
### for 문
for (i in 1:3) { # i에 1, 2, 3을 넣어 중괄호 내의 코드를 반복
    print(i^2)
}

month.name # 1~12월의 영어이름
# [1] "January"   "February"  "March"     "April"     "May"       "June"      "July"      "August"   
# [9] "September" "October"   "November"  "December" 
for (mon in month.name) { # mon 변수에 month.name의 각 요소를 넣어 중괄호 내의 코드를 반복
    print(mon)
}


# 1부터 10까지 더하기
x <- 0
for (i in 1:10) {
    x <- x + i
}
print(x)


x <- c()
for (i in 1:10) {
    x <- c(x, i)
}
print(x)


spiderman <- read.csv('spiderman_clean.csv', stringsAsFactors = F, fileEncoding = 'UTF-8')
# 일 관객수가 10만명이 넘었던 날짜 출력

for (i in 1:dim(spiderman)[1]) {
    if (spiderman$관객수[i] > 100000) {
        print(spiderman$날짜[i])
    }
}




# 실습
arrival_time <- # 강의장 도착 시간
    
    if ("condition1") {
        "code1"
    } else if ("condition1") {
        "code2"
    } else {
        "code3"
    }


# for문 실습 ###
5 %% 2 # 1
5 %% 2 == 0
4 %% 2 == 0

for (i in vector) {
    "code to repeat"
}


### while 문
i <- 1
while (i <= 10) {
    print(i)
    i <- i+1
}

### while 문 실습 ###
i <- 1
while (condition) {
    "code to repeat"
}


### 무한 Loop
i <- 1
while (TRUE) {
    print(i)
    i <- i+1 # 커서를 콘솔창에 두고 ESC로 멈추세요
}

### next and break
i <- 1
while (i <= 10) { # 실행시 무한 Loop
    next
    print(i) # 커서를 콘솔창에 두고 ESC로 멈추세요
}
print(i)

i <- 1
while (TRUE) {
    print(i)
    i <- i + 1
    if (i == 10) {
        break
    }
}
print(i)
