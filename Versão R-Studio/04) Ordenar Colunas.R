##################################
###       ORDENAR COLUNAS      ###
##################################

# BAIXAR PACOTES, CASO ELES AINDA N?O ESTEJAM BAIXADOS
if(!require(dplyr)) install.packages("dplyr") 
if(!require(readxl)) install.packages("readxl") 

# CARREGAR PACOTES
library(dplyr)
library(readxl)

# BUSCAR DIRETÓRIO (PASTA COM OS ARQUIVOS)
setwd("F:/Documentos/R/UDEMY")

# Arquivo excel
df <- read_xlsx("ordenar.xlsx")
View(df)

#Ordenar uma coluna ascendente
df_asc <- arrange(df, Nome)
View(df_asc)

#Ordenar uma coluna descendente
df_desc <- arrange(df, desc(Nome))
View(df_desc)

#Odernar mais de uma coluna
df_ordenada <- arrange(df, Nome, desc(Idade))
View(df_ordenada)
