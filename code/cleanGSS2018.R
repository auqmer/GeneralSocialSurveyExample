#************************************************************************
# Title: clean gss 2018 data
# Author: William Murrah
# Description: Import and prepare GSS 2018 data for analysis
# Created: Friday, 26 March 2021
# R version: R version 4.0.4 (2021-02-15)
# Project(working) directory: /Users/wmm0017/Documents/RuserProjects/GeneralSocialSurvey
#************************************************************************

gss <- read.csv(file = "data/gss2018.csv", header = TRUE)
dict <- read.csv(file = "data/gssDictionary.csv", header = TRUE)

# Make names easier to type
names(gss) <- tolower(names(gss))

# Remove underscore from id name
names(gss)[which(names(gss) == "id_")] <- "id"

# Labels for partyid variable
pidlabels <- c("strong democrat", "democrat", "left independent",
              "independent", "right independent", "republican",
              "strong republican")

# gss$sex <- factor(gss$sex, labels = c("male", "female"))
# 
# gss$year <- NULL
# 
# gss$usetech[gss$usetech > 100 | gss$usetech < 0] <- NA
# 
# gss$educ[gss$educ > 20] <- NA
# 
# 
# gss$educ <- cut(gss$educ, breaks = c(0, 8, 11, 12, 19, 20), 
#             labels = c("less than hs", " some hs", 
#                        "hs grad", "some college",
#                        "college degree"), 
#             ordered = TRUE)
# Clean variables
gss <- within(gss, {
                 year <-  NULL # Year is constant (2018)
                 usetech[usetech > 100 | usetech < 0] <- NA # Recode missing
                 happy[happy > 3] <- NA                     # Recode missing
                 partyid[partyid > 6] <- NA                 # Recode missing
                 partyid <- factor(partyid, labels = pidlabels)
                 rincome[rincome > 12] <- NA                # Recode missing
                 race <- factor(race, label = c("white", "black", "other"))
                 sex <- factor(sex, labels = c("male", "female"))
                 educ[educ > 20] <- NA
                 educ <- cut(educ, breaks = c(0, 8, 11, 12, 19, 20), 
                             labels = c("less than hs", " some hs", 
                                        "hs grad", "some college",
                                        "college degree"), 
                             ordered = TRUE)
                 # can you do the others?
                 hrs1[hrs1 < 0] <- NA
                 hrs2[ hrs2 < 0] <- NA
                 })


# Save cleaned data as R data file
#save(gss, file = "data/gss.Rdata")

