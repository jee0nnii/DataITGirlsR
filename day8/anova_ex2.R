cot <- c("A","B","C","D")
a <- mean(10,15,8,12,15) 
b <- mean(14,18,21,15)
c <- mean(17,16,14,15,17,15,18)
d <- mean(12,15,17,15,16,15)
cot

avg <- data.frame(a,b,c,d)

##
ma <- c(10,15,8,12,15,
        14,18,21,15,
        17,16,14,15,17,15,18,
        12,15,17,15,16,15)
cotting <- c(rep("A",5),
             rep("B",4),
             rep("C",7),
             rep("D",6))

boxplot(ma~cotting, col=2:5)
aov(ma~cotting)
fit2<-aov(ma~cotting)
summary(fit2)


# p값이 0.05보다 작음 
# 귀무가설기각
# 
# 마모도 코팅 사이에 평균의 차이가 1개 이상 있다는 결론이 나옴
# --> 어디에서 차이가 나는지 보기 위해 

TukeyHSD(fit2)
# diff에서 차이값들을 볼 수 있음 
# 그중 0.05보다 작은 건 1번과 2번
# b-a/ c-a 의 차이가 유의하다




