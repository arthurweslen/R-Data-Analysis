dados_dir <- Sys.getenv("EXEMPLOS_R_DADOS", unset = if (dir.exists("Doc")) "Doc" else file.path("..", "Doc"))

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


# Arquivo excel
arquivo <- file.path(dados_dir, "substituir_valores.xlsx")
df <- if (file.exists(arquivo)) {
    read_xlsx(arquivo)
} else {
    # Dados fictícios para demonstrar o exercício.
    data.frame(Estado = c("SP.year:2022", "INVÁLIDO", "RJ"),
    Ticket = c("T1.year:2022", "T2", "T3"), COD_ = c("A.year:2022", "B", "C"),
    Sexo = c("Feminino.year:2022", "Masculino", "Feminino"), Idade = c("#23", "31", "26"),
    Salário = c(1700, 2400, 2100))
}
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

