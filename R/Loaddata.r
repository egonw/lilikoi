Loaddata <- function(filename) {
  #' A Loaddata Function
  #'
  #' This function allows you to load your metabolomics data.
  #' @param Your file name.
  #' @keywords Load
  #' @export
  #' @examples Loaddata("data_format.csv")
  #' Loaddata()

  Metadata <<- read.csv(file = filename, check.names = F, row.names = 1)
  dataSet <- list()
  dataSet$cmpd <- (colnames(Metadata)[-1])
  return(dataSet)
}
