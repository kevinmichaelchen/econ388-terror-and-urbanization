#'
#' Add World Bank country code column in the GTD dataset
#' to map GTD country names to World Bank country names.
#'

#options(echo = TRUE)
args <- commandArgs(trailingOnly = TRUE)
print(args)

CSV_WB <- args[1]
CSV_GTD_OLD <- args[2]
CSV_GTD_NEW <- args[3]

wb <- read.csv(CSV_WB, check.names=FALSE)
gtd <- read.csv(CSV_GTD_OLD)



# Afghanistan is level 1 of World Bank country code factor
gtd$world_bank_code <- "AFG"

#' Fills in the World Bank country code column in GTD data. 
#' @param code The value of the World Bank country code.
#' @param country_text The key, i.e., the gtd$country_txt
add_gtd_country_code <- function(code, country_text) { gtd$world_bank_code[which(gtd$country_txt == country_text)] <<- code }

add_gtd_country_code("Albania", "ALB")
add_gtd_country_code("ALB", "Albania")
add_gtd_country_code("DZA", "Algeria")
add_gtd_country_code("ADO", "Andorra")
add_gtd_country_code("AGO", "Angola")
add_gtd_country_code("ATG", "Antigua and Barbuda")
add_gtd_country_code("ARG", "Argentina")
add_gtd_country_code("ARM", "Armenia")
add_gtd_country_code("AUS", "Australia")
add_gtd_country_code("AUT", "Austria")
add_gtd_country_code("AZE", "Azerbaijan")
add_gtd_country_code("BHS", "Bahamas")
add_gtd_country_code("BHR", "Bahrain")
add_gtd_country_code("BGD", "Bangladesh")
add_gtd_country_code("BRB", "Barbados")
add_gtd_country_code("BLR", "Belarus")
add_gtd_country_code("BEL", "Belgium")
add_gtd_country_code("BLZ", "Belize")
add_gtd_country_code("BEN", "Benin")
add_gtd_country_code("BMU", "Bermuda")
add_gtd_country_code("BTN", "Bhutan")
add_gtd_country_code("BOL", "Bolivia")
add_gtd_country_code("BIH", "Bosnia-Herzegovina")
add_gtd_country_code("BWA", "Botswana")
add_gtd_country_code("BRA", "Brazil")
add_gtd_country_code("BRN", "Brunei")
add_gtd_country_code("BGR", "Bulgaria")
add_gtd_country_code("BFA", "Burkina Faso")
add_gtd_country_code("BDI", "Burundi")
add_gtd_country_code("KHM", "Cambodia")
add_gtd_country_code("CMR", "Cameroon")
add_gtd_country_code("CAN", "Canada")
add_gtd_country_code("CYM", "Cayman Islands")
add_gtd_country_code("CAF", "Central African Republic")
add_gtd_country_code("TCD", "Chad")
add_gtd_country_code("CHL", "Chile")
add_gtd_country_code("CHN", "China")
add_gtd_country_code("COL", "Colombia")
add_gtd_country_code("COM", "Comoros")
add_gtd_country_code("COG", "Congo (Brazzaville)")
add_gtd_country_code("ZAR", "Congo (Kinshasa)")

#### Treat Corsica as France
add_gtd_country_code("FRA", "Corsica")

add_gtd_country_code("CRI", "Costa Rica")
add_gtd_country_code("HRV", "Croatia")
add_gtd_country_code("CUB", "Cuba")
add_gtd_country_code("CYP", "Cyprus")
add_gtd_country_code("CZE", "Czech Republic")

#### There is no more Czechoslovakia.
add_gtd_country_code("", "Czechoslovakia")

add_gtd_country_code("DNK", "Denmark")
add_gtd_country_code("DJI", "Djibouti")
add_gtd_country_code("DMA", "Dominica")
add_gtd_country_code("DOM", "Dominican Republic")

#### East Germany with West Germany became Germany in 1990
add_gtd_country_code("DEU", "East Germany (GDR)")

add_gtd_country_code("ECU", "Ecuador")
add_gtd_country_code("EGY", "Egypt")
add_gtd_country_code("SLV", "El Salvador")
add_gtd_country_code("GNQ", "Equatorial Guinea")
add_gtd_country_code("ERI", "Eritrea")
add_gtd_country_code("EST", "Estonia")
add_gtd_country_code("ETH", "Ethiopia")

#### No urbanization data for Falkland Islands.
add_gtd_country_code("", "Falkland Islands")

add_gtd_country_code("FJI", "Fiji")
add_gtd_country_code("FIN", "Finland")
add_gtd_country_code("FRA", "France")
add_gtd_country_code("PYF", "French Polynesia")
add_gtd_country_code("GAB", "Gabon")
add_gtd_country_code("GMB", "Gambia")
add_gtd_country_code("GEO", "Georgia")
add_gtd_country_code("DEU", "Germany")
add_gtd_country_code("GHA", "Ghana")

#### No urbanization data for Gibraltar. Could treat as ESP/Spain or GBR/Britain
add_gtd_country_code("", "Gibraltar")

add_gtd_country_code("GBR", "Great Britain")
add_gtd_country_code("GRC", "Greece")
add_gtd_country_code("GRD", "Grenada")

#### No urbanization data for Guadeloupe
add_gtd_country_code("", "Guadeloupe")

add_gtd_country_code("GTM", "Guatemala")
add_gtd_country_code("GIN", "Guinea")
add_gtd_country_code("GNB", "Guinea-Bissau")
add_gtd_country_code("GUY", "Guyana")
add_gtd_country_code("HTI", "Haiti")
add_gtd_country_code("HND", "Honduras")
add_gtd_country_code("HKG", "Hong Kong")
add_gtd_country_code("HUN", "Hungary")
add_gtd_country_code("ISL", "Iceland")
add_gtd_country_code("IND", "India")
add_gtd_country_code("IDN", "Indonesia")

#### No urbanization data for International.
add_gtd_country_code("", "International")

add_gtd_country_code("IRN", "Iran")
add_gtd_country_code("IRQ", "Iraq")
add_gtd_country_code("IRL", "Ireland")
add_gtd_country_code("ISR", "Israel")
add_gtd_country_code("ITA", "Italy")
add_gtd_country_code("CIV", "Ivory Coast")
add_gtd_country_code("JAM", "Jamaica")
add_gtd_country_code("JPN", "Japan")
add_gtd_country_code("JOR", "Jordan")
add_gtd_country_code("KAZ", "Kazakhstan")
add_gtd_country_code("KEN", "Kenya")
add_gtd_country_code("KSV", "Kosovo")
add_gtd_country_code("KWT", "Kuwait")
add_gtd_country_code("KGZ", "Kyrgyzstan")
add_gtd_country_code("LAO", "Laos")
add_gtd_country_code("LVA", "Latvia")
add_gtd_country_code("LBN", "Lebanon")
add_gtd_country_code("LSO", "Lesotho")
add_gtd_country_code("LBR", "Liberia")
add_gtd_country_code("LBY", "Libya")
add_gtd_country_code("LTU", "Lithuania")
add_gtd_country_code("LUX", "Luxembourg")
add_gtd_country_code("MAC", "Macau")
add_gtd_country_code("MKD", "Macedonia")
add_gtd_country_code("MDG", "Madagascar")
add_gtd_country_code("MWI", "Malawi")
add_gtd_country_code("MYS", "Malaysia")
add_gtd_country_code("MDV", "Maldives")
add_gtd_country_code("MLI", "Mali")
add_gtd_country_code("MLT", "Malta")

#### No urbanization data for Martinique. Could treat as FRA/France
add_gtd_country_code("", "Martinique")

add_gtd_country_code("MRT", "Mauritania")
add_gtd_country_code("MUS", "Mauritius")
add_gtd_country_code("MEX", "Mexico")
add_gtd_country_code("MDA", "Moldova")
add_gtd_country_code("MNE", "Montenegro")
add_gtd_country_code("MAR", "Morocco")
add_gtd_country_code("MOZ", "Mozambique")
add_gtd_country_code("MMR", "Myanmar")
add_gtd_country_code("NAM", "Namibia")
add_gtd_country_code("NPL", "Nepal")
add_gtd_country_code("NLD", "Netherlands")
add_gtd_country_code("NCL", "New Caledonia")

#### New Hebrides became Vanuatu in 1980
add_gtd_country_code("VUT", "New Hebrides")

add_gtd_country_code("NZL", "New Zealand")
add_gtd_country_code("NIC", "Nicaragua")
add_gtd_country_code("NER", "Niger")
add_gtd_country_code("NGA", "Nigeria")
add_gtd_country_code("PRK", "North Korea")

#### North Yemen is just Yemen now
add_gtd_country_code("YEM", "North Yemen")

#### Northern Ireland is part of the GBR/UK
add_gtd_country_code("GBR", "Northern Ireland")

add_gtd_country_code("NOR", "Norway")
add_gtd_country_code("PAK", "Pakistan")
add_gtd_country_code("PAN", "Panama")
add_gtd_country_code("PNG", "Papua New Guinea")
add_gtd_country_code("PRY", "Paraguay")
add_gtd_country_code("PER", "Peru")
add_gtd_country_code("PHL", "Philippines")
add_gtd_country_code("POL", "Poland")
add_gtd_country_code("PRT", "Portugal")
add_gtd_country_code("PRI", "Puerto Rico")
add_gtd_country_code("QAT", "Qatar")
add_gtd_country_code("ZWE", "Rhodesia")
add_gtd_country_code("ROM", "Romania")
add_gtd_country_code("RUS", "Russia")
add_gtd_country_code("RWA", "Rwanda")
add_gtd_country_code("SAU", "Saudi Arabia")
add_gtd_country_code("SEN", "Senegal")
add_gtd_country_code("SRB", "Serbia")
 

#' Since the federation only existsed from 2003-2006, in which
#' there were only three relatively small incidents, we choose
#' to ignore these incidents, rather than treat them as SRB/Serbia
#' and MNE/Montenegro each.
add_gtd_country_code("", "Serbia-Montenegro")

add_gtd_country_code("SYC", "Seychelles")
add_gtd_country_code("SLE", "Sierra Leone")
add_gtd_country_code("SGP", "Singapore")
add_gtd_country_code("SVK", "Slovak Republic")
add_gtd_country_code("SVN", "Slovenia")
add_gtd_country_code("SLB", "Solomon Islands")
add_gtd_country_code("SOM", "Somalia")
add_gtd_country_code("ZAF", "South Africa")
add_gtd_country_code("KOR", "South Korea")
add_gtd_country_code("SSD", "South Sudan")

#### We treat South Vietnam as VNM/Vietnam
add_gtd_country_code("VNM", "South Vietnam")

#### South Yemen is just Yemen now
add_gtd_country_code("YEM", "South Yemen")

add_gtd_country_code("RUS", "Soviet Union")
add_gtd_country_code("ESP", "Spain")
add_gtd_country_code("LKA", "Sri Lanka")
add_gtd_country_code("KNA", "St. Kitts and Nevis")
add_gtd_country_code("LCA", "St. Lucia")
add_gtd_country_code("SDN", "Sudan")
add_gtd_country_code("SUR", "Suriname")
add_gtd_country_code("SWZ", "Swaziland")
add_gtd_country_code("SWE", "Sweden")
add_gtd_country_code("CHE", "Switzerland")
add_gtd_country_code("SYR", "Syria")

#### As there is no urbanization data for Taiwan, we treat it as China.
add_gtd_country_code("CHN", "Taiwan")

add_gtd_country_code("TJK", "Tajikistan")
add_gtd_country_code("TZA", "Tanzania")
add_gtd_country_code("THA", "Thailand")
add_gtd_country_code("TMP", "Timor-Leste")
add_gtd_country_code("TGO", "Togo")
add_gtd_country_code("TTO", "Trinidad and Tobago")
add_gtd_country_code("TUN", "Tunisia")
add_gtd_country_code("TUR", "Turkey")
add_gtd_country_code("TKM", "Turkmenistan")
add_gtd_country_code("UGA", "Uganda")
add_gtd_country_code("UKR", "Ukraine")
add_gtd_country_code("ARE", "United Arab Emirates")
add_gtd_country_code("USA", "United States")
add_gtd_country_code("URY", "Uruguay")
add_gtd_country_code("UZB", "Uzbekistan")
add_gtd_country_code("VUT", "Vanuatu")

#### We treat Vatican City as part of Italy.
add_gtd_country_code("ITA", "Vatican City")

add_gtd_country_code("VEN", "Venezuela")
add_gtd_country_code("VNM", "Vietnam")
add_gtd_country_code("VIR", "Virgin Islands (U.S.)")

#### No urbanization data for Wallis and Futuna. Could treat as FRA/France
add_gtd_country_code("", "Wallis and Futuna")

add_gtd_country_code("WBG", "West Bank and Gaza Strip")

#### West Germany with East Germany became Germany in 1990.
add_gtd_country_code("DEU", "West Germany (FRG)")

#### We treat Western Sahara as part of Morocco
add_gtd_country_code("MAR", "Western Sahara")

add_gtd_country_code("YEM", "Yemen")

#### We ignore Yugoslavia as it dissolved in 6 climates/countries
add_gtd_country_code("", "Yugoslavia")

add_gtd_country_code("ZMB", "Zambia")
add_gtd_country_code("ZWE", "Zimbabwe")


write.csv(gtd, file=CSV_GTD_NEW, row.names=FALSE)
#View(read.csv(paste0(GTD_PATH, "new_gtd.csv"), check.names=FALSE))
