# R이란 ? 통계 프로그래밍
# Rstudio script / Console


#### 데이터 타입 ####
# character / numeirc(int, float) / logical / factor

a <- "박희경"   # character type

b <- c(1, 2, 3) # numeric type

c <- c("1109")

d <- TRUE       # d <- T  / "1", "0이 아닌 숫자"

e <- FALSE      # e <- F  / "0"

as.numeric(d)
as.numeric(e)

as.logical(as.numeric(c))

f <- c("서울", "서울", "경기도", "경기도", "경기도")
FF <- factor(f)

as.numeric(f)   # numeric 불가
as.numeric(FF)  # numeric 가능


#### 데이터 형태 ####

# 벡터 - 1차원 
v <- c(1, 2, 3, 4, 5, 6, 7, 8)    # v <- 1:8

# 메트릭스 - 2차원
M1 <- matrix(data=v, nrow=4, ncol=2, byrow=TRUE)
M2 <- matrix(v, nrow=4, ncol=2, byrow=FALSE)

# 리스트 - 3차원 
L <- list(l1 = v, 
          l2 = M1, 
          l3 = M2)
L2 <- list(v, M1, M2)
L2

L$l1
L2[[1]]

# 데이터 프레임 != 메트릭스 (데이터 형태가 여러개가 들어가도 됨 )

# array != list

DF <- data.frame(
  x=1:10,
  y=10:1,
  z=rep(5,10),
  a=11:20
)

DF

keeps <- c("y", "x")
#keeps이라는 객체를 생성해서 아까 만들어 놓은 y와 x를 대입
keeps

class(DF)
?data.frame


DF[ , keeps, drop = FALSE] #????????????????






