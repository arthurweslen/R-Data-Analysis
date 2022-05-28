#######################################
###       IMPORTANDO ARQUIVOS       ###
#######################################


############# 
#Arquivo TXT
df_texto <- read.table("importacao_texto.txt")
View(df_texto)


#############
#Arquivo CSV
df_csv <- read.csv("importacao.csv", sep=",", header=TRUE)
C(df_csv)

#ALGUNS ARGUMENTOS CSV
# encoding = "latin-1" ou encoding = "UTF-8"
# sep=";" ou sep="|"
#header=FALSE

#############
#Arquivo Excel
install.packages("readxl")
library(readxl)

df_excel <- read_xlsx("importacao_excel.xlsx")
View(df_excel)

#ALGUNS ARGUMENTOS EXCEL
#sheet = "nome da aba"