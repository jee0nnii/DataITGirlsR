# R의내장데이터"mtcars"를이용하여, 변속기가자동인차와, 수동인차의무게가
# 같은지검정하여라.

?mtcars
mtcars$am
mtcars$wt

t.test(mtcars$wt~mtcars$am,mtcars,alternatives="two.sided")

# 95%의 신뢰도는 0을 포함하지 않음 : 0이 아니다.
# 둘의 차이는 유의하다.
# 같지 않다 => 다르다라는 결과를 얻음


# # 대응표본 인가/????
# t.test(mtcars$wt,mtcars$am,paired = TRUE, data=mtcars)
# 대응은 아님 각 차별로 다른 값을 가지는 독립형이니까