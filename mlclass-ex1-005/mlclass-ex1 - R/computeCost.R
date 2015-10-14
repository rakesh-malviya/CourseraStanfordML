computeCost <- function(X,y,theta)
{
  m = length(y)
  Htheta = X%*%theta;
  Jtheta = sum((Htheta - y)^2)/(2*m)
  return(Jtheta)
}