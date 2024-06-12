library(MASS)
install.packages("ISLR2")
library(ISLR2)

# Simple Linear Regression

head(Boston)

# the lm() function to fit a simple linear regression model, with medv as the response and lstat as the predictor. The basic lm()
# syntax is lm(y ~ x, data), where y is the response, x is the predictor, and
# data is the data set in which these two variables are kept

lm.fit <- lm(medv ~ lstat, data = Boston)
attach(Boston)
lm.fit <- lm(medv ~ lstat)
summary(lm.fit)

names(lm.fit)  # Nos da el nombre de todas las funciones de lm.fit

coef(lm.fit) # Nos devuelve los coeficientes

confint(lm.fit) # Nos devuelve el intervalo de cofienza de los coeficientes

predict(lm.fit, data.frame(lstat = (c(5, 10, 15))), interval = "confidence") 

predict(lm.fit, data.frame(lstat = (c(5, 10, 15))), interval = "prediction") 




plot(lstat, medv)
abline(lm.fit)
abline(lm.fit , lwd = 3, col = "red")


par(mfrov = c(2,2))
plot(lm.fit)


plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))


# Leverage statistics can be computed
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

