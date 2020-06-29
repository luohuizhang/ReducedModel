import matplotlib.pyplot as plt
import numpy as np

import sys
import array
import os
import re 

name_hat = "/home/luo/Dropbox/SC2018/TOB/figures/"
namelist=["Heat3d","Laplace","Wave","Sedov","Astro","Hurricane","CESM-ATM","NYX","XGC","S3D"]
CR = np.loadtxt("SZ.result.dat")
x=range(0,10)
CR=CR.reshape(10,3)
y1 =CR[:,0]
y2 =CR[:,1]
y3= CR[:,2]

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
width = 0.23       # the width of the bars

ax = fig.add_subplot(111)



rects1 = ax.bar(ind-width, y1, width, color='g',hatch='.',label="PCA")
rects2 = ax.bar(ind, y2, width, color='r',hatch='+',label="SVD")
rects3 = ax.bar(ind+width, y3, width, color='b',hatch='x',label="Wavelet")
#rects4 = ax.bar(ind+2*width, y4, width, color='y',hatch='/',label="Wavelet")
ax.set_ylabel('Compression ratio',font)
#ax.set_title("ZFP",axis_font)
y_major_locator=plt.MultipleLocator(.1)
ax.yaxis.set_major_locator(y_major_locator)
ax.set_ylim([0,.4])
#ax.set_yscale('log')
ax.set_xticks(ind+width)
ax.set_xticklabels( namelist,rotation=60 )
ax.set_xlim([-0.3,9.8])
ax.legend(loc="upper right",ncol=4, prop=font)
#ax.set_xlabel("(a) ZFP",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'sizeRM.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
plt.show()


