## Machine Learning Online Class - Exercise 1: Linear Regression

#  Instructions
#  ------------
  # 
#  This file contains code that helps you get started on the
#  linear exercise. You will need to complete the following functions 
#  in this exericse:
  #
#     warmUpExercise.R
#     plotData.R
#     gradientDescent.R
#     computeCost.R
#     gradientDescentMulti.R
#     computeCostMulti.R
#     featureNormalize.R
#     normalEqn.R
#
#  For this exercise, you will not need to change any code in this file,
#  or any other files other than those mentioned above.
#
# x refers to the population size in 10,000s
# y refers to the profit in $10,000s
#

## Initialization
rm(list = ls()) # same as clear in matlab #clears workspace
graphics.off()  # same as close all in matlab # closes plots and figures
cat("014")      # same as clc in matlab to clear console

##==================== Part 1: Basic Function ====================
# Complete warmUpExercise.R
print('Running warmUpExercise ... ')
print('5x5 Identity Matrix: ')
source('warmUpExercise.R')
print(warmUpExercise())

print('Program paused. Press enter to continue.')
readline()

## ======================= Part 2: Plotting =======================
print('Plotting Data ...\n')
data <- data.matrix(read.csv("ex1data1.txt",header = FALSE, sep = ","))
X <- data[,1]
y <- data[,2]
m <- length(y) # number of training examples

# Plot data 
# Note: You have to complete the code in plotData.R
source("plotData.R")
plotData(X,y)

print('Program paused. Press enter to continue.')
readline()

## =================== Part 3: Gradient descent ===================
print('Running Gradient Descent ...')

X <- cbind(rep(1,m),X) #Add a column of ones to x
theta <- matrix(0,2,1);
# Some gradient descent settings
iterations = 1500
alpha = 0.01
source("computeCost.R")
cat("Min J(Theta=[0 0]):")
print(computeCost(X,y,theta))

print('Program paused. Press enter to continue.')
readline()

source("gradientDescent.R")
resultList <- gradientDescent(X,y,theta,alpha,iterations)
theta <- resultList[[1]]

cat("Min J(Theta):")
print(computeCost(X,y,theta))

J_history <- resultList[[2]]

print('Program paused. Will plot line. Press enter to continue.')
readline()

lines(X[,2],X%*%theta,col=73)

print('Program paused. Will do some prediction. Press enter to continue.')
readline()

predict1 <- matrix(c(1,3.5),1,2)%*%theta
predict2 <- matrix(c(1,7.0),1,2)%*%theta
cat("\nPrediction for 35000:",predict1*10000)
cat("\nPrediction for 70000:",predict2*10000)
cat('\nProgram paused. Press enter to continue.')
readline()


#=========Visualize J(Theta)=================
print("Visualize J(Theta).....")


theta0 <- seq(-10,10,len=100)
theta1 <- seq(-1,3.5,len=100)

Jvalues <- matrix(0,length(theta0),length(theta1))
print("Press enter to continue.");
readline()
for (i in 1:length(theta0))
{
  for (j in 1:length(theta1))
  {
    t <- c(theta0[i],theta1[j])
    Jvalues[i,j] <- computeCost(X,y,t)
    
  }
}
graphics.off()
print("Calculated Jvalues ploting data on surface.....")

persp3d(theta0,theta1,Jvalues,xlab="theta0",ylab="theta1",col = "red",shade = 1)


print("Calculated Jvalues ploting data on contour. Press Enter to continue...")
readline()
graphics.off()
contour(theta0,theta1,Jvalues,levels = c(4.6,6,12,20,50,100,200),labcex = "1",col = "red")

