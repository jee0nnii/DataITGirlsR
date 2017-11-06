# 과제1 - 색깔이 있는 물고기 종류별 boxplot 그리기 (p19 참고)
# 과제2 - 이쁘게 산점도 그리기(correlation plot) (p22~23 참고)
# * Hint : Google Search (패키지를 이용하면 됩니다!)

setwd("C:/Users/joo/Documents/dataitgirls4")
library(readxl)
library(RColorBrewer)

list.files()
fishcatch <- read_xls("fishcatch_revise.xls",sheet = 2) #2번째 시트에 있는 데이터 불러옴
head(fishcatch)

fc <- subset(fishcatch, select =c(-obs,-sex)) #필요한 컬럼만 쓸 겅
head(fc)

attach(fc)

####이거아님####
# spe01 <- subset(fc, subset = (Species == '1'))
# spe02 <- subset(fc, subset = (Species == '2'))
# spe03 <- subset(fc, subset = (Species == '3'))
# spe04 <- subset(fc, subset = (Species == '4'))
# spe05 <- subset(fc, subset = (Species == '5'))
# spe06 <- subset(fc, subset = (Species == '6'))
# spe07 <- subset(fc, subset = (Species == '7'))

# wplt <- boxplot(fc$Weight~fc$Species,fc, col = brewer.pal(7,"Set1"))
# l1plt <- boxplot(fc$Length1~fc$Species,fc, col = brewer.pal(7,"Set2"))
# l2plt <- boxplot(fc$Length2~fc$Species,fc, col = brewer.pal(7,"Set3"))
# l3plt <- boxplot(fc$Length3~fc$Species,fc, col = brewer.pal(7,"Reds"))
# hplt <- boxplot(fc$Height~fc$Species,fc, col = brewer.pal(7,"Blues"))
# w2plt <- boxplot(fc$Width~fc$Species,fc, col = brewer.pal(7,"Greens"))

# install.packages('ggplot2')
# library(ggplot2)
# ggplot(fc)+geom_boxplot(aes(x=Species,y=Weight,group =1))


####no.1####

# par function 사용
# mfrow : number of multiple figures(use row-wise) 
# 1 , 2 , 3
# 4 , 5 , 6
# mfcol : number of multiple figures(use column-wise)
# 1 , 4
# 2 , 5
# 3 , 6

par(mfrow = c(2,3),         # make frame by 2 row, 3column
    mar = c(4,3,3,1),       #내부 마진
    oma = c(0.5,0.5,3,0.5)) #외부 마진
                      #아래, 왼쪽, 위쪽, 오른쪽

#물고기 종류별 각 특징에 대한 boxplot
boxplot(Weight~Species,data = fc, col = brewer.pal(7,"Set1"), main = "Weight")
boxplot(Length1~Species,fc, col = brewer.pal(7,"Set2"), main = "Length1")
boxplot(Length2~Species,fc, col = brewer.pal(7,"Set3"), main = "Length2")
boxplot(Length3~Species,fc, col = brewer.pal(7,"Reds"), main = "Length3")
boxplot(Height~Species,fc, col = brewer.pal(7,"Blues"), main = "Height")
boxplot(Width~Species,fc, col = brewer.pal(7,"Greens"), main = "Width")

mtext("*Boxplot HW*", outer =TRUE, cex =1.5 , col ="black")

#par reset 하는 방법 1
par(mfrow=c(1,1),oma = c(0,0,0,0)) 

#par reset 하는 방법 2 : not working.....
op <- par(no.readonly = TRUE)
par(op)

colnames(fc)

detach(fc)
str(fc) # class 3가지 형식을 가짐 / as.data.frame으로 데이터프레임형식으로 바꿔주
fc <- as.data.frame(fc)

par(mfrow = c(2,3))
for (i in 2:7){
  boxplot(fc[,i] ~ fc$Species, ylab = colnames(fc)[i]
          ,xlab="species",col = brewer.pal(7,"Set3"), main =paste0(colnames(fc)[i],"Box plot"))
}


####no.1 ggplot####
#발표자 풀이.1
dat <- read_xls("fishcatch_revise.xls",sheet = 2)
dat$Species <- as.factor(dat$Species)
#물고기 종류를 나누기 위해num을 factor로 바꿔줌
str(dat) #바뀜
library(ggplot2)
#install.packages("ggplot2")

plot1<-ggplot(dat, aes(x=Species, y=Weight, fill=Species))
+theme_bw() # 배경화면 흰색으로 변경
+geom_boxplot()
+ggtitle("Weight")
+theme(axis.title.x=element_blank()
       ,axis.title.y=element_blank()
       ,legend.position = "none"
       , plot.title = element_text(hjust = 0.5))
plot2<-ggplot(dat, aes(x=Species, y=Length1, fill=Species))+theme_bw()+geom_boxplot()+ggtitle("Length1")+theme(axis.title.x=element_blank(),axis.title.y=element_blank(),legend.position = "none", plot.title = element_text(hjust = 0.5))
plot3<-ggplot(dat, aes(x=Species, y=Length2, fill=Species))+theme_bw()+geom_boxplot()+ggtitle("Length2")+theme(axis.title.x=element_blank(),axis.title.y=element_blank(),legend.position = "none", plot.title = element_text(hjust = 0.5))
plot4<-ggplot(dat, aes(x=Species, y=Length3, fill=Species))+theme_bw()+geom_boxplot()+ggtitle("Length3")+theme(axis.title.x=element_blank(),axis.title.y=element_blank(),legend.position = "none", plot.title = element_text(hjust = 0.5))
plot5<-ggplot(dat, aes(x=Species, y=Height, fill=Species))+theme_bw()+geom_boxplot()+ggtitle("Height")+theme(axis.title.x=element_blank(),axis.title.y=element_blank(),legend.position = "none", plot.title = element_text(hjust = 0.5))
plot6<-ggplot(dat, aes(x=Species, y=Width, fill=Species))+theme_bw()+geom_boxplot()+ggtitle("Width")+theme(axis.title.x=element_blank(),axis.title.y=element_blank(),legend.position = "none", plot.title = element_text(hjust = 0.5))

library(gridExtra)
install.packages("gridExtra")
grid.arrange(plot1,plot2,plot3,plot4,plot5,plot6,nrow=2)


####no.2####
# 상관분석(Correlation Analysis)은 두 변수간에 어떤 선형적 관계를 갖고 있는 지를 분석하는 방법이다. 
# 두변수는 서로 독립적인 관계로부터 서로 상관된 관계일 수 있으며, 
# 이때 두 변수간의 관계의 강도를 상관관계(Correlation, Correlation coefficient)라 한다.
?cor
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

head(fc)

mulchart <- fc[,c(2,3,4,5,6,7)] # => fc[,c(2:7)]
mulchart  #결측치가 있음 근데 아래를 실행해도 수행이 됨 뭐임??/....
chart.Correlation(mulchart,histogram = TRUE, pch=19)

mulchart2 <- na.omit(mulchart)
mulchart2
chart.Correlation(mulchart2,histogram = TRUE, pch=19)

#save plot 
png(filename = "correlationmatrix.png") #make empty file
chart.Correlation(mulchart2,histogram = TRUE, pch=19) #run
dev.off() #check the previous file

# cor(mulchart)

####no.3####
# 결측치를 제외하고 상관분석 시행 : complete.obs
# http://rfriend.tistory.com/126
# http://rstudio-pubs-static.s3.amazonaws.com/27134_f8052fbae4fe4402824ebb9fe080d876.html

install.packages("corrplot")
library(corrplot)
?corrplot

fccor<-cor(mulchart,use = "complete.obs")
fccor
#colorRampPalette 색깔 부여해주는 함수
col4 <- colorRampPalette(c("#7F0000", "red", "#FF7F00", "yellow", "#7FFF7F", 
                           "cyan", "#007FFF", "blue", "#00007F"))
corrplot(fccor,type="upper", order = "hclust", addrect = 2, col = col4(10))

#no2 에서 미리 결측치를 처리해서 use 옵션을 줄 필요가 없음
fccor2 <-cor(mulchart2)
corrplot(fccor2,type="upper",order="AOE",tl.col = "black", tl.srt = 45)
