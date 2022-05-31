##################################
###   CRIAR/EXCLUIR COLUNAS    ###
##################################

# BAIXAR PACOTES, CASO ELES AINDA N?O ESTEJAM BAIXADOS
if(!require(dplyr)) install.packages("dplyr") 
if(!require(readxl)) install.packages("readxl")

# CARREGAR PACOTES
library(dplyr)
library(readxl)

# BUSCAR DIRET?RIO (PASTA COM OS ARQUIVOS)
setwd("F:/Documentos/R/UDEMY")


df <- read_xlsx("Numeros.xlsx")
View(df)

# Criar coluna Soma
df["Soma"] = df$`Numeros Pares` + df$`Numeros Ímpares`
View(df)

#Criar coluna Multiplicação
df["Multiplicação"] = df$`Numeros Pares` * df$`Numeros Ímpares`
View(df)

#Criar Coluna Texto
df["Texto"] = "Texto"
df["Texto1"] = "Texto1"
df["Texto2"] = "Texto2"
df["Texto3"] = "Texto4"
df["Texto5"] = "Texto5"
df["Texto6"] = "Texto6"
View(df)

# Excluir Coluna
df <- select(df,-c(10))
View(df)

# Excluir várias colunas pelo nome
df <- subset(df, select = -c(Texto5, Texto3))
View(df)

#Excluir mais de uma coluna por número

#1º Forma (escolher colunas)
df <- select(df, -c(6,7))
View(df)

#2º Forma (coluna inicial até coluna final)
df <- select(df, -c(8:10))
View(df)


# EXCLUIR UMA LINHA (POR NúMERO)
df <- slice(df, -c(2))
View(df)

df <- slice(df, -c(3:5))
View(df)

#EXCLUIR VÁRIAS LINHAS (POR NOME)
df <- df %>% filter(Tipo!="c")
View(df)
