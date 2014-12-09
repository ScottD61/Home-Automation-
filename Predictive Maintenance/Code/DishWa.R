#Samsung Dishwasher DMT800
#Create Data
#Set the seed for pseudo randomization
set.seed(5)
#Set the range for water temperature between 49-65 degrees celcius
#Create a normal distribution for water temperature 
WatTemp <- rnorm(3000, mean = 57, sd = 3)
#Set the range for hours of operation between 0-1000 hours
#Create a normal distribution for hours of operation
Hrs4 <- rnorm(3000, mean = 500, sd = 150)
#Set the range for dishwasher capacity between 0-14 loads
#Create a normal distribution for wash capacity
WashCap <- rnorm(3000, mean = 7, sd = 2)
#Set the range for water supply pressure 20-120 PSI
#Create a normal distribution for water supply pressure
SupPres <- rnorm(3000, mean = 70, sd = 10)
#Create binary value for nozzle hole being plugged
NozHosUn1 <- c(0,1)
#Set the seed at a repeatable random value
set.seed(1)
#Create binary random uniform distribution
NozHosUn <- sample(NozHosUn1, size = 3000, replace = TRUE)
#Create logistic regression
z = 1 + 2*NozHosUn + 3*SupPres + 4*WashCap + 5*Hrs4 + 6*WatTemp
z1 <- (z-mean(z))/sd(z)
pr = 1/(1 + exp(-z1))
y <- rbinom(3000, 1, pr)
#Get coefficients of regression
DishWa = data.frame(y = y, NozHosUn = NozHosUn, SupPres = SupPres,
                    WashCap = WashCap, Hrs4 = Hrs4, WatTemp = WatTemp)
glm(y~NozHosUn + SupPres + WashCap + Hrs4 + WatTemp, data = DishWa, 
    family = binomial)
#Get summary statistics for dataset
summary(DishWa)
#Save file
save(DishWa,file="LogitDishWa.Rda")
#Create name for y
names(DishWa)[1] <- "Washing Machine Breakdown"
#Display variable
DishWa[1]
