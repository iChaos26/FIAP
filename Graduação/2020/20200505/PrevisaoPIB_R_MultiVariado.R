# Fontes de dados
# PIB: https://www.itau.com.br/itaubba-pt/analises-economicas/nossas-series-economicas/pib-mensal-itau-unibanco
# Tr??fego: www.abcr.org.br
# install.packages("e1071")
# Obs: voc?? pode utilizar rstudio.cloud para executar
library(e1071)

pib <- read.csv("https://raw.githubusercontent.com/diogenesjusto/FIAP/master/Gradua%C3%A7%C3%A3o/2020/20200505/PIB.csv", sep=";", dec=",")

# An??lise explorat??ria - comportamento PIB 12 anos
plot(pib$PIB, type="l")
# An??lise de correla????o entre PIB e Tr??fego Brasil
plot(pib$PIB ~ pib$BRT)

# Separa????o de bases de treino e teste
treino <- pib[1:112,]
teste  <- pib[113:124,]

# Modelo (algoritmo)
#mod1 <- lm(PIB~BRT, data=treino)
#mod1 <- lm(PIB~BRL+BRP, data=treino)
#mod1 <- lm(PIB~BRL+poly(BRP,2), data=treino)
#mod1 <- lm(PIB~log(BRL)+(BRP), data=treino)
#mod1 <- lm(PIB~(BRL)+log(BRP), data=treino)
#mod1 <- lm(PIB~log(BRL)+log(BRP), data=treino)
mod1 <- lm(PIB~PIB1BRL)+log(BRP), data=treino)
prev <- predict(mod1, newdata=teste)
erro <- mean(abs(teste$PIB - prev))
# Erro absoluto m??dio
erro
# Erro percentual m??dio
erro/mean(teste$PIB)

