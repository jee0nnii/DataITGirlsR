# 다른 자료형으로 인한 연산 불가
a <- '0'
b <- 1

a + b #단위가 다르니까 연산을 할 수 없음


# 데이터 타입 살펴보기
mode(a) #-->character
mode(b) #-->numeric (실수형 데이터 타입)
        #-->integer (정수형 데이터 타입)
          #-> r은 정수 뒤에 L을 붙여서 구체화할 수 있음
        #complex : 허수부를 포함한 복소수형 데이터타입
        #logical : 논리 데이터 타입(TRUE,FALSE,T,F)
        #character : 문자데이터 타입

typeof(a)
class(a)


# 자료형 살펴보기
1.0
1414112312312312313
class(1.0)

1L
2L
class(1L)
class(1)


class(1+0i)

class(TRUE)
class(T)
# class(True) # 에러


'데잇걸즈'
"데잇걸즈"
class('데잇걸즈')
class("데잇걸즈")


#-------------------------------

#vector : 한가지 속성을 갖는 데이터의 집합
#matrix : 행렬, 배열
#array : 다차원 배열
# Vector 및 matrix, array
1:10
a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
class(a)
b <- c('a', 'b', 'c', 'd')
class(b)

c <- c('데잇걸즈',1)
class(c)

letters #소문자
LETTERS #대문자


1:8 # 1차원 벡터
matrix(1:8) # 2차원 행렬
dim(matrix(1:8)) # 8x1 : dim (행렬의 사이즈(행과 열의 수)를 알려줌)
?dim

matrix(1:8, ncol=2) # 열의 수를 지정하는 ncol
dim(matrix(1:8, ncol=2)) # 4x2

array(1:8) #1부터 8까지의 한줄짜리 배열

array(1:8, dim=c(2, 2, 2)) # 3차원 배열
dim(array(1:8, dim=c(2, 2, 2))) # 2x2x2
#2x2 행렬을 2개로 나타내기

array(1:16, dim=c(2, 2, 2, 2)) # 4차원 배열
dim(array(1:16, dim=c(2, 2, 2, 2))) # 2x2x2x2 

m3 <- array(1:8, dim=c(2, 2, 2))
m3
is.vector(m3) #벡터인지 아닌지 확인
is.array(m3)
is.matrix(m3)

#-----------
Object <-c(1,3,8,9)
Object <-c(Object, 11)
Object
Object <-c(0, Object)
Object <- append(Object,99,after=2) #두번째 다음에 값을 삽입
Object <- Object[-2] #두번째 값을 삭제할 때
Object[3] <- 9
Object[2] <- 99 #두번째값을 99로 바꾸는 거임
Object <- c(Object, 3,3,3,3)
Object[Object == 3] <- 100 # 값이 3인 것을 다 100으로 바꾸기
#-----------
ls() #생성된 변수를 다 보고싶을 때
ls.str()


# Factor
blood_type <- c('O형', 'A형', 'AB형', 'A형', 'B형', 'O형', 'O형', 'O형', 'B형', 'B형')
blood_type
class(blood_type)
blood_type_f <- factor(blood_type) #levels = c('O형','B형','A형', 'AB형') 순서대로 레벨 주고 싶을 때
blood_type_f
class(blood_type_f)

as.character(blood_type_f)
as.numeric(blood_type_f)
#--> 강제형변환
 #0형 : 4, a형 : 2, b형 : 3, ab형 :1
blood_type_f

#############################################3
# 주의!!
factor_number <- factor(c('5', 'a', '3', 'b'))
factor_number
as.numeric(factor_number) # 숫자로 바로 변경하면 실제 숫자와 다르게 매칭됨
#test <- as.character(factor_number)
as.numeric(as.character(factor_number))
##############
test03 <-c('5', 'a', '3', 'b')
as.numeric(test03)
test03_f <- factor(test03)
test03_f
as.numeric(test03_f)

#########
test02 <- c('c','d', 'a', 'b')
as.numeric(test02)
test02_f <-factor(test02)
as.numeric(test02_f)
as.character(test02_f)

######################
test01 <- c('c','d', 'a', 'b')
test01
typeof(test01)
class(test01)
test01_f <-factor(c(test01))
test01_f
class(test01_f)

as.numeric(test01_f)
as.character(test01_f)
as.numeric(as.character(test01_f))


#####################

factor_number02 = factor(c("5","12","3","9"))
factor_number02
typeof(factor_number02)
class(factor_number02)
as.numeric(factor_number02)
as.numeric(as.character(factor_number02))

#####################

N1 <- c("1000", "1,000", "10000", "10,000")
N1
as.numeric(N1)
N2 <-gsub(",","",N1)
as.numeric(N2)

####################################################
getwd() #작업공간확인

setwd("C:/Users/Lucy Kim/Documents/dataitgirls/datapark") #작업공간 설정
# Data Frame
            #comma-seperated values
boxoffice <- read.csv('boxoffice.csv', fileEncoding = "UTF-8", stringsAsFactors = F)
                                  #문자열과 요인을 구분하기 위해서 써줌 : stringsAsFactors
boxoffice
View(boxoffice)
class(boxoffice)

# List
my_list <- list(5, 4, 8)
my_list
my_list[[1]]

###  $ : mylist라는 리스트에 df를 만들어서 읽어들여온 boxoffice를 안에 삽입함
my_list$df <- boxoffice # 이름을 지정하여 새로운 요소 추가
View(my_list)
my_list                 # R의 대부분의 객체는 리스트 내부에 저장 가능
my_list$df              # 리스트 내에 이름으로 접근

my_list[[3]] # 기존 리스트 값으로 5,4,8 넣은 것이 앞에 3개의 컬럼을 가르킴

my_list[[4]]            # 번호로 접근

my_list[[5]] <- 1:10    # 새로운 번호에 할당
my_list[[5]]            # 번호로 접근하여 확인
names(my_list)[5] <- 'Numbers' # 이름 설정
my_list

