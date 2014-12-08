# Load recommenderlab
library(recommenderlab) 
# Load visualization app
library(ggplot2) 
# Load Jester5k dataset
data(Jester5k)
# Data Properties
Jester5k
# Visualizing items by rows
image(sample(Jester5k, 30), main = "Raw Ratings")
# Normalize dataset
r <- normalize(Jester5k)
# Visualizing ratings
image(sample(r, 30), main = "Normalized Ratings")
# Visualizing ratings
qplot(getRatings(Jester5k), binwidth = 1, 
      main = "Histogram of ratings", xlab = "Rating")
# Visualization properties
summary(getRatings(Jester5k)) 
# Normalize ratings
qplot(getRatings(normalize(Jester5k, method = "Z-score")),
      binwidth = 1, main = "Normalized ratings histogram", xlab = "Rating") 
# Visualization properties
summary(getRatings(normalize(Jester5k, method = "Z-score")))
# Jokes rated on average
qplot(rowCounts(Jester5k), binwidth = 10, 
      main = "Jokes Rated on Average", 
      xlab = "# of users", 
      ylab = "# of jokes rated")
# Mean rating of each movie
qplot(colMeans(Jester5k), binwidth = .1, 
      main = "Mean Rating of Jokes", 
      xlab = "Rating", 
      ylab = "# of Jokes")

