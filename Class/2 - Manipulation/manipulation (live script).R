#manupulation live script
rm(list=ls())
library(datasets)
data("iris")
head(iris)
str(iris)

summary(iris)

fix(iris)


#part 2


students<-read.table('https://www.dipintothereef.com/uploads/3/7/3/5/37359245/students.txt',header=T, sep="\t", dec='.') # read data set from url
str(students) 

students[,1]
students$height
head(students)

students[1,]

students$gender=="female"
students$height>160
students$shoesize<=38

f<-students$gender=="female"
females<-students[f,]

rownames(females)<- c("vanessa","vicky", "michelle", "joyce", "victoria")

#Practice 2.1
#####
setosa<-iris$Species=="setosa"
setosaDF<-iris[setosa,]
str(setosaDF)
#####

sample(1:nrow(females),2,replace=FALSE)

females[sf,]

#sorting

ind1<-order(students$height)
students[ind1,]

students[order(students$height),]

#recoding
colors<- ifelse(students$gender=="male", "blue", "red")
