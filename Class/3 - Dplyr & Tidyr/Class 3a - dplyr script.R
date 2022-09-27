# class 3- dplyR

rm(list=ls()) # clean memory
#install.packages(dplyr)
library(dplyr)
?dplyr


#summarize section 
summarised <- summarise(iris, Mean.Width = mean(Sepal.Width))
#NB. summarised is a more precise alternative to the function summary discovered last week.
#summarise(iris, mean.X= mean(c(Sepal.Width,Petal.Width))) 
#the line above does not make sense but it to show you you can customize your need with summarise, which you could not with summary

#manipulate section
# by col. name directly
selected1<-dplyr::select(iris, Sepal.Length, Sepal.Width, Petal.Length)
head(selected1) #similar effect than subset function from last week

# by col. range, especially useful when you have many to select
selected2 <- dplyr::select(iris, Sepal.Length:Petal.Length)
head(selected2, 4) # second argument here is to precise the number of row you wanna see with head

# by column range number (similar than with subset)
selected3 <- dplyr::select(iris,c(2:5))
head(selected3)

# if you want every column except a few one, use - in front of the col. name
selected4 <- dplyr::select(iris, -Sepal.Length, -Sepal.Width)
head(selected4)

#filter section (select 1category/value from one of your variable)
filtered1 <- filter(iris, Species == "setosa" ) # replace the 2 step subsetting studied last week where you first create a filter (value/categorie of interrest assing with TRUe otherwise False), 
  #then apply the filter to targeted dataframe (e,g. females<- students[f,] with f the filter for females students) 
head(filtered1,3)


#then you can combine filtering conditions:
filtered2 <- filter(iris, Species == "versicolor", Sepal.Width > 3)
tail(filtered2, 2) #work like the function head but give you the last 6 rows instead. can be customize like head, too
#tail also allow to quicky see how many "sample/specimens" you are left with after your filtering

# mutate section
#this function create new columnsand directly write new infos in it (can apply calculation directly or complex condition)
mutated1 <- mutate(iris, Greater.Half = Sepal.Width > 0.5 * Sepal.Length)
tail(mutated1)
table(mutated1$Greater.Half) #to tally the result of your new filter

#arrange

# Sepal Width by ascending order
arranged1 <- arrange(iris, Sepal.Width)
head(arranged1)

# Sepal Width by descending order
arranged2 <- arrange(iris, desc(Sepal.Width))
head(arranged2)

#group_by section
#very very handy!!!

gp <- group_by(iris, Species) #"like applying a factor value"
gp
gp.mean <- summarise(gp,Mean.Sepal = mean(Sepal.Width), Mean.Petal=mean(Petal.Width))
gp.mean

#pipe operator
# will become very handy as you advance in R

#To select the rows with conditions
iris %>% filter(Species == "setosa",Sepal.Width > 3.8)

#to cummulate actions in one-go
#e.g., to find the mean of "Sepal.Length" for each species: 1. group.by(species), 2. summarise (mean function)


iris  %>% group_by(Species) %>% summarise(Mean.Length = mean(Sepal.Length))
# single line above does the same job that lines from previous section:
gp <- group_by(iris, Species) #"like applying a factor value"
gp.mean <- summarise(gp,Mean.Sepal = mean(Sepal.Width))
gp.mean
###
#pipe operator is becoming increasingly used in R.

# Berrica's Question: forcing group order on a tibble object
gp <- group_by(iris, Species) #"like applying a factor value"
gp
gp$Species<-factor(gp$Species, levels=c("virginica", "setosa", "versicolor"))
arrangedb<-gp%>% arrange(Species, match(Species, Species))
head(arrangedb)


