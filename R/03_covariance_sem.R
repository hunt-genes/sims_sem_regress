library(lavaan)

data <- read.csv("data/simulated_data.csv")

S <- cov(data)
means <- colMeans(data)
N <- nrow(data)

model <- '
  Y ~ X1 + X2
'

fit <- sem(model,
           sample.cov = S,
           sample.mean = means,
           sample.nobs = N)

sink("output/sem_results.txt")
print(summary(fit))
sink()
