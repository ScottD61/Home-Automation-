Recommendation System

The study assigns recommendations by creating a Top-N list of jokes for the active user. 


Questions:

1) What items should be recommended to each consumer? 

2) What technologies should be used for the recommending items to consumers?

3) How should the recommendations be evaluated?

Items:

Recommend four items to two different users based on the highest ratings.  


Technology:

The project required RStudio statistical software version 0.98.501 with the Recommenderlab 0.1-4 app for creating and evaluating recommender systems. The Jester5k dataset comes preloaded within Recommenderlab and includes three types of variables: Jokes, Ratings, and User-ID. Jokes, Ratings (-10 to 10), and User-ID contain 100, 362106, and 5000 observations, respectively. 


Evaluation:

K-fold Cross-Validation evaluates the algorithms by plotting the Precision-Recall and Receiver Operating Characteristics (ROC) curves. Popular represents the desired CF algorithm by the greatest area under the ROC curve and the most optimal trade-off in Precision-Recall for all items. 