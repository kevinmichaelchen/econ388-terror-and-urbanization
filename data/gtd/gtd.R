PATH <- "/Users/kmchen1/Desktop/ECON388/Final/data/"
setwd(PATH)
list.files()
gtd <- read.csv(paste0(PATH, "gtd/gtd.csv"))

View(gtd)
names(gtd)
dim(gtd)

hist(gtd$iyear)

length(which(gtd$iyear == 1980))

hist(gtd$imonth)
hist(gtd$iday, xlim=c(0, 31), breaks=seq(-99,31,l=32))

#political, economic, religious or social goal
table(gtd$crit1)
#intent to coerce, intimidate or publicize to larger audience
table(gtd$crit2)
#outside international humanitarian law
table(gtd$crit3)

#1=dubious "terror", 0=certainly a terrorist act
table(gtd$doubtterr)

#'if there was doubt, possible alternatives 
#'1=insurgency, 2=other crime,
#'3=inter(ra)-group conflict, 4=no intent
table(gtd$alternative)

#attack was part of multiple incidents
table(gtd$multiple)

#location
tail(gtd$country, n=20)
table(gtd$country_txt)
tail(gtd$region, n=20)
table(gtd$region_txt)

#1=occurred in vicinity of city, 0=in city itself
table(gtd$vicinity)

tail(gtd$latitude, n=20)
tail(gtd$longitude, n=20)

#' 1=assassinate, 2=hijack, 3=kidnap
#' 4=barricade, 5=bomb, 6=unknown
#' 7=armed assault, 8=unarmed, 9=facility attack
table(gtd$attacktype1)
# use attacktype2 and attacktype3 for subsequent types

# 91% of attacks are successes 
table(gtd$success) #/ dim(gtd)[1]

# only 2% of attacks are suicides
table(gtd$suicide) / dim(gtd)[1]

#' 1=biological, 2=chemical, 3=radiological
#' 4=nuclear, 5=firearms, 6=bomb, 7=fake weapons
#' 8=incendiary, 9=melee, 10=vehicle, 11=sabotage
#' 12=other, 13=unknown
table(gtd$weaptype1)
table(gtd$weaptype2)
table(gtd$weaptype3)
table(gtd$weaptype4)

#' 1=poison, 2=automatic, 3=handgun, 4=rifle/shotgun
#' 5=unknown gun, 6=other gun, 7=grenade, 8=mine
#' 9=mail bomb, 10=pressure trigger, 11=projectile
#' 12=remote, 13=suicide, 14=time fuse, 15=vehicle
#' 16=unknown explosive, 17=other explosive, 18=fire
#' 19=flame thrower, 20=gas/alcohol, 21=blunt obj
#' 22=hands/feet, 23=knife/sharp obj, 24=rope
#' 26=suffocate, 27=unknown, 28=tnt, 29=sticky bomb
table(gtd$weapsubtype1)
table(gtd$weapsubtype2)
table(gtd$weapsubtype3)
table(gtd$weapsubtype4)

View(gtd$weapdetail)

#' 1=business, 2=gov, 3=police, 4=military,
#' 5=abortion related, 6=air-ports/craft, 7=diplomatic
#' 8=education, 9=food/water, 10=media, 11=maritime
#' 12=ngo, 13=other, 14=citizen, 15=religious figures/instit.
#' 16=telecom, 17=terrorists/non-state militias, 18=tourists
#' 19=transport, 20=unknown, 21=utilities, 
#' 22=violent political parties
table(gtd$targtype1)
hist(gtd[gtd$targtype1 == 22,]$region)

#' 1=gas/oil, 2=restaurant/bar, 3=bank/commerce
#' 4=multinational corp, 5=industrial/factory
#' 6=medical/pharma, 7=retail, 8=hotel/resort
#' 9=farm, 10=mining, 11=entertain/cultural
#' 12=construction, 13=private security, 14=judiciary
#' 15=political, 16=royalty, 17=head of state,
#' 18=gov employees, 19=election, 20=intelligence,
#' 21=gov building, 22=police building, 23=police patrol
#' 24=police checkpoint
table(gtd$targsubtype1)

# Count the number of terrorist attacks in each country in each year 
names(gtd)
dim(gtd)

summary(gtd$nkill)

# uncertain about more than half the data for doubtterr...
length(which(gtd$doubtterr == -9)) / dim(gtd)[1]

# 94% data coverage on nkill
1 - (length(which(is.na(gtd$nkill))) / dim(gtd)[1])

# 42% data coverage on nkillus 
1 - (length(which(is.na(gtd$nkillus))) / dim(gtd)[1])
summary(gtd$suicide)
dim(gtd)

summary(gtd$country)
range(gtd$country)
hist(gtd$country)

# Terrorist incidents in each country
reportAttacks <- function(df) {
  countries <- levels(gtd$country_txt)
  for (i in 1:length(countries)) {
    c = countries[i]
    n = length(which(df$country_txt == c))
    if (n != 0)
      print(paste0(c, ": ", n))
  }
}

reportBombAttacks <- function(df) {
  countries <- levels(gtd$country_txt)
  for (i in 1:length(countries)) {
    c = countries[i]
    n = length(which(df$country_txt == c && df$weaptype1 == 6))
    if (n != 0)
      print(paste0(c, ": ", n))
  }
}


# 1980, 281 attacks in guatemala
df <- gtd[gtd$iyear == 1980,]

# 47% bomb attacks
length(which(gtd$weaptype1 == 6)) / dim(gtd)[1]
bomb.attacks <- which(gtd$weaptype1 == 6)
