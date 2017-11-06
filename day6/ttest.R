getwd()
cof1 <- read.csv('coffee1.csv', header= TRUE)
head(cof1)
dim(cof1)

#onesample ttest
hist(cof1$x)
t.test(cof1$x, mu=340, alternative = "two.sided")

# p-value = 0.001978
# 귀무가설 기각, 대립가설 채택 : 0.05보다 작기때문에
# 340은 아님 / 342정도 된다.

t.test(cof1$x, mu=340, alternative = "greater")
# p-value = 0.0009891
# 340 보다 클 가능성이 있다.
# 95 percent confidence interval: 341.0424 
# 340을 포함하지 않고 있음


#twosampletest
cof2 <- read.csv('coffee2.csv',header = TRUE)
t.test(cof2$coffee~cof2$group, cof2, alternative ="two.sided")

# mean in group ediya mean : 384.32
# p-value < 2.2e-16 : 대립가설 채택

t.test(cof2$coffee~cof2$group, mu=14, cof2, alternative ="two.sided")


#대응표본
bp <- read.csv('bloodpressure.csv', header = TRUE)
t.test(bp$before, bp$after, paired = TRUE, data = bp)


#
bp$diff <- bp$before - bp$after
#양측검정
t.test(bp$diff, alternative ="two.sided")
