getwd()
setwd("C:/Users/joo/Documents/dataitgirls2")

#데이터 불러오기
ex1 <- read.table("readtable_ex1.txt", header =TRUE, sep ="") #, na.string=NA, stringsAsFactors = FALSE
ex1

ex1_1 <- read.table("readtable_ex1.txt", header =FALSE, sep ="") 
ex1_1       # header가 column 의 이름이 아니라 데이터라고 인식해서 v1,v2,v3 가 뜸

dim(ex1)    #12x3 행x열
dim(ex1_1)  #false header 까지 포함되어서 계산됨

str(ex1)    #데이터의 전체적인 구조
str(ex1_1)  #v1의 변수에 factor형으로 값이 들어감

head(ex1, 3)
tail(ex1_1,5)

list.files()
ex2 <- read.table("readtable_ex2.txt", header = TRUE, sep =",")
ex2
ex2_1 <- read.table("readtable_ex2.txt", header = TRUE, sep =",", na.strings = ".")
ex2_1

ex3 <- read.csv("readcsv_ex.csv", header = TRUE, sep =",")
ex3
str(ex3)

#factor 가 아닌 문자열을 가지고 올 때 (stringasfactor = true 가 디폴트)
ex3_1 <- read.csv("readcsv_ex.csv", header = TRUE, sep =",", stringsAsFactors = FALSE)
ex3_1
str(ex3_1)

ex3_2 <- read.csv("readcsv_ex.csv", header = TRUE
                  , sep =",", stringsAsFactors = FALSE
                  , row.names = 1)
                    # 첫번째 row를 이름으로 가지고 오겠다
ex3_2
str(ex3_2)
dim(ex3_2) #4x3

ex3_3 <- read.csv("readcsv_ex.csv", header = TRUE
                           , sep =",", stringsAsFactors = FALSE
                           , row.names = 2)
ex3_3

#클립보드
ex4 <- read.table(file="clipboard", header = TRUE)
ex4

ex5 <- read.csv("readcsv_ex1.csv", header = TRUE)
ex5

ex5_1 <- read.csv("readcsv_ex1.csv", header = TRUE, stringsAsFactors = FALSE)
ex5_1
str(ex5_1)
