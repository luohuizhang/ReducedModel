import matplotlib.pyplot as plt
import numpy as np

import sys
import array
import os
import re 

name_hat = "/home/luo/Dropbox/SC2018/TOB/figures/"
namelist=["Heat3d","Laplace","Wave","Sedov","Astro","Hurricane","CESM-ATM","NYX","XGC","S3D"]
pcalist=["pca.result","pcaPS0.01.result","pcaPS0.05.result","pcaPS0.1.result","pcaES0.01.result","pcaES0.05.result","pcaES0.1.result","pcaRS0.01.result","pcaRS0.05.result","pcaRS0.1.result"]
svdlist=["svd.result","svdPS0.01.result","svdPS0.05.result","svdPS0.1.result","svdES0.01.result","svdES0.05.result","svdES0.1.result","svdRS0.01.result","svdRS0.05.result","svdRS0.1.result"]
waveletlist=["wavelet.result","waveletPS0.01.result","waveletPS0.05.result","waveletPS0.1.result","waveletES0.01.result","waveletES0.05.result","waveletES0.1.result","waveletRS0.01.result","waveletRS0.05.result","waveletRS0.1.result"]


PC=np.zeros((10,4),dtype=float)
for i in range(1,10):
    data = np.loadtxt(pcalist[0])
    loss=data[:,0]
    data = np.loadtxt(pcalist[i])
    loss1=data[:,0]
    Err=0.0;
    for j in range(0,10):
        Err=Err+abs(loss1[j]-loss[j])/loss[j]
    print Err/10 


for i in range(1,10):
    data = np.loadtxt(svdlist[0])
    loss=data[:,0]
    data = np.loadtxt(svdlist[i])
    loss1=data[:,0]
    Err=0.0;
    for j in range(0,10):
        Err=Err+abs(loss1[j]-loss[j])/loss[j]
    print Err/10 

for i in range(1,10):
    data = np.loadtxt(waveletlist[0])
    loss=np.array(data)
    data = np.loadtxt(waveletlist[i])
    loss1=np.array(data)
    Err=0.0;
    for j in range(0,10):
	if loss[j]>0:
            Err=Err+abs(loss1[j]-loss[j])/loss[j]
    print Err/10 
