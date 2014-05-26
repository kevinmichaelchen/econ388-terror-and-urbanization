#' This script prettifies the year columns in the World Bank dataset.

#options(echo = TRUE)
args <- commandArgs(trailingOnly = TRUE)
print(args)

ORIGINAL_URBAN_DATA_PATH <- args[1]
URB_PATH <- args[2]

wb <- read.csv(ORIGINAL_URBAN_DATA_PATH, check.names=FALSE)


#' Used for copying the World Bank dataset to a new csv file
#' don't add a row.names/numbers column
#' don't check.names, don't prepend 'X' to all headers
update <- function() {
  path = paste0(URB_PATH, "/new_urban.csv")
  write.csv(wb, file=path, row.names=FALSE)
  #View(read.csv(path, check.names=FALSE))
}

#' Rename world bank columns
renameYears <- function() {
  def = c("Country.Name", "Country.Code", "Indicator.Name", "Indicator.Code")
  years = rep(0, 2012-1970+1)
  for (i in 1970:2012) {
    years[i - 1970 + 1] = paste0("Y", as.character(i))
  }
  cols = c(def, years)
  names(wb) <<- cols
  update()  
}

#' Only call this function if
#renameYears()

