library(readxl)
library(dplyr)
library(openxlsx)
a=read.xlsx("D:/文档/多元统计分析实验/1.xlsx")
b=matrix((a[1:4,2]),4)
b=as.matrix(a[1:4,2])#将数据框转换为矩阵
library(stringr)
str_sub(b,1,4)#提取1:4位置的字符串
str_sub(b,6,9)#提取6:9位置的字符串
f=function(b){ 
str_c(str_sub(b,1,4),str_sub(b,6,9),collapse = "...") 
}
typeof(b)
a[1:4,2]=apply(b,1,f)#首先化成矩阵，在用apply函数，可以对我们想要的地方运用函数，比如提取信息
a[1:5,2:4]
apply(b,1,f)#将提取的字符串连接起来
a=data.frame(read_excel("C:/Users/admin/OneDrive/文档/多元统计分析实验/1.xlsx"))
s=a[,c(7,8,11,14)]
colnames(s)=c("年龄","性别","收入","频率")
library(nnet)
factor(s$性别)
multinom(收入~性别,s) 

s[,1]=factor(t(s[,1]),levels=c("少年18岁以下","青年18~35岁","中年35~60岁","老年60岁以上"),
labels=c(1,2,3,4))#将男女用0和1表示
s[,2]=factor(t(s[,2]),levels=c("男","女"),labels=c(1,2))
s[,3]=factor(t(s[,3]),levels=c("3000元以下","3000~5000元","5000~8000元","8000～10000元",
"10000元以上"),labels=c(1,2,3,4,5))
s[,4]=factor(t(s[,4]),levels=c("从不","偶尔","一般","经常"),labels=c(1,2,3,4))
a2=as.numeric(c(s[,1],s[,2],s[,3]))
table(a2)
library("xlsx")
library()
write.xlsx(s,"D:/R/蘑菇.xlsx")
library(nnet)
as.factor(s$年龄)
as.factor(s$性别)
as.factor(s$收入)
m.glm=multinom(频率~年龄+性别+收入,s)
summary(m.glm)
coef(m.glm)
predict(m.glm,data.frame(2,3,5))



d=read.csv("D:/R/蘑菇.csv",header=T)
lapply(d,function(x) list(mean=mean(x),sd=sd(x)))#lapply是用于把指定的待应用的函数应用于列表的每一个元素，并返回列表结构的输出
sapply(d,function(x) list(mean=mean(x),sd=sd(x)))#对所有因子进行函数运算
tapply(d$年龄,INDEX=d$性别,FUN=mean)##根据性别对年龄进行函数运算
arrange(d[,-1],年龄,性别,收入,频率)
table(d$收入,d$年龄)
barplot(table(d$收入,d$年龄),col=c(1:5),beside=T)
legend("top",levels(d$收入),pch=1:5,col=1:5)
text(barplot(table(d$年龄),col=c(1:5)),table(d$年龄),table(d$年龄),col="black",pos=3)
legend("top",levels(d$收入),pch=1:5,col=c(1:5))
legend('right',levels(d$年龄),pch=15,col=1:4)#“bottomright”
cor(d$年龄,d$收入)
f=ftable(d$年龄,d$性别,d$收入,d$频率)
f[10,3]
lm(年龄~收入,d)
library(nnet)
as.factor(s$年龄)
as.factor(s$性别)
as.factor(s$收入)
m.glm=multinom(频率~年龄+性别+收入,d)
summary(m.glm)
coef(m.glm)
predict(m.glm,data.frame(年龄=2,性别=2,收入=5))
