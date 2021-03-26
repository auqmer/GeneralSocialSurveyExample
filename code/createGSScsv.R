#************************************************************************
# Title: create gss csv data
# Author: William Murrah
# Description: Create csv data for project using .rda file from 
#             Harris' Statistics with R book.   
# Created: Friday, 26 March 2021
# R version: R version 4.0.4 (2021-02-15)
# Project(working) directory: /Users/wmm0017/Documents/RuserProjects/GeneralSocialSurvey
#************************************************************************

# Get data stored in  Dropbox course materials location
load("~/Dropbox/CourseMaterial/StatisticwithR_Harris/data/gss2018.rda")



dict <- data.frame(variable = names(GSS),
                   label = attributes(GSS)$col.label)

# Create local csv file
write.csv(GSS, file = "data/gss2018.csv", row.names = FALSE)
write.csv(dict, file = "data/gssDictionary.csv", row.names = FALSE)
# Clean workspace
rm(GSS)
