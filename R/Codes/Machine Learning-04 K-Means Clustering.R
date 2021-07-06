setwd("D:\\Workshops\\R Programming for Data Science Workshop\\Part 04 - Machine Learning\\Datasets")
df=read.csv("Wine.CSV")
head(df)

df_new=df
df_new$Class=NULL

head(df_new)

#Scaling data
fun_scaling=function(v){
  return((v-mean(v))/sd(v))
}

data_scaled=apply(df_new, 2, fun_scaling)
head(data_scaled)

#Data matrix form
data_mat=as.matrix(data_scaled)

km=kmeans(data_mat,3)

km$cluster

df$Class

#Checking the optimum k
k_vec=1:10
inertia=c()

for(k in k_vec){
  km=kmeans(data_mat,k)
  inertia=c(inertia,km$tot.withinss)
}


plot(inertia,type="b")

km=kmeans(data_mat,4)

km$cluster

df$Class
