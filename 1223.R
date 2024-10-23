x=c(rep(3,2),NA,3)
sum(x,na.rm=TRUE)
A=matrix(1:24,nrow=4,ncol=6,byrow = T)
A
B=A[,c(4,2,3,1,5,6)]
B
list=list(id=1:10,name=c("A","B","C","D","E","F","G","H","I","J"),no.children=c(2,2,1,3,1,0,4,0,5,3))
number5=c(list$id[5],list$name[5],list$no.children[5])
number5

attach(ChickWeight)
class(ChickWeight)
dim(ChickWeight)
typeof(ChickWeight)
head(ChickWeight)
tail(ChickWeight)
summary(ChickWeight)
str(ChickWeight)


mean(ChickWeight$weight)
var(ChickWeight$weight)
sd(ChickWeight$weight)
median(ChickWeight$weight)
max(ChickWeight$weight)-min(ChickWeight$weight)

data=data.frame("var"=var(ChickWeight$weight),
                "sd"=sd(ChickWeight$weight),
                "range"=max(ChickWeight$weight)-min(ChickWeight$weight),
                "med"=median(ChickWeight$weight),
                "mean"=mean(ChickWeight$weight))
dataset=read.table("dataset.txt")
subset(dataset,Math<500,select=c(StuName,Science))
dataset$Total=dataset$Math*0.05+dataset$Science*0.25+dataset$English*0.7

norm=rnorm(10,0,1)
sd(norm)*10/9
library(readxl)
data1=read_excel("附件2：点名册(1).xls",skip=2)
data=read_excel("附件1：moodle发帖日志(1).xlsx")
set.seed(10)
sample=sample(data1$姓名,5,replace = F)
View(data)
library(stringr)
data$newname=str_sub(data$用户全名,1,3)
data_1=subset(data,newname==sample[1])
data_2=subset(data,newname==sample[2])
data_3=subset(data,newname==sample[3])
data_4=subset(data,newname==sample[4])
data_5=subset(data,newname==sample[5])
data_count=data.frame(c(dim(subset(data_1,事件名称=="话题已建立",select=事件名称))[1],dim(subset(data_1,事件名称=="贴文已建立",select=事件名称))[1]),
           c(dim(subset(data_2,事件名称=="话题已建立",select=事件名称))[1],dim(subset(data_2,事件名称=="贴文已建立",select=事件名称))[1]),
           c(dim(subset(data_3,事件名称=="话题已建立",select=事件名称))[1],dim(subset(data_3,事件名称=="贴文已建立",select=事件名称))[1]),
           c(dim(subset(data_4,事件名称=="话题已建立",select=事件名称))[1],dim(subset(data_4,事件名称=="贴文已建立",select=事件名称))[1]),
           c(dim(subset(data_5,事件名称=="话题已建立",select=事件名称))[1],dim(subset(data_5,事件名称=="贴文已建立",select=事件名称))[1]))
colnames(data_count)=sample
rownames(data_count)=c("发帖数","回帖数")
data_count