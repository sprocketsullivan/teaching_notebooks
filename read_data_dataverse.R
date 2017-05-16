#devtools to install datverse package
rm(list=ls())
library(devtools)
devtools::install_github("IQSS/dataverse-client-r")
install.packages("rio",dep=T)
install.packages(tidyverse)
#need the following libraries 
library(dataverse)
library(readxl)
library(rio)
#get the dataset overview
get_dataset("doi:10.7910/DVN/YG9IID")
#read in the file
f <- get_file("anonymized_survey.csv", "doi:10.7910/DVN/YG9IID")
# load it into memory
tmp <- tempfile(fileext = ".csv")
writeBin(as.vector(f), tmp)
#get data file
dat <- rio::import(tmp)
rm(f,tmp)
