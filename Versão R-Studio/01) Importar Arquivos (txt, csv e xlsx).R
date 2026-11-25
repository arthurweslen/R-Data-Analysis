dados_dir <- Sys.getenv("EXEMPLOS_R_DADOS", unset = if (dir.exists("Doc")) "Doc" else file.path("..", "Doc"))

#######################################
###       IMPORTANDO ARQUIVOS       ###
#######################################


############# 
#Arquivo TXT
df_texto <- read.table(file.path(dados_dir, "importacao_texto.txt"))
View(df_texto)


#############
#Arquivo CSV
df_csv <- read.csv(file.path(dados_dir, "importacao.csv"), sep=",", header=TRUE)
C(df_csv)

#ALGUNS ARGUMENTOS CSV
# encoding = "latin-1" ou encoding = "UTF-8"
# sep=";" ou sep="|"
#header=FALSE

#############
#Arquivo Excel
install.packages("readxl")
library(readxl)

df_excel <- read_xlsx(file.path(dados_dir, "importacao_excel.xlsx"))
View(df_excel)

#ALGUNS ARGUMENTOS EXCEL
#sheet = "nome da aba"