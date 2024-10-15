# Código para as demandas pós I Oficina CCD Estratégia Mata Atlântica
# Vinicius Tonetti - vrtonetti@ufscar.br

# Cleaning directory
rm(list = ls())

# R messages in English
Sys.setenv(LANG = "en_US.UTF-8")

# pacotes
library(tidyverse)
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

# Converter para tibble
termos <- tibble(term = FT)

# frequência dos termos
freq_termos <- termos %>%
  count(term, sort = TRUE)

# Create the word cloud
set.seed(1234) # For reproducibility
wordcloud(words = freq_termos$term, freq = freq_termos$n, min.freq = 1,
          max.words = 100, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"), scale=c(1.1, .5))


# BarGraph -----------------------------------------------------------

# "Modelos espaciais" - 0
# "Priorização de áreas" - 0 


freq_termos <- data.frame(freq_termos)

#freq_termos[5,1] <- "Modelos espaciais"
#freq_termos[6,1] <- "Priorização de áreas"
#freq_termos[5,2] <- 0
#freq_termos[6,2] <- 0

ggplot(freq_termos, aes(x = term, y = n)) +
  geom_bar(stat = "identity", fill = "gray70") +
  labs(title = "Frequência de termos", x = "Fluxo de trabalho", y = "Frequência") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 12))



