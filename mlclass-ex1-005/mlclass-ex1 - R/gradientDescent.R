gradientDescent <- function(X,y,theta,alpha,iterations)
{
  m <- length(y)
  
  J_history <- matrix(0,iterations,1)
  
  source("computeCost.R")
  
  for (i in 1:iterations)
  {
    #HthetaMinusY = X%*%theta -y
    #theta[1] <- theta[1] - alpha*((sum(HthetaMinusY))/m)
    #theta[2] <- theta[2] - alpha*((sum(HthetaMinusY*X[,2]))/m)
    
    slopTheta <- (t(X)%*%(X%*%theta - y))*(alpha/m)
    theta <- (theta - slopTheta)
    J_history[i] <- computeCost(X,y,theta);
  }
  
  print("Theta for min J(Theta):")
  print(theta)
  
  result <- list(theta,J_history)
}