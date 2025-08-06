library(RSelenium)
library(tidyverse)

lista <- readxl::read_excel("lista de relatórios.xlsx")

View(str_c(lista$`Nº`, collapse = "|"))