#### 알고리즘 문제####
# 손님이 낸 돈과 받아야 할 돈을 입력하면 거스름돈을 어떻게 주어야 할 지 계산하여라

# ex ) 33000원 짜리 물건을 사기 위해, 100000원을 주었다면
# -거스름돈 : 67000원
# -5만원 : 1
# -1만원 : 1
# -5천원 : 1
# -1천원 : 2

# 힌트 : %/% - 몫  #   %% 나머지
change <- c(50000,10000,5000,1000)
x <- 100000
y <- 33000

#### here ####
#거스름돈 종류
money <- c(50000,10000,5000,1000,500,100,50,10)
money[1]
length(money) #8

x <- 100000   # x : 내가 가진 돈
y <- 38450    # y : 물건 값
change <- x-y # 내가 받을 돈
change

print(paste0('받을 거스름돈은? ', change ,'원'))

pocket <-c()  #거스름돈 받을 주머니
for (i in 1:length(money)){ #1:8 
  pocket[i] <- change %/% money[i]
  change <- change %% money[i]
  print(paste0(money[i],'원 ', pocket[i],'장/개 입니다.'))
}

names(pocket) <- money
pocket

calc <- function(x,y){
  ch <- c(50000,10000,5000,1000,500,100,50,10)
  po <- c()
  m <- x-y    #x = 내돈 y= 물건가격
  if (x - y < 0){
    return("Out of Money")
  }else if (x - y == 0){
    return("No change")
  }else{
    for (i in 1: length(ch)){
      po[i] <- m %/% ch[i]
      m <- m %% ch[i]
      print(paste0(ch[i],'원 ', po[i],'장/개 입니다.'))
  }
}
}
calc(1000,8000)


##########################################
pocket[c(1:8)]
print(paste0(money[i],'원 : ', pocket[c(1:8)]))

#### 왜이렇게 복잡하게 함?ㅋㅋㅋㅋㅋㅋ####
pocket <-c()  #거스름돈 받을 주머니
for (i in 1:length(money)){ #1:8 
  pocket[i] <- change %/% money[i]
  change <- change - (pocket[i]*money[i])
  print(paste0(money[i],'원 ', pocket[i],'장/개 입니다.'))
}

# 받을 잔돈에서 money의 i번째로 나누고 몫 추출 
#                              pocket[1] <- change %/% money[1] 
#빠져나간 잔돈을 계산해줘야됨 
#                              pocket[1]*money[1] 
#새로운 잔돈의 값은 ?         
#                              change <- change - ( pocket[1]*money[1] )
#기존의 잔돈에서 빠져나간 잔돈을 빼주면 새로운 잔돈이 생기게 됨
