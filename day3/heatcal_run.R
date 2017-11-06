source("heatmapcal.R")

r2g <- c("#D61818", "#FFAE63", "#FFFFBD", "#B5E384")   #red to green
a <- r2g[4:1]
a

spiderman <- read.csv("spiderman_clean.csv", fileEncoding = "UTF-8", stringsAsFactors = F)
calendarHeat(as.Date(spiderman$날짜), spiderman$스크린수, color='a')
