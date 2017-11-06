### 함수 정의
my_mean <- function(x){
    # 벡터의 평균을 구하는 함수 정의
    return(sum(x)/length(x))
}
my_mean
mean     # 커서를 함수에 맞추고 FN + F2를 누르면 함수의 정의를 찾는다.



my_mean(1:10)
mean(1:10)
my_mean(1:100)


# 두 숫자의 합을 구하는 함
sum_x_y <- function(x, y) {
    return(x+y)
}

sum_x_y(5, 3) # 함수 사용



one_to_ten <- function () {return(1:10)} # argument가 없는 함수
one_to_ten() # argument 없이 적용하여도 반환값이 있음


'+'(1, 2)    # 연산자들도 함수
'-'(5, 10)
'!'(T)


# 함수 내에 반복문 사용
# x까지 정수의 합을 산출
iteration <- function (x) {
    my_sum <- 0
    for (i in 1:x) {
        my_sum <- my_sum + i
    }
    return(my_sum)
}
iteration(10) # 55



# 실습

# 나눗셈 함수를 만들어보세요
my_divide(10, 5)
# [1] 2
my_divide <- function (x, y) {
    # Code
  
  # print (x)
  # print (y)
  # return (x/y)
  
  result <- c(x,y,x/y)
  return (result)
}



numbers <- c(10, 5, 3, 1, 452, 43)
f_to_n <- factor(as.character(numbers))


# f_to_n를 그대로의 숫자로 바꾸는 함수를 만드세요.
# Ex) my_function(f_to_n ) 입력시 다음과 같이 출력
# [1]  10   5   3   1 452  43

as.numeric(f_to_n)
char <- as.character(f_to_n)
numbers_new <- as.numeric(char)


my_function <- function (x) {
  char <- as.character(x)
  numbers_new <- as.numeric(char)
  return (numbers_new)
}
my_function(f_to_n)

# 정수 벡터 중 짝수만 출력하는 함수를 만드세요.
# Ex) print_even(1:10)
# [1] 2
# [1] 4
# [1] 6
# [1] 8
# [1] 10


res <- c()

print_even <- function(x){

}
