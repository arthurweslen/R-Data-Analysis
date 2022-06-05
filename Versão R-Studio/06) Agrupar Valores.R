##################################
###      AGRUPAR VALORES       ###
##################################

# BAIXAR PACOTES, CASO ELES AINDA NÃO ESTEJAM BAIXADOS
if(!require(dplyr)) install.packages("dplyr") 
if(!require(readxl)) install.packages("readxl") 
if(!require(stringr)) install.packages("stringr")

# CARREGAR PACOTES
library(dplyr)
library(readxl)
library(stringr)


# BUSCAR DIRETÓRIO (PASTA COM OS ARQUIVOS)
setwd("F:/Documentos/R/UDEMY")

# Arquivo excel
df <- read_xlsx("país_continente.xlsx")
View(df)


# Contar Linhas
count(df, País)
count(df,Capital)
count(df,Continente)

distinct(df,Continente)

df_agrupado <-
  df %>% 
  group_by(Continente) %>% 
  distinct(País) %>% 
  count()




