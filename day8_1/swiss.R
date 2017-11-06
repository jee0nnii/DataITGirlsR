data(swiss)
View(swiss)
colnames(swiss)

dim(swiss)
str(swiss)

for(i in 1:dim(swiss)[2]){
  print(summary(swiss[i]))
}

plot(swiss)
swiss[which.min(swiss$Infant.Mortality),]
which.max(swiss$Education)

swissfit <- lm(swiss$Infant.Mortality ~ ., data=swiss)
summary(swissfit)

par(mar=c(1,1,1,1))
par(mfrow=c(2,2))
plot(swissfit)

##변수선택법
# 전진선택법
swissforward <- step(swissfit, direction="forward")
summary(swissforward)

# 후진제거법
swissbackward <- step(swissfit, direction="backward")
summary(swissbackward)

# 단계적선택법
swissstepwise <- step(swissfit, direction="both")
summary(swissstepwise)

#### etc ####
# test <- subset(swiss, min(swiss$Infant.Mortality))
# ?apply
# a<-apply(swiss,2,min)
# a
# b<-apply(swiss,2,max)
