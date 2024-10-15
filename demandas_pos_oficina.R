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

# word cloud
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


# WordClud demandas ---------------------------------------------------

words <- c("déficit de vegetação nativa,Código Florestal ,Lei da MA,alta resolução,banco de dados,restauração ecológica,aspectos socioeconômicos,benefícios,SAF,benefícios,disponibilidade hídrica,desenvolvimento da floresta,agricultura,produtividade,áreas vulneráveis,UC,áreas de amortecimento,grandes números,restauração ecológica,PACTO,restauração ecológica,serviços ecossistêmicos,água,energia elétrica,resiliência climática,resiliência climática,produtividade,modelagem,vegetação secundária,PSA,áreas prioritárias,restauração ecológica,produtividade,SAF,silvicultura,degradação,Mata Atlântica,Amazônia,degradação,Mata Atlântica,degradação,restauração ecológica,cobertura florestal,Mata Atlântica,degradação,espécies arbóreas,ameaça,resiliência,UC,resiliência climática,divulgação,conceitos,literatura científica,PSA,pólos florestais,viabilidade econômica,territórios,atores engajados,produtividade,demanda,PSA,benefícios,restauração ecológica,viabilidade econômica,Finaclima,setor público,mapeamento,benefícios,restauração ecológica,território,incentivo,PSA,produtividade,incentivos,viabilidade econômica,restauração ecológica,produtividade,Mata Atlãntica,modelagem,PSA,produtividade,viabilidade econômica,produtividade,restauração ecológica,indígenas,povos tradicionais,produtividade,resolução,escala,variáveis mais finas,restauração ecológica,paisagem")

quoted_words <- words %>%
  str_split(pattern = ",") %>%
  unlist()

# word cloud demandas ----------------------------------------------------------

term_frequencies <- quoted_words %>%
  table() %>%
  as.data.frame()

colnames(term_frequencies) <- c("termo","freq")

# word cloud
set.seed(1234) # For reproducibility
WC <- wordcloud(words = term_frequencies$termo, freq = term_frequencies$freq, min.freq = 1,
          max.words = 100, random.order = FALSE, rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"), scale=c(2, .5))


setwd("D:/_Vinicius/pos doc/_estrategia_Mata_Atlantica/Oficina de coprodução/reuniao_pos")
dev.copy(jpeg,"WC.jpeg", width = 29, height = 18, un = "cm", res = 300)
dev.off()

################################################################################


