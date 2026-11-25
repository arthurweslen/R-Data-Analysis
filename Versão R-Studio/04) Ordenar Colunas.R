dados_dir <- Sys.getenv("EXEMPLOS_R_DADOS", unset = if (dir.exists("Doc")) "Doc" else file.path("..", "Doc"))

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

# Arquivo excel
arquivo <- file.path(dados_dir, "ordenar.xlsx")
df <- if (file.exists(arquivo)) {
    read_xlsx(arquivo)
} else {
    # Dados fictícios para demonstrar o exercício.
    data.frame(Nome = c("Bruna", "Ana", "Ana", "Carlos"), Idade = c(27, 31, 23, 35))
}
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
