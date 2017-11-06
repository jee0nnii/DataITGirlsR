loan <- read.csv("Personal Loan.csv")
View(loan)
colnames(loan)

RandomIndex <- sample(1:nrow(loan), size=round(nrow(loan)*0.7), replace=F)

train.loan<-loan[RandomIndex,]
test.loan <- loan[-RandomIndex,]

loanfit <- glm(Personal.Loan~ .-ZIP.Code-ID, family=binomial, data=train.loan)
summary(loanfit)

##predicting with the model
predloan <- predict(loanfit, test.loan, type="response")
table(train.loan$Personal.Loan)
table(test.loan$Personal.Loan)

cutoff0.5 <- ifelse(predloan > 0.8, 1, 0)
pred_tab <- table(test.loan$Personal.Loan, cutoff0.5)

## accuracy (정확도)
(pred_tab[1,1] + pred_tab[2,2]) /sum(pred_tab)

## sensitivity (민감도)
pred_tab[2,2] / sum(pred_tab[2, ])

## specificity (특이도)
pred_tab[1,1] / sum(pred_tab[1, ])
