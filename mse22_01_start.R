# getwd(), setwd()
# ?⟨function
# ??⟨word
# help()
# example()
# ?Reserved,
# <-, =
# print()
# ls()
# rm()
# ?Arithmetic
# round(⟨number⟩, digits=⟨digits⟩)
# exp(), factorial()
# TRUE, FALSE, !, ==, !=, <, >, <=, >=, |, &

getwd()
setwd("g:/mse_202021_R/")
dat <- read.table("dat_passos.csv", sep=";", header=TRUE)
setwd("g:/mse_202021_R/MSE22/")
dat <- read.table("dat_passos.csv", sep=";", header=TRUE)
dat <- read.table("g:/mse_202021_R/MSE22/dat_passos.csv",
                  sep=";",
                  header=TRUE)

1 + 3
1 +
    3
1 + 3 + 4

1 + 
    3 +
    4

1 + 
    3
    +4
-3
+4

?read.table
TRUE
FALSE

5 / 7

library(ggplot2)
gg_diagram <- ggplot(datSub, aes(x=Groesse, y=Gewicht)) +
    geom_point()

print(gg_diagram)

lm_fit <- lm(Gewicht ~ Groesse, data=datSub)
summary(lm_fit)
coef(lm_fit)
fitted(lm_fit)

example(lm)

ls()
rm(lm.D9)
rm(lm.D90)
rm(gg_diagram, lm_fit)

2 == 3
2 == 2
(1+1) == 2
(3/3) == 1
1 == 49*(1/49)
10 == (10*1)
pi
0010010100
print(49*(1/49), digits=20)

library(boot)

lm()

1 + 3 * 4
(1 + 3) * 4
