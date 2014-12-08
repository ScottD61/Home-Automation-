#Evaluate recommender systems with normalized data
# Load recommenderlab
library("recommenderlab")
# Load data
data(Jester5k)
# Data properties
Jester5k
# Query registry for recommendation methods 
recommenderRegistry$get_entries(dataType = "realRatingMatrix")
# Evaluate recommender using Splitting
# Create evaluation scheme
# Splitting with 1 run        
scheme <- evaluationScheme(Jester5k, method = "split", train = .9, 
                           k = 1, given = 3, goodRating = 4)
# Display scheme
scheme
# Recommender evaluations
algorithms <- list(
  "random items" = list(name="RANDOM"),
  "popular items" = list(name="POPULAR"),
  "user-based CF" = list(name="UBCF", param=list(method="Cosine",
                                                 nn=50, minRating=3)),
  "item-based CF" = list(name="IBCF")  
)
# Run algorithms
results <- evaluate(scheme, algorithms, n=c(1, 3, 5, 10, 15, 20))
# View results
results
# Draw ROC curve 
plot(results, annotate=1:4, legend="topleft")
# See precision / recall 
plot(results, "prec/rec", annotate=3)