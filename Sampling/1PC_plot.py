import matplotlib.pyplot as plt
import numpy as np

import sys
import array
import os
import re 

name_hat = "/home/luo/Dropbox/SC2018/TOB/figures/"
namelist=["Heat3d","Laplace","Wave","Sedov","Astro","Hurricane","CESM-ATM","NYX","XGC","S3D"]
filelist=["pca.result","pcaPS0.05.result","pcaES0.05.result","pcaRS0.05.result"]
svdlist=["svd.result","svdPS0.05.result","svdES0.05.result","svdRS0.05.result"]

axis_font = {'size':'32'}
plt.rc('xtick', labelsize=32)          # fontsize of the tick labels
plt.rc('ytick', labelsize=32)
font = {'size':'32'}
PC=np.zeros((10,4),dtype=float)
x=range(0,10)
N = len(x)
print N
ind = np.arange(N)  # the x locations for the groups
width = 0.2       # the width of the bars

i=0
for filename in filelist:
    data = np.loadtxt(filename)
    PC[:,i]=data[:,0]
    i=i+1

fig = plt.figure(num=None,figsize=(20,6))
#fig = plt.figure()
print np.shape(x)


ax = fig.add_subplot(111)



rects1 = ax.bar(ind-width, PC[:,0], width, color='g',hatch='.',label="Full")
rects2 = ax.bar(ind, PC[:,1], width, color='r',hatch='+',label="PS")
rects3 = ax.bar(ind+width, PC[:,2], width, color='b',hatch='x',label="US")
rects4 = ax.bar(ind+2*width, PC[:,3], width, color='y',hatch='/',label="RS")
ax.set_ylabel('1st PC',font)
#ax.set_title("ZFP",axis_font)
#ax.set_ylim([0,200])
#y_major_locator=plt.MultipleLocator(30)
#ax.yaxis.set_major_locator(y_major_locator)
ax.set_xticks(ind+width)
ax.set_xticklabels( namelist,rotation=60 )
ax.set_xlim([-0.3,9.8])
ax.legend(loc="upper right",ncol=4,bbox_to_anchor=(0.9, 1.25), prop=font)
ax.set_xlabel("(a) PCA",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'1PC_sampling.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()


i=0
for filename in svdlist:
    print filename
    data = np.loadtxt(filename)
    PC[:,i]=data[:,0]
    i=i+1

fig = plt.figure(num=None,figsize=(20,6))
#fig = plt.figure()
print np.shape(x)


ax = fig.add_subplot(111)



rects1 = ax.bar(ind-width, PC[:,0], width, color='g',hatch='.',label="Full")
rects2 = ax.bar(ind, PC[:,1], width, color='r',hatch='+',label="PS")
rects3 = ax.bar(ind+width, PC[:,2], width, color='b',hatch='x',label="US")
rects4 = ax.bar(ind+2*width, PC[:,3], width, color='y',hatch='/',label="RS")
ax.set_ylabel('1st PC',font)
#ax.set_title("ZFP",axis_font)
#ax.set_ylim([0,200])
#y_major_locator=plt.MultipleLocator(30)
#ax.yaxis.set_major_locator(y_major_locator)
ax.set_xticks(ind+width)
ax.set_xticklabels( namelist,rotation=60 )
ax.set_xlim([-0.3,9.8])
#ax.legend(loc="upper right",ncol=4,bbox_to_anchor=(0.9, 1.25), prop=font)
ax.set_xlabel("(b) SVD",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'1PC_sampling_SVD.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()

