#환자번호
no <- c(1,2,3,4,5,6,7,8,9,10)
#1달동안 위약을 투여한 기간의 혈압
placebo <- c(51.4,52.0,45.5,54.5,52.3,50.9,52.7,50.3,53.8,53.1)
#혈당수
medicien <- c(50.1,51.5,45.9,53.1,51.8,50.3,52.0,49.9,52.5,53.0)

hop <- data.frame (no,placebo,medicien)
hop

#paired 된 표본
t.test(hop$placebo, hop$medicien, paired = TRUE)

# t = 3.5507, df = 9, p-value = 0.006209
# 유의하지 않음
# 95%의 신뢰구간에서 0을 포함하지 않는다

# 귀무가설 기각 :
#   둘의 평균의 차이가 있다

#paired는 onesampletest로 검정을 할 수 있음
diff <- hop$placebo ~ hop$medicien
t.test(diff)


## 패키지 usingR의 cfb 데이터를 이용하여 나이가 40이상인 사람과 40미만인 사람의 연봉 차이가 유의한지?
# h0 : 40이상그룹의 수입 = 40미만그룹의 수입 ( 귀무가설 )
# h1 : 같지 않다. ( 대립가설 )
install.packages('UsingR')
library(UsingR)
colnames(cfb)
?cfb
?subset

hist(cfb$AGE) # 연속형변수니까 나눠줘야됨?
cfb$NewAge <- ifelse(cfb$AGE >= 40,"A","B")

# ageup <- ageup[cfb$AGE > 40]
# agedown <- agedown[cfb$AGE <= 40]

#독립 t검정 ( 그룹(x:cfb$NewAge)에 따른 수입(y:cfb$INCOME))
t.test(cfb$INCOME ~ cfb$NewAge)

# 두 그룹의 연봉의 차이는 없다 ( 수입이 같으니까 )

# 귀무가설을 채택함 : ~ 없다
# t = 0.5531, df = 422.13, p-value = 0.5805
# p-value값 보는 게 중요함 ㅋㅋ 0.5 보다 크니까





