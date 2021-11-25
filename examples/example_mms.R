
#We first import the code stored in mmsFormulas.R so we have all formulas
#we need for an M/M/s system (to make things easier, make sure your working
#directory is set as the one containing the file mmsFormulas.R)
source("mmsFormulas.R")



lambda <- 4.5
mu <- 1 / 2

s <- 10


#probability of having 0 patients in the clinic
mmsProb0(lambda,mu,s)

#probability of having 8 patients in the clinic
mmsProbN(8,lambda,mu,s)

#expected number of patients waiting to be served
mmsQueueCustomers(lambda,mu,s)

#expected waiting time before being served
mmsQueueTime(lambda,mu,s)

#expected number of patients in the clinic
mmsSystemCustomers(lambda,mu,s)

#expected sojourn time
mmsSystemTime(lambda,mu,s)




lambda <- 3

#probability of having 0 patients in the clinic
mmsProb0(lambda,mu,s)

#probability of having 8 patients in the clinic
mmsProbN(8,lambda,mu,s)

#expected number of patients waiting to be served
mmsQueueCustomers(lambda,mu,s)

#expected waiting time before being served
mmsQueueTime(lambda,mu,s)

#expected number of patients in the clinic
mmsSystemCustomers(lambda,mu,s)

#expected sojourn time
mmsSystemTime(lambda,mu,s)


