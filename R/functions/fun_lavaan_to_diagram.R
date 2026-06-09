library(lavaan)
library(DiagrammeR)

lavaan_to_diagram <- function(fit) {
  
  # Extract parameter estimates
  params <- parameterEstimates(fit, standardized = TRUE)
  
  # Keep only relevant relations
  regressions <- params[params$op == "~", ]
  covariances <- params[params$op == "~~" & params$lhs != params$rhs, ]
  variances   <- params[params$op == "~~" & params$lhs == params$rhs, ]
  
  # Get all variable names
  vars <- unique(c(params$lhs, params$rhs))
  
  # Create node strings
  node_str <- paste0(
    vars,
    " [shape = box, style = filled, fillcolor = lightblue]"
  )
  
  # Regression edges
  reg_edges <- apply(regressions, 1, function(row) {
    paste0(
      row["rhs"], " -> ", row["lhs"],
      " [label = '", round(as.numeric(row["est"]), 2), "']"
    )
  })
  
  # Covariance edges (double arrows)
  cov_edges <- apply(covariances, 1, function(row) {
    paste0(
      row["lhs"], " -> ", row["rhs"],
      " [dir = both, label = '", round(as.numeric(row["est"]), 2), "']"
    )
  })
  
  # Residual variance nodes
  var_nodes <- paste0(
    "e_", variances$lhs,
    " [shape = circle, label = 'e']"
  )
  
  var_edges <- apply(variances, 1, function(row) {
    paste0(
      "e_", row["lhs"], " -> ", row["lhs"],
      " [label = '", round(as.numeric(row["est"]), 2), "']"
    )
  })
  
  # Combine everything
  diagram <- paste0(
    "digraph SEM {",
    "\n graph [layout = dot, rankdir = TB]\n",
    "\n node [fontname = Helvetica]\n",
    
    "\n # Nodes\n",
    paste(node_str, collapse = "\n"),
    "\n",
    
    "\n # Residual nodes\n",
    paste(var_nodes, collapse = "\n"),
    "\n",
    
    "\n # Regression paths\n",
    paste(reg_edges, collapse = "\n"),
    "\n",
    
    "\n # Covariances\n",
    paste(cov_edges, collapse = "\n"),
    "\n",
    
    "\n # Variances\n",
    paste(var_edges, collapse = "\n"),
    "\n"
  )
  
  diagram <- paste0(diagram, "}")
  
  return(grViz(diagram))
}
