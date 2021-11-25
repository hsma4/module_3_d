
#We first import the code stored in mmsFormulas.R so we have all formulas
#we need for an M/M/s system (to make things easier, make sure your working
#directory is set as the one containing the file mmsFormulas.R)
source("mmsFormulas.R")


##################### Case 1 ##############################################

service_time <- 7.5 #minutes
arrival_rate <- 100 / 60 #patients per minute - we have divided arrivals per hour by 60 to have same units as service time

lambda <- arrival_rate
mu <- 1 / service_time

largest_capacity <- 20

#smallest possible capacity
smallest_capacity <- ceiling( lambda / mu ) #otherwise traffic intensity > 1

#We can build some data object where we can summarise the results
#initialised with the results for the smallest possible capacity
resultsCase1 <- data.frame(
                      Capacity = smallest_capacity,
                      TrafficIntensity = round( lambda / ( mu * smallest_capacity ) , 2),
                      CustomersInQueue = round( mmsQueueCustomers(lambda,mu,smallest_capacity), 2 ),
                      WaitingTime = round( mmsQueueTime(lambda,mu,smallest_capacity), 2 ),
                      CustomersInSystem = round( mmsSystemCustomers(lambda,mu,smallest_capacity), 2 ),
                      SojournTime = round( mmsSystemTime(lambda,mu,smallest_capacity), 2 )
                ) 

#We then compute results for the other capacity values and append them to
#the dataframe
for(capacity in (smallest_capacity+1):largest_capacity){
  
  resultsCase1 <- rbind(resultsCase1,
                              c(
                                capacity,
                                round( lambda / ( mu * capacity ), 2 ),
                                round( mmsQueueCustomers(lambda,mu,capacity), 2 ),
                                round( mmsQueueTime(lambda,mu,capacity), 2 ),
                                round( mmsSystemCustomers(lambda,mu,capacity), 2 ),
                                round( mmsSystemTime(lambda,mu,capacity), 2 )
                              )
                  )
  
}




##################### Case 2 ##############################################

service_time <- 2.5 #days
arrival_rate <- 5 #patients per day

lambda <- arrival_rate
mu <- 1 / service_time

largest_capacity <- 20

#smallest possible capacity
smallest_capacity <- ceiling( lambda / mu ) #otherwise traffic intensity > 1

#We can build some data object where we can summarise the results
#initialised with the results for the smallest possible capacity
resultsCase2 <- data.frame(
                      Capacity = smallest_capacity,
                      TrafficIntensity = round( lambda / ( mu * smallest_capacity ), 2 ),
                      CustomersInQueue = round( mmsQueueCustomers(lambda,mu,smallest_capacity), 2 ),
                      WaitingTime = round( mmsQueueTime(lambda,mu,smallest_capacity), 2 ),
                      CustomersInSystem = round( mmsSystemCustomers(lambda,mu,smallest_capacity), 2 ),
                      SojournTime = round( mmsSystemTime(lambda,mu,smallest_capacity), 2 )
                ) 

#We then compute results for the other capacity values and append them to
#the dataframe
for(capacity in (smallest_capacity+1):largest_capacity){
  
  resultsCase2 <- rbind(resultsCase2,
                              c(
                                capacity,
                                round( lambda / ( mu * capacity ), 2 ),
                                round( mmsQueueCustomers(lambda,mu,capacity), 2 ),
                                round( mmsQueueTime(lambda,mu,capacity), 2 ),
                                round( mmsSystemCustomers(lambda,mu,capacity), 2 ),
                                round( mmsSystemTime(lambda,mu,capacity), 2 )
                                )
                  )
  
}






