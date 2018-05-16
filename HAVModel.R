###########################################
# Modeling the HAV outbreak in Santa Cruz #
###########################################

rm(list=ls())
library(ggplot2)
library(deSolve)
setwd("~/Documents/GitHub/2017-Santa-Cruz-HAV-Modeling")
epi <- read.csv("EpiCurve.csv")

# Plotting points
outbreak <- ggplot(epi, aes(x=Date, y=Cases))
outbreak + geom_point()

# Setting up equations

# SEIR model because patients are infectious before they are symptomatic.
# Assumption that patients will behave differently once sympotmatic 
# - Check this assumption!!!
# Contact rates for E higher than for I. Any data to show difference?
# 
# Contact rates will need to be fitted to epidemic curve. 
# recovery rates 


SIR_ode <- function(time, state, theta) {
  ## Parameters (complete these):
  beta <- theta["R0"] / theta["D"]
  rec <- 1 / theta["D"]
  
  ## States:
  S <- state["S"]
  E <- state["E"]
  I <- state["I"]
  R <- state["R"]
  N <- S + I + R
  
  ## ODEs:
  dS <- -beta * S * (E+I) /N
  dE <- beta * S * (E+I)/N - incubation * I
  dI <- - rec * I
  dR <- rec * I
}