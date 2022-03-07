
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

cagedbruto_ajust <- openxlsx::read.xlsx(xlsxFile = "novocaged202112.xlsx", 
                                        sheet = 14, 
                                        startRow = c(5), 
                                        colNames = TRUE, 
                                        na.strings = "---", 
                                        fillMergedCells = TRUE)

colnames(cagedbruto_ajust) <- paste0(names(cagedbruto_ajust), cagedbruto_ajust[1, ]) #concatenando col name com a primeira linha
cagedbruto_ajust <- cagedbruto_ajust[-1,] #excluindo a primeira linha do df.
cagedbruto_ajust <- dplyr::select(cagedbruto_ajust, -contains(c("Variação Relativa (%)", "Acumulado.no.Ano"))) #retirando colunas
cagedbruto_ajust[,4:101] <- lapply(cagedbruto_ajust[,4:101], as.numeric) #convertendo para formato numerico.

# Renomeando variáveis-texto
cagedbruto_ajust <- cagedbruto_ajust %>%
        dplyr::rename(UF = starts_with("UF"),
                      Codigo = starts_with("Código"),
                      Municipio = starts_with("Município")
                      )



##### Selecionando os dados de saldo do Novo Caged

cagedsaldo_ajust <- cagedbruto_ajust %>% 
        dplyr::select(c(UF:Municipio, contains("Saldos"))) %>% 
        pivot_longer(
                cols = -c(UF:Municipio),
                names_to = "Periodo",
                values_to = "Saldo"
        )




