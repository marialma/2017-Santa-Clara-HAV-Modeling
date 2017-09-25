rm(list=ls())
library(ggplot2)
library(deSolve)
setwd("~/Documents/GitHub/2017-Santa-Cruz-HAV-Modeling")
epi <- read.csv("EpiCurve.csv")

outbreak <- ggplot(epi, aes(x=Date, y=Cases))
outbreak + geom_point()
