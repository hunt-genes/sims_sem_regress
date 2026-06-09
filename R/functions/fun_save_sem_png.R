install.packages("webshot2")
library(webshot2)

save_sem_png <- function(fit, filename = "sem_plot.png") {
  library(webshot2)
  library(htmlwidgets)
  
  g <- lavaan_to_diagram(fit)
  
  temp_html <- tempfile(fileext = ".html")
  
  saveWidget(g, temp_html, selfcontained = TRUE)
  webshot(temp_html, filename, zoom = 2)
  
  message("Saved to: ", filename)
}


