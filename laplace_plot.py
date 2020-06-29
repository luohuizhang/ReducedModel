import numpy as np
import matplotlib.pyplot as plt
import sys



#Z=np.fromfile("Inputdata/Laplace.dat.b")
Z=np.loadtxt( sys.argv[1])
Z=Z.reshape(-1,200)
step = 1
x = np.arange(0,200,step)
y = np.arange(0,200,step)

X,Y = np.meshgrid(x,y)
#Z = X**2+Y**2
#plt.figure(figsize=(10,6))
plt.contourf(X,Y,Z)
plt.contour(X,Y,Z)
plt.show()
