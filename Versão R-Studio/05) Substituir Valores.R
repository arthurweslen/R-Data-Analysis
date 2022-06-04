##################################
###     SUBSTITUIR VALORES     ###
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
df <- read_xlsx("substituir_valores.xlsx")
View(df)


#Substituir um valor que está presente em toda tabela
df[df == "INVÁLIDO"] <- NA
View(df)

#Substituir uma palavra que está presente em toda tabela


df$Estado <-gsub(".year:2022", "", df$Estado)
df$Ticket <-gsub(".year:2022", "",df$Ticket)
df$COD_ <-gsub(".year:2022", "",df$COD_)
df$Sexo <- gsub(".year:2022", "",df$Sexo)
df$Sexo <- gsub("Feminino", "F",df$Sexo)
df$Sexo <- gsub("Masculino","M",df$Sexo)
df$Idade <- gsub("#","",df$Idade)


#Substituir com Condicional

df$Salário[df$Salário <=1900] <- 1910
  
View(df)

