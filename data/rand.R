setwd("/Users/kmchen1/Desktop/ECON388/Final")
list.files()

rand <- read.csv("RAND.csv")

View(rand)

names(rand)
dim(rand)

length(which(substrRight(rand$Year, 2) == "85"))
hist(rand$Year)

# All cases where the city was Moscow
length(which(rand$City == "Moscow"))

# All cases with maximal injuries
which(rand$Injuries == max(rand$Injuries))
rand[7389,]

#' Prefixes millenium for a truncated year.
#' Given a string, such as "70" or "01",
#' will prepend a "19" in the first case
#' and a "20" in the second.
prefix <- function(s) {
  # since data stops at 2009, we can distinguish
  # prefixes by checking if the year starts with a "0".
  if (substr(s,1,1) == "0") {
    return(paste0("20",s))
  }
  return(paste0("19",s))
}

#' Extracts the last n characters from a factor level.
substrRight <- function(factorLevel,n) {
  x = as.character(factorLevel)
  substr(x, nchar(x)-n+1, nchar(x))
}

# Construct the Year integer column
rand["Year"] <- NA
rand$Year <- as.integer(prefix(substrRight(rand$Date, 2)))

# Reorder columns
rand <- rand[, c("Year", "Date", "Country", "City", "Injuries", "Fatalities", "Weapon", "Perpetrator", "Description")]

# TODO in Year, we want 2000 instead of 1900.