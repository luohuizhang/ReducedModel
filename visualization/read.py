from __future__ import division
import numpy as np
import adios as ad
import matplotlib.pyplot as plt


nameHat="xgc.3d.08"
for i in range(1,10):
        filename=nameHat+str(i)+"00"
	f = ad.file(filename+".bp")
        dpot=f['dpot']
        print dpot
        print dpot[0][0],dpot[100][11]
        dpot_np=np.zeros((20694,512))
	for k in range(0,512):
                 dpot_np[:,k]=dpot[:,k]
		 #for j in range(0,20694):
                	#dpot_np[j][k]=dpot[j][k]
	print dpot[:,100] 
	print dpot_np[:,100] 
        print dpot_np
        dpot_np.tofile(filename+".dat") 
     ## '0' plane only  ,
#dpot = f['dpot'][:,0]  
#fmesh = ad.file('xgc.mesh.bp')  
#rz = fmesh['/coordinates/values'][:]  
#conn = fmesh['/cell_set[0]/node_connect_list'][:]  
#R = rz[:,0]  
#Z = rz[:,1]  
#plt.figure(2)  
#plt.rc('xtick', labelsize=24)          # fontsize of the tick labels  ,
#plt.rc('ytick', labelsize=24)     
#axis_font = {'fontname':'Arial', 'size':'30'}  
#plt.gcf().subplots_adjust(left=0.2,bottom=0.20)  
#plt.xlabel('R', **axis_font)  
#plt.ylabel('Z',**axis_font )  
#plt.tricontourf(R, Z, conn, dpot,cmap=plt.cm.jet, levels=np.linspace(-120,120,num=1000));  
#plt.colorbar() 
#plt.show()



