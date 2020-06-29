import matplotlib.pyplot as plt
import numpy as np

import sys
import array
import os
import re 

name_hat = "/home/luo/Dropbox/SC2018/TOB/figures/"
namelist=["Heat3d","Laplace","Wave","Sedov","Astro","Hurricane","CESM-ATM","NYX","XGC","S3D"]
ZFPlist=["ZFPcr.result","ZFPPS0.01.result","ZFPPS0.05.result","ZFPPS0.1.result","ZFPES0.01.result","ZFPES0.05.result","ZFPES0.1.result","ZFPRS0.01.result","ZFPRS0.05.result","ZFPRS0.1.result"]
SZlist=["SZcr.result","SZPS0.01.result","SZPS0.05.result","SZPS0.1.result","SZES0.01.result","SZES0.05.result","SZES0.1.result","SZRS0.01.result","SZRS0.05.result","SZRS0.1.result"]

def functionread( filename ):
    fp = open(filename, 'r')
    cr=np.zeros(10,dtype=float)
    s = fp.readline()
    i=0
    while s:
        aList = re.findall('([-+]?\d+(\.\d*)?|\.\d+)([eE][-+]?\d+)?',s)
	ss=aList[0]
        aNum = float((ss[0]+ss[2]))
        if i%2==1:
            cr[i/2]=aNum
           # print cr[i/2]
        s=fp.readline();
        i=i+1
    fp.close()
    return cr


for i in range(1,10):
   cr= functionread(ZFPlist[0])
   #print cr
   cr1= functionread(ZFPlist[i])
   #print cr1
   # data = np.loadtxt(pcalist[0])
   # loss=data[:,0]
   # data = np.loadtxt(pcalist[i])
   # loss1=data[:,0]
   Err=0.0;
   for j in range(0,10):
       Err=Err+abs(cr1[j]-cr[j])/cr[j]
   print Err/10 

for i in range(1,10):
   cr= functionread(SZlist[0])
   #print cr
   cr1= functionread(SZlist[i])
   #print cr1
   # data = np.loadtxt(pcalist[0])
   # loss=data[:,0]
   # data = np.loadtxt(pcalist[i])
   # loss1=data[:,0]
   Err=0.0;
   for j in range(0,10):
       Err=Err+abs(cr1[j]-cr[j])/cr[j]
   print Err/10 


