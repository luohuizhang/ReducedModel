import matplotlib.pyplot as plt
import numpy as np

import sys
import array
import os
import re 

name_hat = "/home/luo/Dropbox/SC2018/TOB/figures/"
namelist=["Heat3d","Laplace","Wave","Sedov","Astro","Hurricane","CESM-ATM","NYX","XGC","S3D"]
data = np.loadtxt("SZ.txt")
data=data.reshape(60,31)
axis_font = {'size':'42'}
plt.rc('xtick', labelsize=42)          # fontsize of the tick labels
plt.rc('ytick', labelsize=42)
font = {'size':'32'}

fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()


ax = fig.add_subplot(111)

ax.scatter(data[55,:],data[54,:],color='red',marker='o',label="Raw")
ax.scatter(data[57,:],data[56,:],color='b',marker='v',label="PCA")
ax.scatter(data[59,:],data[58,:],color='g',marker='s',label="SVD")

ax.set_title("S3D",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,300]);
ax.set_xlim([min(data[55,:])/2,max(data[55,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_S3D.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
plt.show()

fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()


ax = fig.add_subplot(111)

ax.scatter(data[49,:],data[48,:],color='red',marker='o',label="Raw")
ax.scatter(data[51,:],data[50,:],color='b',marker='v',label="PCA")
ax.scatter(data[53,:],data[52,:],color='g',marker='s',label="SVD")

ax.set_title("XGC",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,500]);
ax.set_xlim([min(data[49,:])/2,max(data[49,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_XGC.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()


fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()


ax = fig.add_subplot(111)

ax.scatter(data[43,:],data[42,:],color='red',marker='o',label="Raw")
ax.scatter(data[45,:],data[44,:],color='b',marker='v',label="PCA")
ax.scatter(data[47,:],data[46,:],color='g',marker='s',label="SVD")

ax.set_title("NYX",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,500]);
ax.set_xlim([min(data[43,:])/2,max(data[43,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_NYX.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()


fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()


ax = fig.add_subplot(111)

ax.scatter(data[37,:],data[36,:],color='red',marker='o',label="Raw")
ax.scatter(data[39,:],data[38,:],color='b',marker='v',label="PCA")
ax.scatter(data[41,:],data[40,:],color='g',marker='s',label="SVD")

ax.set_title("CESM-ATM",axis_font)
ax.set_ylim([0,500])
ax.set_xscale('log')
#ax.set_ylim([0,60]);
ax.set_xlim([min(data[37,:])/2,max(data[37,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_CESM-ATM.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()

fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()


ax = fig.add_subplot(111)

ax.scatter(data[31,:],data[30,:],color='red',marker='o',label="Raw")
ax.scatter(data[33,:],data[32,:],color='b',marker='v',label="PCA")
ax.scatter(data[35,:],data[34,:],color='g',marker='s',label="SVD")

ax.set_ylabel('Compression ratio',font)
ax.set_title("Hurricane",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,500]);
ax.set_xlim([min(data[31,:])/2,max(data[31,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_Hurricane.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()

fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()


ax = fig.add_subplot(111)

ax.scatter(data[25,:],data[24,:],color='red',marker='o',label="Raw")
ax.scatter(data[27,:],data[26,:],color='b',marker='v',label="PCA")
ax.scatter(data[29,:],data[28,:],color='g',marker='s',label="SVD")

ax.set_title("Astro",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,250]);
ax.set_xlim([min(data[25,:])/2,max(data[25,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_Astro.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()

fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()

ax = fig.add_subplot(111)

ax.scatter(data[19,:],data[18,:],color='red',marker='o',label="Raw")
ax.scatter(data[21,:],data[20,:],color='b',marker='v',label="PCA")
ax.scatter(data[23,:],data[22,:],color='g',marker='s',label="SVD")

ax.set_title("Sedov",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,1000]);
ax.set_xlim([10**-8,max(data[19,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_Sedov.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()

fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()

ax = fig.add_subplot(111)

ax.scatter(data[13,:],data[12,:],color='red',marker='o',label="Raw")
ax.scatter(data[15,:],data[14,:],color='b',marker='v',label="PCA")
ax.scatter(data[17,:],data[16,:],color='g',marker='s',label="SVD")

ax.set_title("Wave",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,1000]);
ax.set_xlim([min(data[13,:])/2,max(data[13,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_Wave.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()

fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()

ax = fig.add_subplot(111)

ax.scatter(data[7,:],data[6,:],color='red',marker='o',label="Raw")
ax.scatter(data[9,:],data[8,:],color='b',marker='v',label="PCA")
ax.scatter(data[11,:],data[10,:],color='g',marker='s',label="SVD")

ax.set_title("Laplace",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,2000]);
ax.set_xlim([min(data[7,:])/2,max(data[7,:])*2])
#ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_Laplace.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()


fig = plt.figure(num=None,figsize=(8,6))
#fig = plt.figure()


ax = fig.add_subplot(111)

ax.scatter(data[1,:],data[0,:],color='red',marker='o',label="Raw")
ax.scatter(data[3,:],data[2,:],color='b',marker='v',label="PCA")
ax.scatter(data[5,:],data[4,:],color='g',marker='s',label="SVD")

ax.set_ylabel('Compression ratio',font)
ax.set_title("Heat3d",axis_font)
#ax.set_ylim([0,200])
ax.set_xscale('log')
ax.set_ylim([0,500]);
ax.set_xlim([min(data[1,:])/2,max(data[1,:])*2])
ax.legend(loc="upper left",ncol=1, fontsize=28)
#ax.set_xlabel("(a) Heat3d",{'family' : 'Times New Roman', 'size'   : 36})
#plt.tight_layout()

plt.savefig(name_hat+'CR_RMSE_SZ_Heat3d.pdf', format='pdf',bbox_inches="tight",pad_inches=0)
#plt.show()


