credit <- read.csv('Personal Loan.csv')
head(credit)

for(i in 1: dim(credit)[2]){
  print(summary(credit[i]))
}
str(credit)
credit$Education <- factor(credit$Education)

credit[which.min(credit$Experience),]
credit <- credit[-c(452),]
##경력이 -값인거를 빼줘야될 거같은데