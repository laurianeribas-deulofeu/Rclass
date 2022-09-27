# class 3b - tidyr

rm(list=ls()) # clean memory

# 5 main categories for tidyr functions:

#1. pivotting-> table from wide to long format ( and reverse): extremely useful as ecological dateset often comes in wide format (each column= 1 variable) but ggplot2 (tidyverse too) requires long format, a lot of thing in python also comes in long format so extremely efficient if you have to work in both languages
#pivot_longer(), pivot_wider(), etc. SEE vignette("pivot")

#2. rectangling-> for deeply nested list like JSON (e.g., geospatial analysis, modelling)  into tidy tibbles