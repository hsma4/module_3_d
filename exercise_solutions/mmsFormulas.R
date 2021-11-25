
#Function computing the probability of having 0 customers in an M/M/s system
#at any time in the long term
mmsProb0 <- function(lambda, mu, capacity){
  
  res <- NA
  
  if(lambda > 0 & mu > 0 & capacity==round(capacity)){
    
    rho <- lambda / ( mu * capacity )
    
    if(rho < 1){
      
      d1 <- sum(sapply(1:(capacity-1),function(n){
        
        (lambda/mu)^n / factorial(n)
        
      }))
      
      d2 <- (lambda/mu)^capacity / ( factorial(capacity) * (1 - rho))
      
      res <- 1 / ( d1 + d2 )
      
    }
    
  }
  
  return(res)
  
}


#Function computing the expected number of customers queueing for an M/M/s system
#at any time in the long term
mmsQueueCustomers <- function(lambda, mu, capacity){
  
  res <- NA
  
  if(lambda > 0 & mu > 0 & capacity==round(capacity)){
    
    rho <- lambda / ( mu * capacity )
    
    if(rho < 1){
      
      p0 <- mmsProb0(lambda,mu,capacity)
      
      res <- p0 * rho * (lambda/mu)^capacity / ( factorial(capacity) * (1-rho)^2 )
      
    }
    
  }
  
  return(res)
  
}

#Function computing the expected time spent by a customer in the queue for an M/M/s system
#at any time in the long term
mmsQueueTime <- function(lambda, mu, capacity){
  
  res <- NA
  
  if(lambda > 0 & mu > 0 & capacity==round(capacity)){
    
    rho <- lambda / ( mu * capacity )
    
    if(rho < 1){
      
      queue_length <- mmsQueueCustomers(lambda, mu, capacity)
      
      res <- queue_length / lambda
      
    }
    
  }
  
  return(res)
  
}

#Function computing the expected time spent by a customer in the system for an M/M/s system
#at any time in the long term
mmsSystemTime <- function(lambda, mu, capacity){
  
  res <- NA
  
  if(lambda > 0 & mu > 0 & capacity==round(capacity)){
    
    rho <- lambda / ( mu * capacity )
    
    if(rho < 1){
      
      queue_time <- mmsQueueTime(lambda, mu, capacity)
      
      res <- queue_time + 1 / mu
      
    }
    
  }
  
  return(res)
  
}


#Function computing the expected number of customers in the system for an M/M/s system
#at any time in the long term
mmsSystemCustomers <- function(lambda, mu, capacity){
  
  res <- NA
  
  if(lambda > 0 & mu > 0 & capacity==round(capacity)){
    
    rho <- lambda / ( mu * capacity )
    
    if(rho < 1){
      
      system_time <- mmsSystemTime(lambda, mu, capacity)
      
      res <- system_time * lambda
      
    }
    
  }
  
  return(res)
  
}


#Function computing the probability of having N (with N>0) customers in an M/M/s system
#at any time in the long term
mmsProbN <- function(N, lambda, mu, capacity){
  
  res <- NA
  
  if(lambda > 0 & mu > 0 & capacity==round(capacity)){
    
    rho <- lambda / ( mu * capacity )
    
    if(rho < 1){
      
      p0 <- mmsProb0(lambda,mu,capacity)
      
      if( N < capacity ){
        
        res <- p0 * (lambda/mu)^N / factorial(N)
        
      }else{
        
        res <- p0 * (lambda/mu)^N / ( factorial(capacity) * capacity^(N-capacity) )
        
      }
      
    }
    
  }
  
  return(res)
  
}




