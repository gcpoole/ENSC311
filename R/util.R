#' Update the ENSC311 package
#'
#' Automatically installs the latest version of ENSC311 from github.
#'
#' Simply run "update_ENSC311()" to get the latest version of the package.
#' @export
update_ENSC311 <- function() {
  remotes::install_github("gcpoole/ENSC311")
  detach("package:ENSC311", unload = TRUE)
  library(ENSC311)
}

#' Get submission file for ENSC311 tutorials
#'
#' @param tutorial_name A character string of length 1 containing the name of the tutorial.
submit_ENSC311 <- function(tutorial_name) {
  recordFile <- file.path(path.package("ENSC311"), "TutorialData.RData")
}
