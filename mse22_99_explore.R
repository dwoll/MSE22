# dim()
# nrow()
# ncol()
# head()
# tail()
# names()
# View()
# str(), summary()
# [ , ]
# [ , , drop=FALSE]
# $

dat <- readRDS(url("http://dwoll.de/dat_passos.rds"))

dim(dat)
nrow(dat)
ncol(dat)

nrow(dat) > 20

head(dat, n=4)

dat_bad <- read.table("dat_passos.csv", sep=";", header=TRUE)
head(dat_bad)
tail(dat_bad, n=4)

str(dat)
str(dat_bad)

dat_good <- read.table("dat_passos.csv", sep=";", header=TRUE,
                       na.strings = "XX")
str(dat_good)
summary(dat)

dat[1, ]
dat[ , 1]
datSub[ , "observed"]
datSub$observed

