# Plot SEM

source("fun_lavaan_to_diagram.R")
source("fun_save_sem_png.R")

model <- '
  Y ~ X1 + X2
'

fit <- sem(model, data = data)

save_sem_png(fit, "plot_sem.png")
