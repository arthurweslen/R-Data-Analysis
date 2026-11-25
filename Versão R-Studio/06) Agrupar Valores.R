dados_dir <- Sys.getenv("EXEMPLOS_R_DADOS", unset = if (dir.exists("Doc")) "Doc" else file.path("..", "Doc"))

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

# Arquivo excel
arquivo <- file.path(dados_dir, "país_continente.xlsx")
df <- if (file.exists(arquivo)) {
    read_xlsx(arquivo)
} else {
    # Dados fictícios para demonstrar o exercício.
    data.frame(País = c("Brasil", "Argentina", "Portugal", "Portugal"),
    Capital = c("Brasília", "Buenos Aires", "Lisboa", "Lisboa"),
    Continente = c("América do Sul", "América do Sul", "Europa", "Europa"))
}
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




