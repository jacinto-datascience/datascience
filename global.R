if (!require("readr")) install.packages('readr')
if (!require("plyr")) install.packages('plyr')
if (!require("dplyr")) install.packages('dplyr')
if (!require("ggplot2")) install.packages('ggplot2')
if (!require("shiny")) install.packages('shiny')
if (!require("shinydashboard")) install.packages('shinydashboard')
if (!require("DT")) install.packages('DT')

library(readr)
library(plyr)
library(dplyr)
library(ggplot2)
library(shiny)
library(shinydashboard)
library(DT)

#setwd("/home/DataScience/Base de dados")

airbnb = read_csv("listings.csv")

airbnb = airbnb %>%
  select(id,host_id, host_name, neighbourhood,room_type,price,number_of_reviews,reviews_per_month,listing_url, host_url, host_response_rate, bathrooms, bedrooms, review_scores_rating) %>%
  filter(!is.na(neighbourhood)) %>%
  mutate(price = as.numeric(gsub('\\$|,', '', price))) %>%
  mutate(host_response_rate = as.numeric(gsub('%', '', host_response_rate))) %>%
  rename(Bairro = neighbourhood)
