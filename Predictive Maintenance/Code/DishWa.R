#Samsung Dishwasher
#Create Data
#Set the seed for pseudo randomization
set.seed(5)
#Set the range for water temperature
WatTemp <- c(49:65)
#Create a normal distribution for water temperature 
WatTemp <- rnorm(3000, mean=57, sd=3)
#Set the range for hours of operation
Hrs4 <- c(0:1000)
#Create a normal distribution for hours of operation
Hrs4 <- rnorm(3000, mean=500, sd=225)
#Set the range for dishwasher capacity
WashCap <- c(0:14)
#Create a normal distribution for wash capacity
WashCap <- rnorm(3000, mean=7, sd=3)
#Set the range for water supply pressure
SupPres <- c(20:120)
#Create a normal distribution for water supply pressure
SupPres <- rnorm(3000, mean=70, sd=25)
#Create binary value for nozzle hole being plugged
NozHosUn <- c(0,1)
#Set the seed at a repeatable random value
set.seed(1)
#Create binary random uniform distribution
NozHosUn<-sample(NozHosUn,size=3000, replace=TRUE)
#Create logistic regression
z=1+2*NozHosUn+3*SupPres+4*PlaceSet+5*Hrs4+6*WatTemp
z <- (z-mean(z))/sd(z)
pr = 1/(1+exp(-z))
y <- rbinom(3000,1,pr)
DishWa=data.frame(y=y, NozHosUn=NozHosUn,SupPres=SupPres,
                   PlaceSet=PlaceSet,Hrs4=Hrs4,WatTemp=WatTemp)
glm(y~NozHosUn+SupPres+PlaceSet+Hrs4+WatTemp, data=DishWa, 
    family=binomial)
#Get summary statistics for dataset
summary(DishWa)
#Save file
save(DishWa,file="LogitDishWa.Rda")
#Create name for y
names(DishWa)[1] <- "Washing Machine Breakdown"
#Display variable
DishWa[1]
