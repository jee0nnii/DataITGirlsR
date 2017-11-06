### 기술통계량
iris
?mean
mean(iris$Sepal.Length)      # 평균
# sum(iris$Sepal.Length)/150
# sum(iris$Sepal.Length)/dim(iris)[1]

median(iris$Sepal.Length)    # 중앙값
sd(iris$Sepal.Length)        # 표준편차
var(iris$Sepal.Length)       # 분산
var(iris[, -5])              # 공분산행렬
quantile(iris$Sepal.Length)  # 사분위수
?quantile(iris$Sepal.Length) # probs 옵션을 조정하여 백분위수, 십분위수 등 반환 가능
summary(iris$Sepal.Length)   # 최솟값, 최댓값, 사분위수, 평균

cor(iris$Sepal.Length, iris$Sepal.Width) # 상관계수
plot(iris$Sepal.Length, iris$Sepal.Width)
cor(iris[, -5])                          # 상관계수 행렬
plot(iris[, -5])
plot(iris$Sepal.Length, iris$Petal.Length)
