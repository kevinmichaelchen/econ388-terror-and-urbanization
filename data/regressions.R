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
#' @param country.code A string. Use grep(country.code, gtd$world_bank_code)
#' to see if the string appears in the levels. If Blank string "" is level 1.
#' @param indicator.name A string.
#' @param year An integer or string.
extract <- function(country.code, indicator.name, year=NA) { 
  # No World Bank country for this GTD country
  if (country.code == "") 
    return(NA)
  # country.code is not found
  #  else if (length(grep(country.code, levels(gtd$world_bank_code))) == 0)
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

View(extract("AFG", INDICATORS[1]))


gtd$urban_growth <- NA
gtd['urban_growth'] <- extract(gtd$world_bank_code, INDICATORS[3], gtd$iyear)
