#실습
# while반복문과 if조건문을 이용하여
# 1부터 100까지 짝수만 더하기

sum <- 0
nums <- 1

while(nums <= 100){
  if (nums %% 2 == 0){
    sum <- sum +nums
  }
  nums <- nums + 1
}
sum

####
i <- 1
while (i<=3){
  while (i<=3){
    print(i)
    i<-i+1
  }
}

####정수만 출력하는 함수
func1 <- function(x){
  for (i in 1:x){
    if (i %% 2 == 0)
      print (i)
  }
}


