data <- read.csv("data/simulated_data.csv")

lm_fit <- lm(Y ~ X1 + X2, data = data)

sink("output/regression_results.txt")
print(summary(lm_fit))
sink()
