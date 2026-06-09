set.seed(123)

N <- 500

X1 <- rnorm(N)
X2 <- rnorm(N)
Y <- 0.5 * X1 + 0.3 * X2 + rnorm(N)

data <- data.frame(X1, X2, Y)

write.csv(data, "data/simulated_data.csv", row.names = FALSE)
