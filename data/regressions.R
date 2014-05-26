PATH <- "~/Desktop/ECON388/Final/data/"
GTD_PATH <- paste0(PATH, "gtd/")
URB_PATH <- paste0(PATH, "urbanization/")
setwd(PATH)
list.files()

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
  #print(country.code)
  if (country.code == 1) 
    return(NA)
  country.code = as.character(country.code)
  df = subset(subset(wb, Country.Code == country.code), Indicator.Name == indicator.name)
  if (is.na(year)) return(df)
  if (is.numeric(year)) 
    my.year = as.character(year)
  return(eval(parse(text=paste0("df$Y",year))))
}

INDICATORS <- c("Urban population","Urban population (% of total)","Urban population growth (annual %)")


#' ATTEMPTING TO PUT WORLD BANK COLUMN IN GTD USING data.table
#if ("data.table" %in% row.names(installed.packages())  == FALSE) install.packages("data.table") 
#require("data.table")
#new.gtd <- data.table(gtd, keep.rownames = TRUE)
#new.gtd$urban_growth <- NA
#names(new.gtd)[135]
#for (row in 1:10) {
#  wb_code = new.gtd[row,135]
#  print(wb_code)
#  year = new.gtd[row,]$iyear
#  new.gtd[row, urban_growth := extract(wb_code, INDICATORS[3], year)]
#}
#View(head(new.gtd)$urban_growth)


#' ATTEMPTING TO PUT WORLD BANK COLUMN IN GTD
#gtd['urban_growth'] <- extract(gtd$world_bank_code, INDICATORS[3], gtd$iyear)
#gtd$urban_growth <- NA






start <- Sys.time()
for (row in 50850:nrow(gtd)) {
  
  # checkpoint every 1000 rows in case of bomb out
  if (row %% 1000 == 0) {
    write.csv(gtd, file=paste0(GTD_PATH, "gtd1.csv"), row.names=FALSE)
  }
  
  # year is col 2
  year = gtd[row,2]
  
  # world_bank_code is col 134
  country.code = gtd[row,134]
  
  if (country.code == "") {
    gtd[row,135] <- NA
    print(paste("Row:", row, "Code:", country.code, "Year:", year, "Value: NA"))
    next
  }
  
  # urban_growth is col 135
  value <- extract(country.code, INDICATORS[3], year)
  print(paste("Row:", row, "Code:", country.code, "Year:", year, "Value:", value))
  gtd[row,135] <- value
  
}
end <- Sys.time()
write.csv(gtd, file=paste0(GTD_PATH, "gtd1.csv"), row.names=FALSE)





#df = read.csv(paste0(GTD_PATH, "gtd1.csv"), check.names=FALSE)
#names(df)
#View(df$world_bank_code)
#View(df$urban_growth)

#x = extract("AFG", "Urban population", 1970)
#gtd[which(gtd$iyear == 1970)]$urban_growth <- 1970
