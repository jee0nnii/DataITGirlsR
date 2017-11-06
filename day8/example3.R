# {usingR} 패키지의galton데이터는928개의부모의키와아이의키에대한자료이다. 
# 이자료에포함되어있는부모의키는아빠의키와1.08*엄마의키의산술평균이다. 
# 이자료들의분포를살펴보기위해
# 화면을둘로나누고히스토그램을그려보고, 상관분석을해보자.

library(UsingR)
colnames(galton)

#산점도
plot(galton$parent ~ galton$child
     , main ="산점도"
     , xlab ="어린이"
     , ylab ="부모"
     , pch=20)#pch = 점의 라벨

par(mfrow= c(1,2))
hist(galton$child, col="red", breaks=100)
hist(galton$parent, col= "blue", breaks = 100)
par(mfrow= c(1,1))

library(ggplot2)
ggplot(data = galton, aes(x = galton$child))+
  geom_histogram(bins = 13, colour = "white")


cor.test(galton$child, galton$parent, alternative = "two.sided")


# 가설 ?
# 귀무 h0: = 0 
# 대립 h1: != 0


# # pvalue의 값이 0.05 보다 작음 : 
# t = 15.711, df = 926, p-value < 2.2e-16
# --> 귀무 기각, 대립 채택

# # 0을 포함하지 않음
# 95 percent confidence interval:
#   0.4064067 0.5081153
# 
# # 상관계수의 값
# sample estimates:
#   cor
0.4587624 



