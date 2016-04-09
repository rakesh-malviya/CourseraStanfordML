# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import warmUpExercise as warmEx
import numpy as np
import matplotlib.pyplot as plt
import gradientDescent as gd
from matplotlib import cm

print "Running warmUpExercise ... "
print "5x5 Identity Matrix:"
warmEx.warmUpExercise()

try:
    input('Program paused. Press enter to continue...')
except SyntaxError:
    pass

print 'Plotting Data ...'

""" ======================= Part 2: Plotting ======================= """

data = np.genfromtxt('ex1data1.txt',delimiter=',')
#print data
X = data[:,0]

y = data[:,1]

plt.scatter(X,y)
plt.show()

m = len(y) # number of training examples

try:
    input('Program paused. Press enter to continue...')
except SyntaxError:
    pass

"""======================= Part 3: Gradient descent ======================="""
m = len(y) # number of training examples
X = np.concatenate((np.ones((m,1)),X.reshape(m,-1)),axis=1)
theta = np.zeros((2,1))


# Some gradient descent settings
iterations = 1500;
alpha = 0.01;

print "Jtheta = ",gd.computeCost(X,y,theta)

try:
    input('Program paused. Press enter to continue...')
except SyntaxError:
    pass

theta = gd.gradientDescent(X,y,theta,alpha,iterations)

print "Theta found by gradient descent:", theta[0,0], theta[1,0]


xCord = np.matrix([[1,np.amin(X[:,1])],[1,np.amax(X[:,1])]])
print xCord, theta
Xtheta = np.dot(xCord,theta)
print Xtheta
print xCord[0,1],Xtheta[0,0]
plt.scatter(X[:,1],y)
plt.plot([xCord[0,1],xCord[1,1]],[Xtheta[0,0],Xtheta[1,0]],'k-')
plt.show()


try:
    input('Program paused. Press enter to continue...')
except SyntaxError:
    pass
#print theta
"""======================= Part 4: Gradient descent ======================="""

print 'Visualizing J(theta_0, theta_1) ...'

theta0_vals = np.linspace(-10, 10, 100)
theta1_vals = np.linspace(-1, 4, 100)
#print theta0_vals,theta1_vals


J_vals = np.zeros((len(theta0_vals),len(theta1_vals)))

for i in range(len(theta0_vals)):
    for j in range(len(theta1_vals)):
        t = [theta0_vals[i],theta1_vals[j]]
        J_vals[i,j]=gd.computeCost(X,y,t)
J_vals = np.transpose(J_vals)

from mpl_toolkits.mplot3d import Axes3D
fig = plt.figure()
ax = fig.gca(projection='3d')

tX, tY = np.meshgrid(theta0_vals, theta1_vals)
surf = ax.plot_surface(tX, tY, J_vals, rstride=3, cstride=3,alpha=0.6, cmap=cm.coolwarm_r,
                       linewidth=0, antialiased=False)
fig.colorbar(surf, shrink=0.5, aspect=5)
plt.show()

try:
    input('Program paused. Press enter to continue...')
except SyntaxError:
    pass


#plt.contour(tX,tY,J_vals)
#print J_vals
CS = plt.contour(theta0_vals,theta1_vals,J_vals, np.logspace(-2,3,30)) 
plt.clabel(CS, inline=1, fontsize=10,)
plt.plot(theta[0],theta[1],Marker='x')
plt.show()

print "done"

