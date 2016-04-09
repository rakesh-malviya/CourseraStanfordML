# -*- coding: utf-8 -*-
"""
Created on Fri Apr 08 05:16:24 2016

@author: malvir
"""

import numpy as np

def computeCost(X,y,theta):
    J = 0
    m = len(y)
    Htheta = [X[:,0]*theta[0] + X[:,1]*theta[1]]
    J = (((Htheta - y)**2).sum())/(2*m)
    return J
    
    
def gradientDescent(X, y, theta, alpha, num_iters):
    
    m = len(y)
    J_history = np.zeros((num_iters,1))
    
    for i in range(num_iters):
        HthetaXminusY = X[:,0]*theta[0]+X[:,1]*theta[1] - y

        theta[0] = theta[0] - alpha*(((HthetaXminusY*X[:,0]).sum())/m)
        theta[1] = theta[1] - alpha*(((HthetaXminusY*X[:,1]).sum())/m)
        
        J_history[i] = computeCost(X,y,theta)
        
    
    #print J_history
    
    return theta