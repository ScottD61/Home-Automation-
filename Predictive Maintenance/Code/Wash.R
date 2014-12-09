#Samsung Washing Machine WA50F9A7DSW/A2
#Create Data
#Set the seed for pseudo randomization
set.seed(5)
#Set the range for hours of operation between 0-600 hours
#Create a normal distribution for hours of operation
Hrs6 <- rnorm(3000, mean = 300, sd = 75)
#Set the range for washing machine capacity between 0-5 cu.ft 
#Create a normal distribution for wash capacity
WashCap <- rnorm(3000, mean = 3, sd = 0.5)
#Set the range for spin speed between 0-1100 rpm
#Create a normal distribution for spin speed
SpinS <- rnorm(3000, mean = 650, sd = 150)
#Create logistic regression
z = 1 + 2*DryCap + 3*WashCap + 4*Hrs6 
z1 <- (z-mean(z))/sd(z)
pr = 1/(1 + exp(-z1))
y <- rbinom(3000, 1, pr)
#Get coefficients of regression
Wash = data.frame(y = y, WashCap = WashCap, SpinS = SpinS, 
                 Hrs6 = Hrs6)
glm(y ~ WashCap + SpinS + Hrs6, data = Wash, family = binomial)
#Get summary statistics for dataset
summary(Wash)
#Save file
save(Wash,file = "LogitDry.Rda")
#Create name for y
names(Wash)[1] <- "Dryer Breakdown"
#Display variable
Wash[1]


