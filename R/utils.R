#' Update the ENSC311 package
#'
#' Automatically installs the latest version of ENSC311 from github.
#'
#' Simply run "update_ENSC311()" to get the latest version of the package.
#' @export
update_ENSC311 <- function() {
  remotes::install_github("gcpoole/ENSC311")
  remotes::install_github("gcpoole/tutorialize")
  cat("Be sure all files are saved and Restart R from the Session menu.\\n")
  cat("You will need to use `library()` to reload any packages including.\\n")
  cat("the ENSC311 pacakge.\\n")
  invisible(TRUE)
}

#' Create a homework submission file for ENSC311 tutorials
#'
#' Creates a homework submission file in your working directory.
#'
#' To use this function, first run the function without passing arguments.
#' Examine the resulting list of files that can be created and determine the
#' index of the file you want to create. and then run the function again,
#' passing the index number of the file to be created.
#'
#' You can determine your working directory (where the file is created) with
#' \code{\link{getwd}}.
#'
#' @return Either a vector of available homework submission files or TRUE if the
#'   homework submission file was created in your working directory correctly.
#'
#' @param tutorial_index An index indicating which homework submission file to
#'   retrieve.  If NULL, the vector of available homework submission files is
#'   returned.
#' @export
submit_ENSC311 <- function(tutorial_index = NULL) {
  tut_files <- dir(tutorialize::tut_directory())
  if(is.null(tutorial_index)) return(structure(tut_files, names = as.character(1:length(tut_files))))
  tutorial_index <- as.integer(tutorial_index)
  if(tutorial_index < 1 || tutorial_index > length(tut_files)) stop("tutorial_index is out of range")
  source_name <- file.path(tut_directory(), tut_files[tutorial_index])
  dest_name <- file.path(getwd(), paste0("submit_", tut_files[tutorial_index]))
  file.copy(source_name, dest_name, overwrite = T)
}

submitToTA = function(x) {
  learnr::correct()
}
