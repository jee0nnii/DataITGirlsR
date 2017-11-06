# {MASS} 패키지에내장된Cars93 데이터에서, 생산국이"USA"와"non-USA"인
# 두개의group에대하여차가격의평균이차이가있는지검정해보아라.
# + EDA를통해두그룹에대해차가격을탐색해보세요.

install.packages("MASS")
library(MASS)

View(Cars93)
head(Cars93)
colnames(Cars93)

Cars93$Price
Cars93$Origin

boxplot(Cars93$Price~Cars93$Origin)
                # y ~ x
t.test(Cars93$Price~Cars93$Origin, Cars93)#, alternatives = "two.sided") --> default

