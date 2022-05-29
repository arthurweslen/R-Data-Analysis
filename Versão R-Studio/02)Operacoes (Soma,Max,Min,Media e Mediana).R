#==============================
#     OPERAÇÃO MATEMÁTICA
#==============================

##### cRIANDO UMA TABELA ####

mes_nome <- c("janeiro","fevereiro","março","abril","maio","junho","julho",
              "agosto","setembro","outubro","novembro","dezembro")
ano <- c(2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021)
venda <- c(1250,2000,1350,2412,3500,1633,4712,1855,1900,1450,2211,3612)


##### VISUALIZANDO A TABELA ####
df <- data.frame(mes_nome,ano,venda)
View(df)

##### RESUMO DAS TABELAS #####
summary(df)

soma <- sum(venda)
frase_soma <- c('Soma da coluna venda é de:',soma)
frase_soma

maximo <- max(venda)
frase_maximo <- c('Maior valor da coluna venda é de:',maximo)
frase_maximo

minimo <- min(venda)
frase_minimo <- c('Menor valor da coluna venda é de:',minimo)
frase_minimo

media <- mean(venda)
frase_media <- c('Media da coluna venda é de:',media)
frase_media

mediana <- median(venda)
frase_mediana <- c('Mediana da coluna venda é de:',mediana)
frase_mediana

