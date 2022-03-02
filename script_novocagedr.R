
#################################################################

### AUTOR: Aldryn Dylan 
### E-MAIL: aldryn.quispe@edu.fecap.br // aldryn.dylan@yahoo.com
### LINKEDIN: https://www.linkedin.com/in/aldryn-dylan/

#################################################################

#Analisando dados do Novo Caged (MT/PDET)

###Pacotes utilizados

library(tidyverse)
library(openxlsx)


### IMPORTANDO DADOS ###

cagedajust_bruto <- openxlsx::read.xlsx(xlsxFile = "novocaged202112.xlsx", 
                                        sheet = 14, 
                                        startRow = c(5), 
                                        colNames = TRUE, 
                                        na.strings = "---", 
                                        fillMergedCells = TRUE)

colnames(cagedajust_bruto) <- paste0(names(cagedajust_bruto), cagedajust_bruto[1, ]) #concatenando col name com a primeira linha
cagedajust_bruto[,4:101] <- lapply(cagedajust_bruto[,4:101], as.numeric) #convertendo para formato numerico.
cagedajust_bruto <- cagedajust_bruto[-1,] #excluindo a primeira linha do df.
cagedajust_bruto <- dplyr::select(cagedajust_bruto, -contains(c("Variação Relativa (%)", "Acumulado.no.Ano")))



