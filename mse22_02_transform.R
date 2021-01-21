# Package dplyr
# filter()
# select(), everything()
# mutate(), rename(), if_else()
# arrange(), desc()
# unique(), na.omit()
# scale(), cut(), as.Date(), strptime(),
# :, seq(), rep()
# sample(), runif(), rnorm()

library(dplyr)

datLeft <- dat %>%
    filter(Seite == "left",
           metric == "DMEAN",
           Alter > 65) %>%
    select(Alter, Seite, metric, structure, observed)

head(datLeft)

datLeft <- dat %>%
    filter(Seite == "left",
           Alter > 65) %>%
    select(-patID)

datLeft <- dat %>%
    filter(Seite == "left",
           Alter > 65) %>%
    select(Alter, Seite, patID, everything())

dat %>%
    filter(Alter < 18)

dat %>%
    filter((Alter > 99) |
           (Alter < 18) |
           (BMI > 50)   |
           (BMI < 10))

min(dat$Alter)
max(dat$Alter)

datMod <- dat %>%
    rename(start=Beginn,
           end=Ende) %>%
    mutate(Groesse_m=Groesse / 100,
           BMI=Gewicht / Groesse_m^2,
           age_grp=cut(Alter, breaks=c(0, median(Alter), 100)),
           Geburtsdatum=as.Date(Geburtsdatum, format="%Y-%m-%d"),
           ED_Histo=as.Date(ED_Histo, format="%Y-%m-%d"),
           observed_std=scale(observed),
           age_days=(ED_Histo - Geburtsdatum) / 365.25) %>%
    arrange(Seite,
            desc(Alter))

?arrange
