library(lavaan)

data <- read.csv("data/simulated_data.csv")

lm_fit <- lm(Y ~ X1 + X2, data = data)

S <- cov(data)
means <- colMeans(data)
N <- nrow(data)

model <- 'Y ~ X1 + X2'

sem_fit <- sem(model,
               sample.cov = S,
               sample.mean = means,
               sample.nobs = N)

cat("
--- Regression Coefficients ---
")
print(coef(lm_fit))

cat("
--- SEM Coefficients ---
")
print(coef(sem_fit))
