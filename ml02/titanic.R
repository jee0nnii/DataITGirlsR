dat <- read.table("C:/Users/Lucy Kim/Documents/dataitgirls/datahee/titanic.txt", header = TRUE, sep = "\t")
head(dat)

#http://rfriend.tistory.com/193

summary(dat)
sum(is.na(dat$Age))
#나이 결측치 넘나 많음 -> 평균값으로 대체해
dat$Age[is.na(dat$Age)] <- mean(dat$Age, na.rm = TRUE) 

# - name
newdat <- dat[c(2:5)]
head(newdat)
str(newdat)

newdat$Survived <- as.factor(newdat$Survived)
newdat$Age <- as.factor(newdat$Age)

library(arules)
#0.1/0.5로 했을 땐 37개 나
rules <- apriori(dat = newdat, 
                 parameter = list(support=0.15,
                                         confidence=0.7,
                                         minlen=2))
summary(rules)
#지지도도:support 향상도: lift 신뢰도: confidence 
rules = sort(rules, by = "lift")
inspect(rules)

library(arulesViz)
plot(rules)
plot(sort(rules, by ="support")[1:17], method="grouped")
plot(rules, method = "graph", control = list(type="items sets"))
