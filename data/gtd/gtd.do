clear
capture log close
log using "~/Desktop/ECON388/Final/gtd.log", text replace

insheet using "/Users/kmchen1/Desktop/ECON388/Final/gtd.csv", comma

* order *, sequential

gen atk_assassination	= attacktype1 == 1 if !missing(attacktype1)
gen atk_hijack 			= attacktype1 == 2 if !missing(attacktype1)
gen atk_kidnap 			= attacktype1 == 3 if !missing(attacktype1)
gen atk_barricade 		= attacktype1 == 4 if !missing(attacktype1)
gen atk_bomb 			= attacktype1 == 5 if !missing(attacktype1)
gen atk_unknown 		= attacktype1 == 6 if !missing(attacktype1)
gen atk_armed 			= attacktype1 == 7 if !missing(attacktype1)
gen atk_unarmed 		= attacktype1 == 8 if !missing(attacktype1)
gen atk_facility 		= attacktype1 == 9 if !missing(attacktype1)

gen wep_bio				= weaptype1 == 1 if !missing(weaptype1)
gen wep_chem			= weaptype1 == 2 if !missing(weaptype1)
gen wep_radio			= weaptype1 == 3 if !missing(weaptype1)
gen wep_nuclear			= weaptype1 == 4 if !missing(weaptype1)
gen wep_firearms		= weaptype1 == 5 if !missing(weaptype1)
gen wep_bomb 			= weaptype1 == 6 if !missing(weaptype1)

*mean nkill if bomb 

regress nkill atk_bomb

log close
