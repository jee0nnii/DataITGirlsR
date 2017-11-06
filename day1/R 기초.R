print('Hello World')
'Hello World'
### Scalar Example

a <- 10 # 변수 할당 - 정보를 담는 그릇
a
b <- "B"
b
c <- 1.414
c

### Vector Example
mode(3)
mode("data designer")
new <- c('data deisgner', 3)
mode(new)
new

new <- c(name = 'data deisgner', season = 3)
name <- c('박희경', '박재선')
names(name) <- c('이름', '이름')
name

v <- c(1, 2, 3, 4, 5)
v
i <- 1:5                    #Same as c(1, 2, 3, 4, 5)
j <- 5:1                    #Same as c(5, 4, 3, 2, 1)
k <- seq(2, 8, 2)           #Same as c(2, 4, 6, 8)
l <- rep(0, 5)              #Same as c(0, 0, 0, 0, 0)

A <- c(1,2,3)
A[1]
A[2:3]
A[c(2,3)]

names(A)
names(A) <- c("First", "Second", "Third")

A[1]
A["First"]

# Data Handling: Vector
x <- c(1,2,3,4)
x <- c(x[1:3], 10, x[4])

x
length(x)

c(1,2,4) + c(10,11,12,13,14)

x <- matrix(1:6, nrow=3, ncol=2)
x
x + c(1:2)

x <- c(1,2,3)
y <- c(10,20,30)

x+y
x*y
x%%y

y <- c(10,20,30,40,50)
y[c(1,3)]
y[2:3]
v <- 2:3
y[v]

y[c(1,2,1,3)]

# -5 는 다섯번째의 인수를 제외하고 출력
y[-5]
y[-length(y)]

x <- 1:5
y <- 5:1
z <- 2
1:z-1
1:(z-1)

?seq
seq(from=12,to=30,by=3)
seq(from=12,to=30,by=4)
seq(from=1.1,to=2,length=10)

rep(10,5)
rep(c(10,20,30),3)
rep(1:3,3)
rep(c(10,20,30),each=3)

x <- 1:10
x > 8
any(x > 8)
any(x > 20)
all(x > 8)
all(x > 0)

x <- c(1,2,NA,4,5)
y <- c(1,2,NULL,4,5)

mean(x)
mean(x, na.rm = TRUE)

mean(y)

x <- c(10,20,NA,40,50)
x[x>20]
subset(x, x>20)
which(x>20)

### List Example

listA <- list(1,2,"a")
print(listA)
listA[[1]] ; class(listA[[1]])
listA[1] ; class(listA[1])
listA[c(1,2)]
listA[[c(1,2)]] #Error

names(listA)
names(listA) <- c("First", "Second", "Third")

listA[["Third"]]
listA$Third
listA[c('Third','Second')]
listA[[c('Third','Second')]] #error

# Data Handling: List
A <- list(name="박희경", salary = 10000, union = TRUE)
A
A$name

B <- list("박희경", 10000, TRUE)
B
B[[1]]

C <- vector(mode="list")
C[["name"]] <- "박희경"
C[["salary"]] <- 10000
C[["union"]] <- TRUE
C

C$name
C[["name"]]
C[[1]]

C1 <- C[[1]]
class(C1)
C1

C2 <- C[1]
class(C2)
C2

C$office <- "frontier"
C

C$salary <- NULL
C

tmplist <- list(a = list(1:5, c("a","b","c")), b = "Z", c = NA)
tmplist
unlist(tmplist)
unlist(tmplist, use.names = FALSE)

A <- list(1:3,25:29)
A
lapply(A,median)
sapply(A,median)

### Factor

name <- c('김영웅','박희경','박재선')
factor(name)
as.factor(name)

test <- c(1,2,3)
ts1 <- factor(test)
ts1
ts[1] + ts[2] #error

ts2 <- factor(test, levels = c(1,2,3), ordered = T)
ts2
ts2[1] + ts[2] #error

# Data Handling: Factor
x <- c(5,12,13,12)
xf <- factor(x)
xf

str(xf)
unclass(xf)

length(xf)

xff <- factor(x, levels=c(5,12,13,88))
xff
xff[2] <- 88
xff

xff[2] <- 20
xff

ages <- c(25,26,55,37,21,42)
affils <- c("R","D","D","R","U","D")
tapply(ages, affils, mean)

gender <- c("M", "M", "F", "M", "F", "F")
age <- c(47,59,21,32,33,24)
income <- c(55000,88000,32450,76500,123000,45650)
tmp <- data.frame(gender, age, income)

tmp$over25 <- ifelse(tmp$age>25,1,0)
tmp
tapply(tmp$income, list(tmp$gender, tmp$over25), mean)

split(tmp$income, list(tmp$gender, tmp$over25))

table(tmp$gender, tmp$over25)

###Matrix & Array

A <- 1:6
dim(A)
print(A)

dim(A) <- c(2,3)
print(A)

A <- matrix(data = 1:6, ncol = 2 , nrow = 3, byrow = F)
A <- matrix(data = 1:6, ncol = 2 , nrow = 3, byrow = T)

B <- list(1,2,3,4,5,6)
print(B)
dim(B)
dim(B) <- c(2,3)
print(B)
matrix(list(1,2,3,4,5,6), ncol = 2, nrow = 3, byrow = F)
matrix(list(1,2,3,4,5,6), ncol = 2, nrow = 3, byrow = T)

D <- 1:12
dim(D) <- c(2,3,2)
print(D)
array(data = 1:12, dim = c(2,3,2))

A <- matrix(1:15, nrow=5, ncol=3)
A

B <- matrix(1:15, nrow=5, byrow = T)
B

C <- matrix(nrow=2,ncol=2)
C[1,1] <- 1
C[1,2] <- 2
C[2,1] <- 3
C[2,2] <- 4
C

A <- matrix(1:4, nrow=2, ncol=2)
B <- matrix(seq(from=2,to=8,by=2), nrow=2, ncol=2)
A
B

A*B # 행렬 원소간 곱셈
A %*% B # 행렬간 곱셈
A*3 # 행렬*상수
A+B # 행렬간 합

C <- matrix(1:15, nrow=5, ncol=3)
C
C[3,2]
C[2,]
C[,3]
C[2:4,2:3]
C[-1,]

C[1,] <- c(10, 11, 12)
C

A <- matrix(c(1:6), nrow=3, ncol=2)
A
A[A[,2]>=5,]

which(A>3)

A <- matrix(c(1:6), nrow=3, ncol=2)
apply(A,1,mean)
apply(A,2,mean)

A <- matrix(c(1:6), nrow=3, ncol=2)
B <- matrix(c(11:16), nrow=3, ncol=2)

A
B

rbind(A,B)
cbind(A,B)

cbind(A[,1],B[,2])

A <- matrix(c(1:6), nrow=3, ncol=2)
A

B <- A[1,]
B
attributes(A)
attributes(B)

C <- A[1,,drop=FALSE]
C
attributes(C)

D <- as.matrix(A[1,])
D
attributes(D)

A <- matrix(c(1:6), nrow=3, ncol=2)
colnames(A)
rownames(A)

colnames(A) <- c("1st","2nd")
colnames(A)

rownames(A) <- c("First","Second","Third")
rownames(A)

A[,"1st",drop=FALSE]

A <- matrix(c(1:15), nrow=5, ncol=3)
B <- matrix(c(11:25), nrow=5, ncol=3)
A
B

C <- array(data=c(A,B),dim=c(3,2,2))
C

### data frame
A <- c(1,2,3)
B <- c("a","b","c")
C <- data.frame(A,B)
C
C[[1]]
C[[2]]
C[1,2]
C$B[2]
str(C)
C <- data.frame(A,B, stringsAsFactors=FALSE)
C
C[[1]]
C[[2]]
C[1,2]
C$B[2]

#Data handling data.frame

kids <- c("Jack", "Jill")
ages <- c(12,10)
d <- data.frame(kids, ages, stringsAsFactors=FALSE)
d

d[[1]]
class(d[[1]])

d$kids
class(d$kids)

d[,1]
class(d[,1])

d[1]
class(d[1])

dfA <- rbind(d,list("Laura",19))
kids <- c("Alice","Jill", "Laura")
state <- c("MA", "NY", "CA")
dfB <- data.frame(kids, state, stringsAsFactors=FALSE)

merge(dfA, dfB) # default: inner join
merge(dfA, dfB, all = TRUE) # outer join
merge(dfA, dfB, all.x = TRUE) # left join
merge(dfA, dfB, all.y = TRUE) # right join

firstname <- c("Alice","Jill", "Laura")
state <- c("MA", "NY", "CA")
dfC <- data.frame(firstname, state, stringsAsFactors=FALSE)
dfC

merge(dfA, dfC, by.x="kids", by.y="firstname")

## 조건문과 반복문
# 조건문
r <- 1
if (r==4) {
  printf("The valus of r is 4")
} else {
  print("The valus of r is not 4")
}

carbon <- c(10, 12, 15, 19, 20)
if (mean(carbon) > median(carbon)) {
  print ("Mean > Median")
}else {
  print ("Median <= Mean")
}

# Caution!
if (mean(carbon) > median(carbon)) {
  print ("Mean > Median")
} else {
  print ("Median <= Mean")
}

# ifelse example
x <- 1:10
y <- ifelse(x%%2 == 0, "even", "odd")

# 반복문
n <- c(5,10,15)

for (i in n) {
  print(i^2)
}

i <- 1
while (i <= 10) {
  
  i <- i+4
  print(i)
}

i <- 1
repeat {
  i <- i+4
  print(i)
  if (i > 10) break
}

# User written functions
mean.and.sd1 <- function(x) {
  av <- mean(x)
  sdev <- sd(x)
  c(mean=av, SD=sdev)
}

distance <- c(148, 182, 173, 166, 109, 141, 166)
mean.and.sd1(distance)

mean.and.sd2 <- function(x) {
  av <- mean(x)
  sdev <- sd(x)
  c(mean=av, SD=sdev)
  return(av)
}

distance <- c(148, 182, 173, 166, 109, 141, 166)
mean.and.sd2(distance)

mean.and.sd3 <- function(x = rnorm(10)) {
  av <- mean(x)
  sdev <- sd(x)
  c(mean=av, SD=sdev)
}

mean.and.sd3()
mean.and.sd3(distance)

# Function arguments
addTheLog <- function(first, second) {first + log(second)}
# Exact names
addTheLog(second=exp(4),first=1)
# Partially matching names
addTheLog(s=exp(4),first=1)
# Argument order
addTheLog(1,exp(4))

# Function as an object
abline
args(abline)

sort

f1 <- function(a,b) return(a+b)
f2 <- function(a,b) return(a-b)

g <- function(h, x, y) h(x,y)
g(f1,5,2)
g(f2,5,2)

# Anonymous functions
apply.to.three <- function(f) {f(3)}
apply.to.three(function(x) {x*7})

a <- c(1,2,3,4,5)
sapply(a,function(x) {x+1})



### Binding Functions Example
s <- c(1, 2, 3, 4)      
t <- c(5, 6, 7, 8)
u <- matrix(s, 2, 2)    #Matrix contains 's' with 2 rows, 2 columns
v <- matrix(t, 2, 2)    #Matrix contains 't' with 2 rows, 2 columns

cbind(s, t)             #Combine two vectors by columns
rbind(s, t)             #Combine two vectors by rows
cbind(u[, 1], v[, 2])   #Combine two columns
rbind(u[1, ], v[2, ])   #Combine two rows

### Converting Functions Example

u <- as.data.frame(u)   #Convert matrix 'u' to data frame
u <- as.matrix(u)       #Convert data frame 'u' to matrix
s <- as.character(s)    #Convert numeric vector 's' to character vector
s <- as.numeric(s)      #Convert character vector 's' to numeric vector



