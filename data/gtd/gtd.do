clear
capture log close
log using "~/Desktop/ECON388/Final/data/gtd/gtd.log", text replace

insheet using "~/Desktop/ECON388/Final/data/gtd/gtd.csv", comma

* order *, sequential


******* RECONCILING GTD COUNTRY NAMES WITH WORLD BANK COUNTRY NAMES
* Afghanistan = 1
gen world_bank_code = "AFG"
replace world_bank_code = "ALB" if country_txt == "Albania"
replace world_bank_code = "DZA" if country_txt == "Algeria"
replace world_bank_code = "ADO" if country_txt == "Andorra"
replace world_bank_code = "AGO" if country_txt == "Angola"
replace world_bank_code = "ATG" if country_txt == "Antigua and Barbuda"
replace world_bank_code = "ARG" if country_txt == "Argentina"
replace world_bank_code = "ARM" if country_txt == "Armenia"
replace world_bank_code = "AUS" if country_txt == "Australia"
replace world_bank_code = "AUT" if country_txt == "Austria"
replace world_bank_code = "AZE" if country_txt == "Azerbaijan"
replace world_bank_code = "BHS" if country_txt == "Bahamas"
replace world_bank_code = "BHR" if country_txt == "Bahrain"
replace world_bank_code = "BGD" if country_txt == "Bangladesh"
replace world_bank_code = "BRB" if country_txt == "Barbados"
replace world_bank_code = "BLR" if country_txt == "Belarus"
replace world_bank_code = "BEL" if country_txt == "Belgium"
replace world_bank_code = "BLZ" if country_txt == "Belize"
replace world_bank_code = "BEN" if country_txt == "Benin"
replace world_bank_code = "BMU" if country_txt == "Bermuda"
replace world_bank_code = "BTN" if country_txt == "Bhutan"
replace world_bank_code = "BOL" if country_txt == "Bolivia"
replace world_bank_code = "BIH" if country_txt == "Bosnia-Herzegovina"
replace world_bank_code = "BWA" if country_txt == "Botswana"
replace world_bank_code = "BRA" if country_txt == "Brazil"
replace world_bank_code = "BRN" if country_txt == "Brunei"
replace world_bank_code = "BGR" if country_txt == "Bulgaria"
replace world_bank_code = "BFA" if country_txt == "Burkina Faso"
replace world_bank_code = "BDI" if country_txt == "Burundi"
replace world_bank_code = "KHM" if country_txt == "Cambodia"
replace world_bank_code = "CMR" if country_txt == "Cameroon"
replace world_bank_code = "CAN" if country_txt == "Canada"
replace world_bank_code = "CYM" if country_txt == "Cayman Islands"
replace world_bank_code = "CAF" if country_txt == "Central African Republic"
replace world_bank_code = "TCD" if country_txt == "Chad"
replace world_bank_code = "CHL" if country_txt == "Chile"
replace world_bank_code = "CHN" if country_txt == "China"
replace world_bank_code = "COL" if country_txt == "Colombia"
replace world_bank_code = "COM" if country_txt == "Comoros"
replace world_bank_code = "COG" if country_txt == "Congo (Brazzaville)"
replace world_bank_code = "ZAR" if country_txt == "Congo (Kinshasa)"

**** Treat Corsica as France
replace world_bank_code = "FRA" if country_txt == "Corsica"

replace world_bank_code = "CRI" if country_txt == "Costa Rica"
replace world_bank_code = "HRV" if country_txt == "Croatia"
replace world_bank_code = "CUB" if country_txt == "Cuba"
replace world_bank_code = "CYP" if country_txt == "Cyprus"
replace world_bank_code = "CZE" if country_txt == "Czech Republic"

**** There is no more Czechoslovakia.
replace world_bank_code = "" if country_txt == "Czechoslovakia"

replace world_bank_code = "DNK" if country_txt == "Denmark"
replace world_bank_code = "DJI" if country_txt == "Djibouti"
replace world_bank_code = "DMA" if country_txt == "Dominica"
replace world_bank_code = "DOM" if country_txt == "Dominican Republic"

**** East Germany with West Germany became Germany in 1990
replace world_bank_code = "DEU" if country_txt == "East Germany (GDR)"

replace world_bank_code = "ECU" if country_txt == "Ecuador"
replace world_bank_code = "EGY" if country_txt == "Egypt"
replace world_bank_code = "SLV" if country_txt == "El Salvador"
replace world_bank_code = "GNQ" if country_txt == "Equatorial Guinea"
replace world_bank_code = "ERI" if country_txt == "Eritrea"
replace world_bank_code = "EST" if country_txt == "Estonia"
replace world_bank_code = "ETH" if country_txt == "Ethiopia"

**** No urbanization data for Falkland Islands.
replace world_bank_code = "" if country_txt == "Falkland Islands"

replace world_bank_code = "FJI" if country_txt == "Fiji"
replace world_bank_code = "FIN" if country_txt == "Finland"
replace world_bank_code = "FRA" if country_txt == "France"
replace world_bank_code = "PYF" if country_txt == "French Polynesia"
replace world_bank_code = "GAB" if country_txt == "Gabon"
replace world_bank_code = "GMB" if country_txt == "Gambia"
replace world_bank_code = "GEO" if country_txt == "Georgia"
replace world_bank_code = "DEU" if country_txt == "Germany"
replace world_bank_code = "GHA" if country_txt == "Ghana"

**** No urbanization data for Gibraltar. Could treat as ESP/Spain or GBR/Britain
replace world_bank_code = "" if country_txt == "Gibraltar"

replace world_bank_code = "GBR" if country_txt == "Great Britain"
replace world_bank_code = "GRC" if country_txt == "Greece"
replace world_bank_code = "GRD" if country_txt == "Grenada"

**** No urbanization data for Guadeloupe
replace world_bank_code = "" if country_txt == "Guadeloupe"

replace world_bank_code = "GTM" if country_txt == "Guatemala"
replace world_bank_code = "GIN" if country_txt == "Guinea"
replace world_bank_code = "GNB" if country_txt == "Guinea-Bissau"
replace world_bank_code = "GUY" if country_txt == "Guyana"
replace world_bank_code = "HTI" if country_txt == "Haiti"
replace world_bank_code = "HND" if country_txt == "Honduras"
replace world_bank_code = "HKG" if country_txt == "Hong Kong"
replace world_bank_code = "HUN" if country_txt == "Hungary"
replace world_bank_code = "ISL" if country_txt == "Iceland"
replace world_bank_code = "IND" if country_txt == "India"
replace world_bank_code = "IDN" if country_txt == "Indonesia"

**** No urbanization data for International.
replace world_bank_code = "" if country_txt == "International"

replace world_bank_code = "IRN" if country_txt == "Iran"
replace world_bank_code = "IRQ" if country_txt == "Iraq"
replace world_bank_code = "IRL" if country_txt == "Ireland"
replace world_bank_code = "ISR" if country_txt == "Israel"
replace world_bank_code = "ITA" if country_txt == "Italy"
replace world_bank_code = "CIV" if country_txt == "Ivory Coast"
replace world_bank_code = "JAM" if country_txt == "Jamaica"
replace world_bank_code = "JPN" if country_txt == "Japan"
replace world_bank_code = "JOR" if country_txt == "Jordan"
replace world_bank_code = "KAZ" if country_txt == "Kazakhstan"
replace world_bank_code = "KEN" if country_txt == "Kenya"
replace world_bank_code = "KSV" if country_txt == "Kosovo"
replace world_bank_code = "KWT" if country_txt == "Kuwait"
replace world_bank_code = "KGZ" if country_txt == "Kyrgyzstan"
replace world_bank_code = "LAO" if country_txt == "Laos"
replace world_bank_code = "LVA" if country_txt == "Latvia"
replace world_bank_code = "LBN" if country_txt == "Lebanon"
replace world_bank_code = "LSO" if country_txt == "Lesotho"
replace world_bank_code = "LBR" if country_txt == "Liberia"
replace world_bank_code = "LBY" if country_txt == "Libya"
replace world_bank_code = "LTU" if country_txt == "Lithuania"
replace world_bank_code = "LUX" if country_txt == "Luxembourg"
replace world_bank_code = "MAC" if country_txt == "Macau"
replace world_bank_code = "MKD" if country_txt == "Macedonia"
replace world_bank_code = "MDG" if country_txt == "Madagascar"
replace world_bank_code = "MWI" if country_txt == "Malawi"
replace world_bank_code = "MYS" if country_txt == "Malaysia"
replace world_bank_code = "MDV" if country_txt == "Maldives"
replace world_bank_code = "MLI" if country_txt == "Mali"
replace world_bank_code = "MLT" if country_txt == "Malta"

**** No urbanization data for Martinique. Could treat as FRA/France
replace world_bank_code = "" if country_txt == "Martinique"

replace world_bank_code = "MRT" if country_txt == "Mauritania"
replace world_bank_code = "MUS" if country_txt == "Mauritius"
replace world_bank_code = "MEX" if country_txt == "Mexico"
replace world_bank_code = "MDA" if country_txt == "Moldova"
replace world_bank_code = "MNE" if country_txt == "Montenegro"
replace world_bank_code = "MAR" if country_txt == "Morocco"
replace world_bank_code = "MOZ" if country_txt == "Mozambique"
replace world_bank_code = "MMR" if country_txt == "Myanmar"
replace world_bank_code = "NAM" if country_txt == "Namibia"
replace world_bank_code = "NPL" if country_txt == "Nepal"
replace world_bank_code = "NLD" if country_txt == "Netherlands"
replace world_bank_code = "NCL" if country_txt == "New Caledonia"

**** New Hebrides became Vanuatu in 1980
replace world_bank_code = "VUT" if country_txt == "New Hebrides"

replace world_bank_code = "NZL" if country_txt == "New Zealand"
replace world_bank_code = "NIC" if country_txt == "Nicaragua"
replace world_bank_code = "NER" if country_txt == "Niger"
replace world_bank_code = "NGA" if country_txt == "Nigeria"
replace world_bank_code = "PRK" if country_txt == "North Korea"

**** North Yemen is just Yemen now
replace world_bank_code = "YEM" if country_txt == "North Yemen"

**** Northern Ireland is part of the GBR/UK
replace world_bank_code = "GBR" if country_txt == "Northern Ireland"

replace world_bank_code = "NOR" if country_txt == "Norway"
replace world_bank_code = "PAK" if country_txt == "Pakistan"
replace world_bank_code = "PAN" if country_txt == "Panama"
replace world_bank_code = "PNG" if country_txt == "Papua New Guinea"
replace world_bank_code = "PRY" if country_txt == "Paraguay"
replace world_bank_code = "PER" if country_txt == "Peru"
replace world_bank_code = "PHL" if country_txt == "Philippines"
replace world_bank_code = "POL" if country_txt == "Poland"
replace world_bank_code = "PRT" if country_txt == "Portugal"
replace world_bank_code = "PRI" if country_txt == "Puerto Rico"
replace world_bank_code = "QAT" if country_txt == "Qatar"
replace world_bank_code = "ZWE" if country_txt == "Rhodesia"
replace world_bank_code = "ROM" if country_txt == "Romania"
replace world_bank_code = "RUS" if country_txt == "Russia"
replace world_bank_code = "RWA" if country_txt == "Rwanda"
replace world_bank_code = "SAU" if country_txt == "Saudi Arabia"
replace world_bank_code = "SEN" if country_txt == "Senegal"
replace world_bank_code = "SRB" if country_txt == "Serbia"

/**
 * Since the federation only existsed from 2003-2006, in which
 * there were only three relatively small incidents, we choose
 * to ignore these incidents, rather than treat them as SRB/Serbia
 * and MNE/Montenegro each.
 */
replace world_bank_code = "" if country_txt == "Serbia-Montenegro"

replace world_bank_code = "SYC" if country_txt == "Seychelles"
replace world_bank_code = "SLE" if country_txt == "Sierra Leone"
replace world_bank_code = "SGP" if country_txt == "Singapore"
replace world_bank_code = "SVK" if country_txt == "Slovak Republic"
replace world_bank_code = "SVN" if country_txt == "Slovenia"
replace world_bank_code = "SLB" if country_txt == "Solomon Islands"
replace world_bank_code = "SOM" if country_txt == "Somalia"
replace world_bank_code = "ZAF" if country_txt == "South Africa"
replace world_bank_code = "KOR" if country_txt == "South Korea"
replace world_bank_code = "SSD" if country_txt == "South Sudan"

**** We treat South Vietnam as VNM/Vietnam
replace world_bank_code = "VNM" if country_txt == "South Vietnam"

**** South Yemen is just Yemen now
replace world_bank_code = "YEM" if country_txt == "South Yemen"

replace world_bank_code = "RUS" if country_txt == "Soviet Union"
replace world_bank_code = "ESP" if country_txt == "Spain"
replace world_bank_code = "LKA" if country_txt == "Sri Lanka"
replace world_bank_code = "KNA" if country_txt == "St. Kitts and Nevis"
replace world_bank_code = "LCA" if country_txt == "St. Lucia"
replace world_bank_code = "SDN" if country_txt == "Sudan"
replace world_bank_code = "SUR" if country_txt == "Suriname"
replace world_bank_code = "SWZ" if country_txt == "Swaziland"
replace world_bank_code = "SWE" if country_txt == "Sweden"
replace world_bank_code = "CHE" if country_txt == "Switzerland"
replace world_bank_code = "SYR" if country_txt == "Syria"

**** As there is no urbanization data for Taiwan, we treat it as China.
replace world_bank_code = "CHN" if country_txt == "Taiwan"

replace world_bank_code = "TJK" if country_txt == "Tajikistan"
replace world_bank_code = "TZA" if country_txt == "Tanzania"
replace world_bank_code = "THA" if country_txt == "Thailand"
replace world_bank_code = "TMP" if country_txt == "Timor-Leste"
replace world_bank_code = "TGO" if country_txt == "Togo"
replace world_bank_code = "TTO" if country_txt == "Trinidad and Tobago"
replace world_bank_code = "TUN" if country_txt == "Tunisia"
replace world_bank_code = "TUR" if country_txt == "Turkey"
replace world_bank_code = "TKM" if country_txt == "Turkmenistan"
replace world_bank_code = "UGA" if country_txt == "Uganda"
replace world_bank_code = "UKR" if country_txt == "Ukraine"
replace world_bank_code = "ARE" if country_txt == "United Arab Emirates"
replace world_bank_code = "USA" if country_txt == "United States"
replace world_bank_code = "URY" if country_txt == "Uruguay"
replace world_bank_code = "UZB" if country_txt == "Uzbekistan"
replace world_bank_code = "VUT" if country_txt == "Vanuatu"

**** We treat Vatican City as part of Italy.
replace world_bank_code = "ITA" if country_txt == "Vatican City"

replace world_bank_code = "VEN" if country_txt == "Venezuela"
replace world_bank_code = "VNM" if country_txt == "Vietnam"
replace world_bank_code = "VIR" if country_txt == "Virgin Islands (U.S.)"

**** No urbanization data for Wallis and Futuna. Could treat as FRA/France
replace world_bank_code = "" if country_txt == "Wallis and Futuna"

replace world_bank_code = "WBG" if country_txt == "West Bank and Gaza Strip"

**** West Germany with East Germany became Germany in 1990.
replace world_bank_code = "DEU" if country_txt == "West Germany (FRG)"

**** We treat Western Sahara as part of Morocco
replace world_bank_code = "MAR" if country_txt == "Western Sahara"

replace world_bank_code = "YEM" if country_txt == "Yemen"

**** We ignore Yugoslavia as it dissolved in 6 climates/countries
replace world_bank_code = "" if country_txt == "Yugoslavia"

replace world_bank_code = "ZMB" if country_txt == "Zambia"
replace world_bank_code = "ZWE" if country_txt == "Zimbabwe"


*regress nkill atk_bomb
*tab nkill if country_txt == "Yugoslavia"
*sum nkill if country_txt == "Serbia-Montenegro"
*mean nkill if country_txt == "Spain"

log close
