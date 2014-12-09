#Samsung Plasma T.V. PN1F85500AF
#Create Data
#Set the seed for pseudo randomization
set.seed(5)
#Set the range for operating room temperature between 0-35 degrees celcius
#Create a normal distribution for operating room temperature in celcius
OpTemp <- rnorm(3000, mean = 17.5, sd = 4)
#Set the range for hours of operation between 0-2500 hours
#Create a normal distribution for hours of operation
Hrs3 <- rnorm(3000, mean = 1250, sd = 320)
#Set the range operating humidity between 20-80% humidity
#Create a normal distribution for humidity in percentage
Hum1 <- rnorm(3000, mean = 50, sd = 10)
#Create logistic regression
z1 = 1 + 2*OpTemp + 3*Hrs3 + 4*Hum1 
z <- (z-mean(z))/sd(z1)
pr = 1/(1 + exp(-z))
y <- rbinom(3000, 1, pr)
#Get coefficients of regression
TV = data.frame(y = y, OpTemp = OpTemp, Hum1 = Hum1, Hrs3 = Hrs3)
glm(y ~ OpTemp + Hum1 + Hrs4, data = TV, family = binomial)
#Get summary statistics for dataset
summary(TV)
#Save file
save(TV, file = "LogitTV.Rda")
#Create name for y
names(TV)[1] <- "TV Breakdown"
#Display variable
TV[1]