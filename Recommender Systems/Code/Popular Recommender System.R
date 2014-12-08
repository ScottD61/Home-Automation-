# load recommenderlab
library("recommenderlab")
# load data 
data(Jester5k)
# Data Properties
Jester5k
# Query registry for recommendation methods 
recommenderRegistry$get_entries(dataType = "realRatingMatrix")
# Create IBCF Recommender System 
r <- Recommender(Jester5k, method = "POPULAR")
# Describe Recommender
r
# Get recommendation systems
names(getModel(r))
# Get top-N model
getModel(r)$topN
# Create top-5 list from POPULAR recommender system for users 1001 and 1002
recom <- predict(r, Jester5k[1001:1002,], n=5)
# Describe recommendations
recom
# Show recommended items
as(recom, "list")       
# Evaluate recommender  
# Create evaluation scheme
# 4-fold cross-validation        
scheme <- evaluationScheme(Jester5k, method="cross", k=4, given=3, 
                           goodRating=5) 
#Describe scheme
scheme
# Evaluate recommender method IBCF
# Evaluate top-3 list
results <- evaluate(scheme, method="POPULAR", n=c(1,3,5,10,15,20)) 
# Display results
results
# View confusion matrix for first fold
getConfusionMatrix(results)[[1]] 
# Average results for 4-fold cross-validation
avg(results) 
# ROC curve plot
plot(results, annotate=TRUE)
# Precision-recall plot
plot(results, "prec/rec", annotate=TRUE)
