from __future__ import division
import numpy as np
import adios as ad
import matplotlib.pyplot as plt
import sys


name_hat = "/home/luo/Dropbox/SC2018/TOB/figures/"

fmesh = ad.file('xgc.mesh.bp')  
rz = fmesh['/coordinates/values'][:]  
conn = fmesh['/cell_set[0]/node_connect_list'][:]  
R = rz[:,0]  
Z = rz[:,1]  

plt.rc('xtick', labelsize=24)          # fontsize of the tick labels  ,
plt.rc('ytick', labelsize=24)     
axis_font = {'fontname':'Times New Roman', 'size':'30'}  

dpot = np.fromfile("SZ.reconstruction")  
dpot=dpot.reshape(-1,512);
dpot1=dpot[:,0]

plt.figure(figsize=(8,6))  
plt.gcf().subplots_adjust(left=0.2,bottom=0.20)  
plt.xlabel('R\n(b) SZ', **axis_font)  
plt.ylabel('Z',**axis_font )  
print len(dpot1)
plt.tricontourf(R, Z, conn, dpot1,cmap=plt.cm.jet, levels=np.linspace(-100,100,num=100));  
cbar=plt.colorbar() 
cbar.set_ticks([-100,-50,0,50,100])
#plt.xlabel("(a) SZ",{'family' : 'Times New Roman', 'size'   : 36})
#cbar.set_ticks(np.linspace(-100,100,40))
plt.savefig(name_hat+'Visulization_SZ.png', format='png',bbox_inches="tight",pad_inches=0)
#plt.savefig(name_hat+'Visulization_SZ.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()


dpot = np.fromfile("pcaRaw.reconstruction")  
dpot=dpot.reshape(-1,512);
dpot1=dpot[:,0]

plt.figure(figsize=(8,6))  
plt.gcf().subplots_adjust(left=0.2,bottom=0.20)  
plt.xlabel('R\n(c) PCA', **axis_font)  
plt.ylabel('Z',**axis_font )  
print len(dpot1)
plt.tricontourf(R, Z, conn, dpot1,cmap=plt.cm.jet, levels=np.linspace(-100,100,num=100));  
cbar=plt.colorbar() 
cbar.set_ticks([-100,-50,0,50,100])
#plt.xlabel("(a) SZ",{'family' : 'Times New Roman', 'size'   : 36})
#cbar.set_ticks(np.linspace(-100,100,40))
plt.savefig(name_hat+'Visulization_pcaRaw.png', format='png',bbox_inches="tight",pad_inches=0)
#plt.show()

dpot = np.fromfile("pcaRed.reconstruction")  
dpot=dpot.reshape(-1,512);
dpot1=dpot[:,0]

plt.figure(figsize=(8,6))  
plt.gcf().subplots_adjust(left=0.2,bottom=0.20)  
plt.xlabel('R\n(d) PCA+ReducedModel', **axis_font)  
plt.ylabel('Z',**axis_font )  
print len(dpot1)
plt.tricontourf(R, Z, conn, dpot1,cmap=plt.cm.jet, levels=np.linspace(-100,100,num=100));  
cbar=plt.colorbar() 
cbar.set_ticks([-100,-50,0,50,100])
#plt.xlabel("(a) SZ",{'family' : 'Times New Roman', 'size'   : 36})
#cbar.set_ticks(np.linspace(-100,100,40))
plt.savefig(name_hat+'Visulization_pcaSZ.png', format='png',bbox_inches="tight",pad_inches=0)
#plt.show()


dpot = np.fromfile("Original.reconstruction")  
dpot=dpot.reshape(-1,512);
dpot1=dpot[:,0]

plt.figure(figsize=(8,6))  
plt.gcf().subplots_adjust(left=0.2,bottom=0.20)  
plt.xlabel('R\n(a) Original', **axis_font)  
plt.ylabel('Z',**axis_font )  
print len(dpot1)
plt.tricontourf(R, Z, conn, dpot1,cmap=plt.cm.jet, levels=np.linspace(-100,100,num=100));  
cbar=plt.colorbar() 
cbar.set_ticks([-100,-50,0,50,100])
#plt.xlabel("(a) SZ",{'family' : 'Times New Roman', 'size'   : 36})
#cbar.set_ticks(np.linspace(-100,100,40))
plt.savefig(name_hat+'Visulization_Original.png', format='png',bbox_inches="tight",pad_inches=0)
#plt.show()
