PATH <- "~/Desktop/ECON388/Final/data/"
GTD_PATH <- paste0(PATH, "gtd/")
URB_PATH <- paste0(PATH, "urbanization/")
setwd(PATH)
gtd <- read.csv(paste0(GTD_PATH, "new_gtd.csv"))
wb <- read.csv(paste0(URB_PATH, "new_urban.csv"), check.names=FALSE)