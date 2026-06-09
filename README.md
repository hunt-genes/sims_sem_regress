# SEM vs Regression Equivalence

This repository demonstrates that linear regression estimates can be replicated using Structural Equation Modeling (SEM) with only a covariance matrix.

## Key Idea

SEM does not require raw data. If you provide:
- Covariance matrix
- Means
- Sample size

You can recover regression coefficients exactly.

## Files

- `01_generate_data.R`: Simulate dataset
- `02_regression_model.R`: Fit OLS regression
- `03_covariance_sem.R`: Fit SEM using covariance matrix
- `04_compare_results.R`: Compare outputs

## Requirements

```r
install.packages("lavaan")
