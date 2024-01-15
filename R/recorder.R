#' @export
recorder <- function(tutorial_id, tutorial_version, user_id, event, data) {
  if(!grepl("^section", event)) {
    recordFile = file.path(getwd(), "TutorialData.RData")
    new_data <-
      structure(
        list(
          list(
            timestamp = Sys.time(),
            tutorial = tutorial_id,
            versiong = tutorial_version,
            user = user_id,
            event = event,
            data = data)),
        names = event)

    if(file.exists(recordFile)) {
      load(recordFile)
      tutorial_data <- c(tutorial_data, new_data)
    } else
      tutorial_data <- new_data
    save(tutorial_data, file = recordFile)
  }
}
