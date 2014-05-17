PATH <- "~/Desktop/ECON388/Final/data/"
setwd(PATH)
list.files()

gtd <- read.csv(paste0(PATH, "gtd/gtd.csv"))
wb <- read.csv(paste0(PATH, "urbanization/urbanization.csv"))

# Rename world bank columns
def = c("Country.Name", "Country.Code", "Indicator.Name", "Indicator.Code")
years = rep(0, 2012-1970+1)
for (i in 1970:2012) {
  years[i - 1970 + 1] = i
}
cols = c(def, years)
names(wb) <- cols



#' For testing, to see what bits of gtd.only
#' are found in wb.only
#' grep each gtd.only in wb.only
#for (i in 1:length(gtd.only)) {
#  s = gtd.only[i]
#  found = grep(s, wb.only)
#  if (length(found) == 0) 
#    next
#  print(paste0(s, " ... ", wb.only[found]))
#}



#' Renames a level in the "Country.Name" factor 
#' in the World Bank data, in order to match
#' the country names in the GTD dataset.
#' Uses <<- to assign to the World Bank dataset's levels
#' from inside this function.
#' @param from Our factor level's current string value.
#' @param to Our factor level's new string value.
renameLevel <- function(from, to) {if (length(levels(wb$Country.Name)[levels(wb$Country.Name)==from]) != 0) levels(wb$Country.Name)[levels(wb$Country.Name)==from] <<- to}


renameLevel("Venezuela, RB", "Venezuela")
renameLevel("Egypt, Arab Rep.", "Egypt")
renameLevel("Iran, Islamic Rep.", "Iran")
renameLevel("Syrian Arab Republic", "Syria")
renameLevel("Bahamas, The", "Bahamas")
renameLevel("Hong Kong SAR, China", "Hong Kong")
renameLevel("Yemen, Rep.", "Yemen")
renameLevel("Russian Federation", "Russia")
renameLevel("Brunei Darussalam", "Brunei")
renameLevel("Macedonia, FYR", "Macedonia")
renameLevel("Gambia, The", "Gambia")
renameLevel("Korea, Dem. Rep.", "North Korea")
renameLevel("Korea, Rep.", "South Korea")
renameLevel("Congo, Dem. Rep.", "Congo (Kinshasa)")
renameLevel("Congo, Rep.", "Congo (Brazzaville)")
renameLevel("Bosnia and Herzegovina", "Bosnia-Herzegovina")
renameLevel("West Bank and Gaza", "West Bank and Gaza Strip")
renameLevel("Macao SAR, China", "Macau")
renameLevel("Lao PDR", "Laos")
renameLevel("Cote d'Ivoire", "Ivory Coast")
renameLevel("Kyrgyz Republic", "Kyrgyzstan")
renameLevel("United Kingdom", "Great Britain")
#renameLevel("", "Northern Ireland")
#renameLevel("", "North Yemen")
#renameLevel("", "South Yemen")
#renameLevel("", "Taiwan")
#renameLevel("", "Czechoslovakia")
#renameLevel("", "South Vietnam")
#renameLevel("", "Yugoslavia")
#renameLevel("", "Corsica")
#renameLevel("", "Rhodesia")
#renameLevel("", "Soviet Union")
#renameLevel("", "Western Sahara")
#renameLevel("", "New Hebrides")
#renameLevel("", "Guadeloupe")
#renameLevel("", "Martinique")
#renameLevel("", "Vatican City")
#renameLevel("", "French Guiana")
#renameLevel("", "Falkland Islands")
#renameLevel("", "Gibraltar")
#renameLevel("", "Wallis and Futuna")
#renameLevel("", "Serbia-Montenegro")
#renameLevel("", "International")

sort(setdiff(gtd$country_txt, wb$Country.Name)) # GTD ONLY
sort(setdiff(wb$Country.Name, gtd$country_txt)) # WB ONLY
sort(intersect(gtd$country_txt, wb$Country.Name))

gtd.only <- sort(setdiff(gtd$country_txt, wb$Country.Name)) # GTD ONLY

# see which gtd.only incidents are isolated/ignorable/small in number of attacks
#for (i in 1:length(gtd.only)) {
#  country = gtd.only[i]
#  print(paste0(country, ": ", nrow(gtd[gtd$country_txt == country,])))
#}




# 13000 discrepancies between GTD and World Bank country names
#length(which(! gtd$country_txt %in% wb$Country.Name))

#count NAs
#apply(wb, 2, function(x) length(which(is.na(x))))

