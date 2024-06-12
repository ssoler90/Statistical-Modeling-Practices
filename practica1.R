rm(list = ls())

install.packages("lattice")
install.packages("daewr")
install.packages("car")

library(daewr)
library(car)

datos = read.table('senn_32.txt', header = T)
attach(datos)

sapply(datos , class)

grupof <- as.factor(grupo)
sujetof <- as.factor(sujeto)
periodof <- as.factor(periodo)
tratf <- as.factor(trat)

options(contrasts = c(factor ="contr.treatment" , ordered ="contr.poly"))

summary(lm(pef ~ tratf ))