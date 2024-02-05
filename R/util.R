update_ENSC311 <- function() {
  remotes::install_github("gcpoole/ENSC311")
  detach("package:ENSC311", unload = TRUE)
  library(ENSC311)
}

submit_ENSC311 <- function() {

}
