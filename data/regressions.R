PATH <- "~/Desktop/ECON388/Final/data/"
GTD_PATH <- paste0(PATH, "gtd/")
URB_PATH <- paste0(PATH, "urbanization/")
setwd(PATH)
gtd <- read.csv(paste0(GTD_PATH, "new_gtd.csv"))
wb <- read.csv(paste0(URB_PATH, "new_urban.csv"), check.names=FALSE)

#' Extracts all years of data for a given country and indicator.
#' Or can also just extract one year.
#' Example calls:
#' extract("AFG", "Urban population", "1970")
#' extract("AFG", "Urban population", 1970)
#' extract("AFG", "Urban population")
#' @param country.code An integer level in gtd$world_bank_code.
#' @param indicator.name A string.
#' @param year An integer or string.
extract <- function(country.code, indicator.name, year=NA) { 
  # level 1, empty string, No World Bank country for this GTD country
  print(country.code)
  if (country.code == 1) 
    return(NA)
  country.code = as.character(country.code)
  df = subset(subset(wb, Country.Code == country.code), Indicator.Name == indicator.name)
  if (is.na(year)) return(df)
  if (is.numeric(year)) 
    my.year = as.character(year)
  return(eval(parse(text=paste0("df$Y",year))))
}

INDICATORS <- c(
  "Urban population",
  "Urban population (% of total)",
  "Urban population growth (annual %)")

if ("data.table" %in% row.names(installed.packages())  == FALSE) install.packages("data.table") 
require("data.table")
new.gtd <- data.table(gtd, keep.rownames = TRUE)

new.gtd$urban_growth <- NA
names(new.gtd)[135]
for (row in 1:10) {
  wb_code = new.gtd[row,135]
  print(wb_code)
  year = new.gtd[row,]$iyear
  #new.gtd[row, urban_growth := extract(wb_code, INDICATORS[3], year)]
}
View(head(new.gtd)$urban_growth)


gtd['urban_growth'] <- extract(gtd$world_bank_code, INDICATORS[3], gtd$iyear)


DT <- data.table(x = 1:5, y = 6:10, z = 11:15)
DT[2, y := DT[5, y]]
DT
for (row in 1:nrow(DT)) {
  for (col in 1:ncol(DT)) {
    DT[row, y := DT[row, z]]
  }
}