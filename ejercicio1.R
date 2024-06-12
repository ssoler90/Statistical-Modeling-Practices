rm(list = ls())

install.packages("lawstat")

library(car)
library(lawstat)

datos = read.table('senn_32.txt', header = T)
attach(datos)

pef <- datos$pef

d_AB <- c() # diferencias (divididas entre dos) en la secuencia AB
d_BA <- c() # diferencias (divididas entre dos) en la secuencia BA
label <- c() # etiquetas de las dos secuencias, 1 es AB y 2 es BA


# rellenamos los vectores d_AB, d_BA y label según los datos
for (i in seq(2, length(pef), by = 2)){
  if ( grupo[i] == 1){
    d_AB <- c(d_AB, (pef[i] - pef[i-1])/2)
  } else {
    d_BA <- c(d_BA, (pef[i] - pef[i-1])/2)
  }
  
  label <- c(label,  grupo[i])
}



D <- c(d_AB, d_BA) # juntamos los dos vectores diferencias en un mismo vector

length(grupo)

shapiro.test(d_AB) # estudio de la normalidad de d_AB con el test de shapiro
shapiro.test(d_BA) # estudio de la normalidad de d_BA con el test de shapiro


# estudio de la homocedasticidad entre d_AB y d_BA
resultado_levene <- levene.test(D, label, location = "mean")
print(resultado_levene)

# prueba t-student
t.test(d_AB, d_BA, var.equal=TRUE)
