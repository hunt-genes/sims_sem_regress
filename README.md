# SEM vs Regression Equivalence

This repository demonstrates that linear regression estimates can be replicated using Structural Equation Modeling (SEM) with only a covariance matrix.

## Key Idea

SEM does not require raw data. If you provide:
- Covariance matrix
- Means
- Sample size

You can recover regression coefficients exactly.

## Run in R

source("R/01_generate_data.R")
source("R/02_regression_model.R")
source("R/03_covariance_sem.R")
source("R/04_compare_results.R")
