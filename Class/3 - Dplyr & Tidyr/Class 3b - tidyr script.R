# class 3b - tidyr

rm(list=ls()) # clean memory
library(tidyr)

# 5 main categories for tidyr functions:
    #1. pivotting-> table from wide to long format ( and reverse): extremely useful as ecological dateset often comes in wide format (each column= 1 variable) but ggplot2 (tidyverse too) requires long format, a lot of thing in python also comes in long format so extremely efficient if you have to work in both languages
        #pivot_longer(), pivot_wider(), etc. SEE vignette("pivot")
    #2. rectangling-> for deeply nested list like JSON (e.g., geospatial analysis, modelling)  into tidy tibbles
    #3. nesting ->grouped data acan be stored into a single row ( or reversed)
    #4. splitting and combining for character columns, can be very handy to reformat dataset
    #5.implicit missing value -> more option on how to handle situation with missing value: dropping na, filling up missing value with NA (e.g., missing date), or even replace missing value with previous or next values or a specified value.

#pivoting section:

TW_corals<-read.table('Class/3 - Dplyr & Tidyr/Data/tw_corals.txt', header=T, sep='\t', dec='.') 
TW_corals

TW_corals_long <- TW_corals %>% pivot_longer(Southern_TW:Northern_Is, names_to = "Region", values_to = "Richness")
head(TW_corals_long, 10)
# important to precise "names_to" and "values_to" to not get lost in what is what after you transformed your dataset format

# reverse operation: turn a long  format into a wide one. (easier visualization when examining dataset for specific value or "ideas")
TW_corals_wide <- pivot_wider(TW_corals_long, names_from = Region, values_from = Richness) 
TW_corals_wide

# NOTE that the pipe operator is not mandatory but will become increasingly helpfull as your coding skill improve and the stats/figures you need to run complexify


income<-read.table('Class/3 - Dplyr & Tidyr/Data/metoo.txt',header=T, sep="\t", dec=".", na.strings = "n/a")
income

# perfoming successive reformating in one-go to reformat clearly the dataset we have at hand: we do not have 4 variables at we could think at first glance but 2: gender: taking 2 values: F or M, and "work type": full-timeor other
#using pivot_longer with argument names_sep will help us make this clearer and better think our statistical approach

income_long<-income%>%pivot_longer(cols=-state, names_to=c("gender", "work_type"), names_sep="_", values_to = "income")
income_long
 
#of course reversed is doable with pivot_wider


income_long %>% pivot_wider(names_from = c(gender,work_type), 
                            values_from = income,
                            names_sep = ".")

# Important properly chose your sep., to avoid future issues if later on you'll need to "pivot_longer" your table again.
#e.g., the use of "-" might cause issues if you have composed name "Maine-USA", "Taipei-Taiwan"; "Ribas-Deulofeu" or here in my case as I use a "_" in the previous step 

# R packages keeps evolving, so sometimes some functions are depreciated. they still work but are not longer maintained and eventually will disappear, so it is good to also change your habits when functions get depreciated.
#e.g., vian with gather, in my case I have the problenm with one "GIS" function that i really need to stop using as they warned than from 2023 it will not work anymore, so I will have no more choice that correct my previous scripts and it will be a pity if I haven't done it before publishing some of my paper with the Rscript as readers will need to fix the script themselves.


#splitting 
#columns

income_long_var <- income %>%  pivot_longer(cols = -1, 
                                            names_to = "var1", 
                                            values_to = "income")
head(income_long_var,10)
#here we get the long version of our original dataset but without having separate the gender and work type aspect, like we did previously using the "names_sep" argument from the "pivot_longer" function
# so now we want to split that new var1 according to gender and work_type like previously.

income_sep <- income_long_var %>%  separate(col=var1, sep="_", into=c("gender", "work_type"))
head(income_sep)
#respect the order in which your info appear in the column you wanna split in the way you order your "into" arguments.


#rows version
#instead of having your split column info organized in the wide direction (new columns for the split info= new variables),
#you get the split info organize in row so in the case 8 rows per considered state as it will consider gender and work type separatly (as you can see each incomes values appears twice: once for the variable gender, and once for the variable work_time)

#many other functions, such as uncount
df <- tibble(x = c("a", "b"), n = c(1, 2))
uncount(df, n)
uncount(df, n, .id = "id")

