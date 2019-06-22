library(readxl)
library(shinydashboard)
library(ggplot2)
library(reshape2)
library(stringr)
library(dplyr)
library(plotly)
library(tidyr)

options(scipen=999)

per_sector_df <- read_xlsx("armenia_df.xlsx",sheet = 2)
FDI_df <- read_xlsx("armenia_df.xlsx", sheet = 1)
country_investment <- read_xlsx("armenia_df.xlsx", sheet = 3)
IAC_df <- read_xlsx("armenia_df.xlsx", sheet = 4)

#Pre proccess sheet 3
colnames(country_investment) <- c("Country","2014","2015","2016","2017")
melted_country_df<-melt(country_investment, by= country_investment$Country)
colnames(melted_country_df) <- c("Country","year","Invesment mln amd")
melted_country_df$year <- as.numeric(as.character(melted_country_df$year))

country_df <-data.frame(t(country_investment))
country_df<-country_df[-1,]
colnames(country_df) <- c("Rassian Federation","France","Germany","Cyprus","Argentina","Greece","Lebanon","Canada","United States","Netherlands")
country_df$year <- 2014:2017
country_df<-country_df[,-12]
rownames(country_df) <- 1:4



###

melted_df <- melt(per_sector_df, by= per_sector_df$`Economic Sector`)
melted_df$variable <- as.factor(trimws(str_replace_all(melted_df$variable,"Year","")))

colnames(melted_df)<- c("Economic_sector","Year","Investment")
class(melted_df$Year)
melted_df$Year <- as.numeric(as.character(melted_df$Year))

plot_two_df <-melted_df 



per2014<-per_sector_df$`Year 2014`[c(-46,-47)]/as.numeric(per_sector_df[per_sector_df$`Economic Sector`== "Total", "Year 2014"])*100
per2015<-per_sector_df$`Year 2015`[c(-46,-47)]/as.numeric(per_sector_df[per_sector_df$`Economic Sector`== "Total", "Year 2015"])*100
per2016<-per_sector_df$`Year 2016`[c(-46,-47)]/as.numeric(per_sector_df[per_sector_df$`Economic Sector`== "Total", "Year 2016"])*100
per2017<-per_sector_df$`Year 2017`[c(-46,-47)]/as.numeric(per_sector_df[per_sector_df$`Economic Sector`== "Total", "Year 2017"])*100
per_df <-data.frame(cbind(per2014,per2015,per2016,per2017))
per_df$economic_sector<-  per_sector_df$`Economic Sector`[c(-46,-47)]

#setwd("C:\\Users\\lenovo\\Desktop\\app invesment armenia\\app inversment armenia")
