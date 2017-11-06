### 함수 정의
my_mean <- function(x){
    # 벡터의 평균을 구하는 함수 정의
    return(sum(x)/length(x))
}
my_mean
mean     # 커서를 함수에 맞추고 F2를 누르면 함수의 정의를 찾는다.



my_mean(1:10)
mean(1:10)
my_mean(1:100)


sum_x_y <- function(x, y) {
    return(x+y)
}

sum_x_y(5, 3)


one_to_ten <- function () {return(1:10)} # argument가 없는 함수
one_to_ten()


'+'(1, 2)    # 연산자들도 함수
'-'(5, 10)
'!'(T)


numbers <- c(10, 5, 3, 1, 452, 43)
f_to_n <- factor(as.character(numbers))
# f_to_n를 그대로의 숫자로 바꾸는 함수를 만드세요.
# Ex) my_function(f_to_n ) 입력시 다음과 같이 출력
# [1]  10   5   3   1 452  43
my_function <- function () {
    
}


# 정수 벡터 중 짝수만 출력하는 함수를 만드세요.
# Ex) print_even(1:10)
# [1] 2
# [1] 4
# [1] 6
# [1] 8
# [1] 10

print_even <- function(){
    
}


