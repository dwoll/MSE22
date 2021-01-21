dat <- read.table(url("http://dwoll.de/dat_passos.csv"),
                  header=TRUE,
                  sep=";",
                  stringsAsFactors=FALSE)

dat <- readRDS(url("http://dwoll.de/dat_passos.rds"))

library(dplyr)
datSub <- dat %>%
  filter(metric == "DMEAN",
         structure == "1_HEART")

head(datSub)

datSub %>%
  group_by(Seite) %>%
  summarise(M=mean(observed),
            SD=sd(observed))

library(ggplot2)
ggplot(datSub, aes(x=Seite, y=observed)) +
  geom_boxplot()

ggplot(datSub, aes(x=Seite, y=observed)) +
  geom_violin()

ggplot(datSub, aes(x=Groesse, y=Gewicht, color=haveLAG)) +
  geom_point() +
  geom_smooth(method=lm) +
  facet_grid(Seite ~ .)

fit <- lm(observed ~ GD1 + Seite + haveLAG, data=datSub)
fit
summary(fit)

dim(dat)
head(dat, n=3)
tail(dat)
View(dat)
