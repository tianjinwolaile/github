library(readxl)
library(writexl)
library(stringr)
data=read_excel("C:\\Users\\admin\\OneDrive\\文档\\作业代做\\20230318\\数据整理.xlsx")
data=data.frame(data)
citys=unique(data[,1])
library(aTSA)
result1=result2=result3=data[1,]
for (j in 1:length(citys)){
  data1=subset(data,City==as.character(citys[j]))
  data1[,3:11]=scale(data1[,3:11],center = TRUE,scale = TRUE)
  result1=rbind(result1,data1)
}
result1[,2]=paste(str_sub(result1[,2] ,1,4),"/",str_sub(result1[,2],6,7),sep="")
write_xlsx(result1[-1,],"数据整理1.xlsx")


library(readxl)
library(writexl)
library(stringr)
data=read_excel("C:\\Users\\admin\\OneDrive\\文档\\作业代做\\20230318\\数据整理.xlsx")
data=data.frame(data)
citys=unique(data[,1])
library(aTSA)
result1=result2=result3=data[1,]
for (j in 1:length(citys)){
  data1=subset(data,City==as.character(citys[j]))
  data1[,3:11]=scale(data1[,3:11],center = TRUE,scale = TRUE)
  # 检验一阶差分是否平稳
  for (i in 1:10){
    ts1=ts(data1[,i+2],start=c(2015,1),frequency = 12)
    data2=diff(ts1)
    adf.test(data2)
  }
  data5=data.frame(matrix(0,83,12))#一阶差分
  colnames(data5)=colnames(data)
  for (m in 3:11){
    data5[,m]=diff(data1[,m])
    data5[,1]=data1[,1][1:83]
    data5[,2]=as.Date(data1[,2][2:84])
    data5[,12]=data1[,12][2:84]
  }
  result2=rbind(result2,data5)
}
result2[,2]=paste(str_sub(result2[,2] ,1,4),"/",str_sub(result2[,2],6,7),sep="")
write_xlsx(result2[-1,],"数据整理2.xlsx")




library(readxl)
library(writexl)
library(stringr)
data=read_excel("C:\\Users\\admin\\OneDrive\\文档\\作业代做\\20230318\\数据整理.xlsx")
data=data.frame(data)
citys=unique(data[,1])
library(aTSA)
result1=result2=result3=data[1,]
for (j in 1:length(citys)){
  data1=subset(data,City==as.character(citys[j]))
  data1[,3:11]=scale(data1[,3:11],center = TRUE,scale = TRUE)
  #去除季节效应
  for (k in 1:9){
    ts1=ts(data1[,k+2],start=c(2015,1),frequency = 12)
    data3=diff(diff(ts1),12)
    adf.test(data3)
  }
  data6=data.frame(matrix(0,71,12))#消除季节
  colnames(data6)=colnames(data)
  for (m in 3:11){
    data6[,m]=diff(diff(data1[,m]),12)
    data6[,1]=data1[,1][1:71]
    data6[,2]=as.Date(data1[,2][14:84])
    data6[,12]=data1[,12][14:84]
  }
  result3=rbind(result3,data6)
}
result3[,2]=paste(str_sub(result3[,2] ,1,4),"/",str_sub(result3[,2],6,7),sep="")
write_xlsx(result3[-1,],"数据整理3.xlsx")

