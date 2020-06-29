import matplotlib.pyplot as plt
import numpy as np

import sys
import array
import os
import re 

name_hat = "/home/luo/Dropbox/SC2018/TOB/figures/"
namelist=["Heat3d","Laplace","Wave","Sedov","Astro","Hurricane","CESM-ATM","NYX","XGC","S3D"]
data = np.loadtxt("ZFP.result.dat")
data=data.reshape(-1,3)
x=range(0,10)
CR=data[0:40,0]
CR=CR.reshape(10,4)
y1 =CR[:,0]
y2 =CR[:,1]
y3= CR[:,2]
y4= CR[:,3]
for i in range(0,10):
    y2[i]=y2[i]/y1[i]
    y3[i]=y3[i]/y1[i]
    y4[i]=y4[i]/y1[i]
fig = plt.figure(num=None,figsize=(20,6))
#fig = plt.figure()
print np.shape(x)
axis_font = {'size':'32'}
plt.rc('xtick', labelsize=32)          # fontsize of the tick labels
plt.rc('ytick', labelsize=32)
font = {'size':'32'}

N = len(x)
print N
ind = np.arange(N)  # the x locations for the groups
width = 0.22       # the width of the bars

ax = fig.add_subplot(111)



#rects1 = ax.bar(ind-width, y1, width, color='g',hatch='.',label="Raw")
rects2 = ax.bar(ind, y2, width, color='r',hatch='+',label="PCA")
rects3 = ax.bar(ind+width, y3, width, color='b',hatch='x',label="SVD")
rects4 = ax.bar(ind+2*width, y4, width, color='y',hatch='/',label="Wavelet")
ax.set_ylabel('Normalized time',font)
#ax.set_title("ZFP",axis_font)
#ax.set_yscale('log')
#ax.set_ylim([1E-9,1E-2])
ax.set_xticks(ind+width)
ax.set_xticklabels( namelist,rotation=60 )
ax.set_xlim([-0.1,9.8])
ax.legend(loc="upper right",ncol=4, prop=font)
ax.set_xlabel("(a) Compression",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CompressTime.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()


data = np.loadtxt("ZFP.result.dat")
data=data.reshape(-1,3)
x=range(0,10)
CR=data[0:40,1]
CR=CR.reshape(10,4)
y5 =CR[:,0]
y6 =CR[:,1]
y7= CR[:,2]
y8= CR[:,3]

for i in range(0,10):
    y6[i]=y6[i]/y5[i]
    y7[i]=y7[i]/y5[i]
    y8[i]=y8[i]/y5[i]
fig = plt.figure(num=None,figsize=(20,6))
#fig = plt.figure()
print np.shape(x)
ax = fig.add_subplot(111)



rects2 = ax.bar(ind, y6, width, color='r',hatch='+',label="Z-order+zMesh")
rects3 = ax.bar(ind+width, y7, width, color='b',hatch='x',label="Hilbert")
rects4 = ax.bar(ind+2*width, y8, width, color='y',hatch='/',label="Hilbert+zMesh")
ax.set_ylabel('Normalized time',font)
#ax.set_yscale('log')
#ax.set_ylim([1E-9,1E-2])
#y_major_locator=plt.MultipleLocator(100)
#ax.yaxis.set_major_locator(y_major_locator)
#ax.set_title("SZ",axis_font)
ax.set_xticks(ind+width)
ax.set_xticklabels( namelist ,rotation=60)
ax.set_xlim([-0.1,9.8])
#ax.legend(loc=2,ncol=2, prop=font)
ax.set_xlabel("(b) Decompression",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'DecompressTime.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()



