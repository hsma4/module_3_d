
#In R, the function rnorm() allows us to generate observations
#from the Normal distribution
#We can use the following command to get info on how to use that function:
?rnorm


#Number of observations to generate:
N <- 1000000

#Parameters of the distribution:
mean_value <- 0
variance <- 1

#In rnorm() we need to use the standard deviation (sd), which is the square root
#of the variance
st_dev <- sqrt(variance)

#Now we can generate the data:
data <- rnorm(N, mean = mean_value, sd = st_dev)

#We plot a histogram of the data:
hist(data, breaks = 500, freq = FALSE)

#Mean value estimated from the data:
estimated_mean <- mean(data)

#Then, repeat the above by increasing N and observing how the histogram gets
#more and more similar to the probability density function of the Normal
#distribution and the estimated mean value get closer and closer 
#to the theoretical mean value of the Normal distribution





