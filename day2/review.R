####first session####
a <- "juyeon" #character
'juyeon'
"juyeon"

b <- c(1,2,3)

c(a,b)

c <- c("1031")

d <- TRUE   #d <- T   # "1" ,"0" 이 아닌 숫자

e <- FALSE  # e <- F  #"0"

as.numeric(d)
as.numeric(e)

as.logical(as.numeric(c))

f <- c("서울","서울","경기도","경기도","경기도")
FF <- factor(f)
FF

as.numeric(f)
as.numeric(FF) # 같은 문자에 같은 숫자를 부여함
#문자형은 숫자형으로 못바꾸지만, factor형은 숫자로 바꿀 수 있다.

####data type####

#1. 벡터
v <- c(1,2,3,4,5,6,7,8) # v <- c(1:4) = 1:4
v #라고 출력했을때 [1]는 하나의 원소를 나타냄

tmp <- c(1:1000)
tmp

#2. 매트릭스 - 2차원배열
M <- matrix()
M1 <- matrix(data = v, nrow =4, ncol=2, byrow = TRUE)
M1
M2 <- matrix(v, nrow =4, ncol=2, byrow = FALSE) #세로로 숫자 넣음
M2

#3. 리스트 - 3차원배열
L <- list(l1=v,
          l2=M1,
          l3=M2)
L$l1

L2 <- list(v,M1,M2)
L2
L2[[3]]


## 데이터 프레임
    #매트릭스와 형태가 다름   
    #데이터형태가 여러가지가 들어올 수 있음
iris

## Array != List

rm(list = ls()) #environment 삭제















