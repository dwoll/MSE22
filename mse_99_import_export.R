# read.table(), write.table()
# file="clipboard", file=pipe("pbpaste"), file=url()
# stringsAsFactors=FALSE
# load(), save()
# Package haven
# read_sas(), read_spss()
# write_sas(), write_sav()

write.table(datSub,
            file="dat_sub.dat",
            sep="\t",
            row.names=FALSE,
            col.names=TRUE,
            dec=",",
            na=".")

dat <- read.table("dat_passos.csv",
                  sep=";",
                  header=TRUE)

str(dat)

dat <- read.table("dat_passos.csv",
                  sep=";",
                  header=TRUE,
                  stringsAsFactors=TRUE)

str(dat)

dat <- read.table("dat_passos.csv",
                  sep=";",
                  header=TRUE)

saveRDS(dat, file="dat_output.rds")
data_i_just_read <- readRDS("dat_output.rds")

library(readxl)
dat_excel <- read_xlsx("Tabelle_Ampicillin_FINAL.xlsx")

dat4 <- dat[1:4, ]
4dat <- dat[1:4, ]
dat4.asdf_asdf <- dat[1:4, ]
