rm(list=ls())
#check for packages
list.of.packages <- c("tidyverse", "devtools","readxl","rio")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
#devtools to install datverse package
list.of.packages <- c("dataverse")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) {
  library(devtools)
  devtools::install_github("IQSS/dataverse-client-r")
}
#load libraries
library(dataverse)
library(readxl)
library(tidyverse)
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
