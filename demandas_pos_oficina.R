# Código para as demandas pós I Oficina CCD Estratégia Mata Atlântica
# Vinicius Tonetti - vrtonetti@ufscar.br

# Cleaning directory
rm(list = ls())

# R messages in English
Sys.setenv(LANG = "en_US.UTF-8")

# pacotes
library(wordcloud)
library(tm)

# Word Cloud com os termos das demandas mais sugeridas.

# "Números e estatísticas" - 1
# "Modelos espaciais" - 0
# "Mudanças climpáticas: riscos e adaptações" - 3
# "Mercado de biodiversidade" - 3
# "Modelos econômicos" - 3
# "Priorização de áreas" - 0 

# Criando objeto com os termos usados nos fluxos de trabalho (FT):

FT <- c(rep("Números e estatísticas", 1), rep("Mudanças climáticas: riscos e adaptações", 3),
        rep("Mercado de biodiversidade", 3), rep("Modelos econômicos",3))

wordcloud(words = FT)
