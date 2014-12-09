#Samsung Refrigerator RF31FMEDBSR
#Create Data
#Set the seed for pseudo randomization
set.seed(5)
#Set the range for operating room temperature between 10-45 degrees celcius
#Create a normal distribution for operating room temperature in celcius
OpTemp1 <- rnorm(3000, mean = 27.5, sd = 3)
#Set the range for hours of operation between 0-8765 hours
#Create a normal distribution for hours of operation
Hrs2 <- rnorm(3000, mean = 4383, sd = 1100)
#Set the range for refrigerator capacity between 0-31 cubic feet
#Create a normal distribution for wash capacity
RefCap <- rnorm(3000, mean = 16, sd = 4)
#Create binary value for five binary variables
BiVar <- c(0,1)
#Set the seed at a repeatable random value
set.seed(1)
#Create binary random uniform distribution
#Compressor
DefCom <- sample(BiVar, size = 3000, replace = TRUE)
#Coils
DeCoil <- sample(BiVar, size = 3000, replace = TRUE)
#Fan
BFan <- sample(BiVar, size = 3000, replace = TRUE)
#Defrost timer
BDef <- sample(BiVar, size = 3000, replace = TRUE)
#Thermostat
Therm <- sample(BiVar, size = 3000, replace = TRUE)

#Create logistic regression - 8 var
z = 1 + 2*OpTemp1 + 3*Hrs2 + 4*RefCap + 5*DefCom + 
  6*DeCoil + 7*BFan + 8*BDef + 9*Therm
z <- (z-mean(z))/sd(z)
pr = 1/(1 + exp(-z))
y <- rbinom(3000, 1, pr)
#Get coefficients of regression
DishWa = data.frame(y = y, NozHosUn = NozHosUn, SupPres = SupPres,
                    PlaceSet = PlaceSet, Hrs4 = Hrs4, WatTemp = WatTemp)
glm(y~NozHosUn + SupPres + PlaceSet + Hrs4 + WatTemp, data = DishWa, 
    family = binomial)
#Get summary statistics for dataset
summary(DishWa)
#Save file
save(DishWa,file="LogitDishWa.Rda")
#Create name for y
names(DishWa)[1] <- "Washing Machine Breakdown"
#Display variable
DishWa[1]