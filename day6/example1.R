# R의내장데이터"mtcars"를이용하여, 모평균의총마력이146라고할수있는지,
# 검정하여라.
# ** Hints
# ①mtcars데이터정의서보기
# ②총마력은어떤변수일까?
# ③어떤분석을해야할까??

head(mtcars)
str(mtcars)
?mtcars
# 마력 : hp

mean(mtcars$hp)
cname<-rownames(mtcars)

hist(mtcars$hp)

#146인지 아닌지 확인하기 위해 twosided
t.test(mtcars$hp, mu=146,alternatives="two.sided")

#p-value = 0.9551 귀무가설 채택 / 146이라고 할 수 있다.