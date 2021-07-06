setwd("D:\\Workshops\\R Programming for Data Science Workshop\\Part 02 - Data Manipulation & Cleaning\\Datasets")

#Case 01
data=read.csv("iris - ColumnTypes.CSV")
head(data)
str(data)

stv=data$Sepal.Length
stv_new=gsub("\"","",stv)

data$Sepal.Length=as.numeric(stv_new)
head(data)

#Case 02
data=read.csv("iris - SplittingColumns.CSV")
head(data)

L1=c()
L2=c()
for(i in data$Sepal.Width...Length){
  SL=strsplit(i,",")
  L1=c(L1,as.numeric(SL[[1]][1]))
  L2=c(L2,as.numeric(SL[[1]][2]))
}

data$SW=L1
data$SL=L2
data$Sepal.Width...Length=NULL
head(data)