
#In R, the function rexp() allows us to generate observations
#from the Exponential distribution
#We can use the following command to get info on how to use that function:
?rexp


#Number of observations to generate:
N <- 1000

#Rate of the distribution (1.5 patients per hour):
lambda <- 1.5

#Now we can generate the data:
data <- rexp(N, rate = lambda)

#We plot a histogram of the data:
hist(data)

#We can increase the "resolution" of the histogram using the parameter "breaks"
hist(data, breaks = 500)

#Let's also switch to density (i.e. histogram area normalised to 1);
#this is for better comparison with the theoretical probability distribution
hist(data, breaks = 500, freq = FALSE)

#Expected visit duration (estimated by averaging our data):
exp_duration <- mean(data)


#Probability of a visit taking no more than 1 hour:
#to do this we can count how many times visit time does not exceed 1 hour
#in our simulated observations,
#and then divide by the number of observations we have

is_not_over_1 <- ( data <= 1 )  #TRUE if observation is >1; FALSE otherwise
times_not_over_1 <- sum(is_not_over_1)  #when we sum boolean values, TRUE=1 and FALSE=0

prob_not_over_1 <- times_not_over_1 / N #probability of a visit taking no more than  1 hour




