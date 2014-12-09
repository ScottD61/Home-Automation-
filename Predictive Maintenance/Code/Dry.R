#Samsung Dryer DV50F9A7EVW/A2
#Create Data
#Set the seed for pseudo randomization
set.seed(5)
#Set the range for hours of operation between 0-600 hours
#Create a normal distribution for hours of operation
Hrs5 <- rnorm(3000, mean = 300, sd = 75)
#Set the range for dryer capacity between 0-7.4 cu.ft 
#Create a normal distribution for wash capacity
DryCap <- rnorm(3000, mean = 4, sd = 1)
#Create binary value for vent being restricted
Vent1 <- c(0,1)
#Set the seed at a repeatable random value
set.seed(1)
#Create binary random uniform distribution
Vent <- sample(Vent1, size = 3000, replace = TRUE)
#Create logistic regression
z = 1 + 2*DryCap + 3*Vent + 4*Hrs5 
z1 <- (z-mean(z))/sd(z)
pr = 1/(1 + exp(-z1))
y <- rbinom(3000, 1, pr)
#Get coefficients of regression
Dry = data.frame(y = y, DryCap = DryCap, SupPres = SupPres, 
                    Hrs5 = Hrs5)
glm(y ~ DryCap + Vent + Hrs5, data = Dry, family = binomial)
#Get summary statistics for dataset
summary(Dry)
#Save file
save(Dry,file = "LogitDry.Rda")
#Create name for y
names(Dry)[1] <- "Dryer Breakdown"
#Display variable
Dry[1]

