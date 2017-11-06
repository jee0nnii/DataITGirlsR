# 두종류의신발밑창의원재료가닳는정도가차이가있는지를검정하기
# 위해서10명의소년에게한쪽은A라는원재료로만든신발을신기고,
# 다른한쪽은B라는원재료로만든신발을신긴후에, 일정기간이지난후에
# 신발을수거하여10명의각소년의왼쪽신발밑창의닳은정도와오른쪽신발
# 밑창의닳은정도의차이를비교하여두종류원재료의재질이다른지를
# 검정하여라.


boys <- c(1:10)
rowA <- c(13.2,8.2,10.9,14.3,10.7,6.6,9.5,10.8,8.8,13.3)
rowB <- c(14.0,8.8,11.2,14.2,11.8,6.4,9.8,11.3,9.3,13.6)

shoes <- data.frame(boys,rowA,rowB)
shoes

# 대응된 ttest
t.test(shoes$rowA, shoes$rowB, data=shoes, paired = TRUE)

# 결과 : 둘의 평균의 차이는 다르다. 

# 둘의 차이를 구해서 onesample 방식으로 대응 ttest 가능
shoesdiff<-shoes$rowA-shoes$rowB
t.test(shoesdiff, alternative = "two.sided")
