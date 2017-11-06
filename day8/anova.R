# iris 데이터에서, 붓꽃종류에따른Sepal.Length가차이가나는지검정하고,
# 어느종류에서차이가나는지도검정하여라.
# + 상자그림

# 상관관계는 산점도
# 세그룹에 대한 평균을 보기 위해 쓰기 좋은 건 박스플롯

boxplot(iris$Sepal.Length~iris$Species , col=2:4)
str(iris)
fit1 <- aov(iris$Sepal.Length~iris$Species, iris)
summary(fit1)
TukeyHSD(fit1)

# diff : 차이
# p adj : 위의 pvalue를 조정한 거, 값이 너무 작아서 0을 준 거
# 종류별 차이가 유의하다?

# upr - low 가 0을 포함하면 유의하지 않음