
library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")

library(dplyr)

Per.Span <-  DataDB %>% filter(Language == "Spanish")

Per.Span <- as.data.frame(Per.Span)

library(ggplot2)

Per.Span %>% ggplot(aes( x = Percentage, y = CountryCode, fill = IsOfficial)) +
  geom_bin2d() +
  coord_flip()





