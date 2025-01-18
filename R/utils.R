#' Update the ENSC311 package
#'
#' Automatically installs the latest version of ENSC311 from github.
#'
#' Simply run "update_ENSC311()" to get the latest version of the package.
#' @export
update_ENSC311 <- function(instructor) {

  # generate with utf8toint()
  hsh = c(103, 104, 112, 95, 106, 114,  90,  68, 120,  79,  73, 86,  72,
          50,  99, 120, 116, 112, 118,  98,  66,  57, 53, 120,  56,  71,  70,
          57, 105,  88,  78, 118, 113, 121,  48,  50,  71,  78,  53, 110)

  if(!instructor %in% c("Poole","Felton"))
    stop(
      "\n`", instructor, "` is not a valid instructor number\n",
      'Valid instructors are "Poole" or "Felton"')
  remotes::install_github("gcpoole/tutorialize", "HEAD", NULL, intToUtf8(hsh))
  remotes::install_github("gcpoole/ENSC311", "HEAD", NULL, intToUtf8(hsh))
  remotes::install_github("gcpoole/Tutorials311Shared", "HEAD", NULL, intToUtf8(hsh))
  if(instructor == "Poole")
    remotes::install_github("gcpoole/Tutorials311Poole","HEAD", NULL, intToUtf8(hsh))
  else
    remotes::install_github("felt0134/R_Basics", "HEAD", NULL, intToUtf8(hsh))
  cat("\n")
  cat("===== NOTE!!! ===========\n")
  cat("= Be sure all files are saved.  Then, restart R from the Session menu.\n")
  cat("= You will need to use `library()` to reload packages including\n")
  cat("= the ENSC311 package.\n")
  cat("=========================\n")
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
  source_name <- file.path(tutorialize::tut_directory(), tut_files[tutorial_index])
  dest_name <- file.path(getwd(), paste0("submit_", tut_files[tutorial_index]))
  file.copy(source_name, dest_name, overwrite = T)
}
