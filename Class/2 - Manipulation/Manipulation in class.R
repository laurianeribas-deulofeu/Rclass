# Manipulation (in class version)
rm(list=ls())

library(datasets)
data(iris)
head(iris)

str(iris)

summary(iris)

fix(iris)
str(iris)

#Selection

students<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') # read data set from url
# selecting column

students$height

# R syntaxt : dataset[no row, no column]
 students[,1]
 students[1,1]
 students[10,]
 
students$height[5]

#subset

f<-students$gender=="female"
females<-students[f,]
females
rownames(females)<-c("Vanessa", "Vicky", "Michelle","Joyce","Victoria")


#practice 2.1
setosa<-iris$Species=="setosa"
setosaDF<-iris[setosa,]
str(setosaDF)

versicolor<-iris$Species=="versicolor"
VersiDF<-iris[versicolor,]

virginica<-iris$Species=="virginica"
VirginicaDF<-iris[virginica,]
str(VirginicaDF)
head(VirginicaDF)

#sample


#sorting

ind1<-order(students$height)


#recoding

colors<-ifelse(students$gender=="male","blue","red")

students$color<-ifelse(students$gender=="male","blue","red")

students$gender<-ifelse(students$gender=="male","green", "yellow")

tall<-students$height>=160
tall

#exercise
iris$color<-ifelse(iris$Species=="setosa","purple",ifelse(iris$Species=="versicolor","blue","pink"))
iris[c(1,51,102),]

iris[order(iris$Sepal.Width, decreasing = T),]

