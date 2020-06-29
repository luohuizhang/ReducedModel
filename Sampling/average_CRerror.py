import matplotlib.pyplot as plt
import numpy as np

import sys
import array
import os
import re 

name_hat = "/home/luo/Dropbox/SC2018/TOB/figures/"
namelist=["Heat3d","Laplace","Wave","Sedov","Astro","Hurricane","CESM-ATM","NYX","XGC","S3D"]
pcaZFPcrlist=["pcaZFPcr.result","pcaZFPcrPS0.01.result","pcaZFPcrPS0.05.result","pcaZFPcrPS0.1.result","pcaZFPcrES0.01.result","pcaZFPcrES0.05.result","pcaZFPcrES0.1.result","pcaZFPcrRS0.01.result","pcaZFPcrRS0.05.result","pcaZFPcrRS0.1.result"]
pcaSZcrlist=["pcaSZcr.result","pcaSZcrPS0.01.result","pcaSZcrPS0.05.result","pcaSZcrPS0.1.result","pcaSZcrES0.01.result","pcaSZcrES0.05.result","pcaSZcrES0.1.result","pcaSZcrRS0.01.result","pcaSZcrRS0.05.result","pcaSZcrRS0.1.result"]

svdZFPcrlist=["svdZFPcr.result","svdZFPcrPS0.01.result","svdZFPcrPS0.05.result","svdZFPcrPS0.1.result","svdZFPcrES0.01.result","svdZFPcrES0.05.result","svdZFPcrES0.1.result","svdZFPcrRS0.01.result","svdZFPcrRS0.05.result","svdZFPcrRS0.1.result"]
svdSZcrlist=["svdSZcr.result","svdSZcrPS0.01.result","svdSZcrPS0.05.result","svdSZcrPS0.1.result","svdSZcrES0.01.result","svdSZcrES0.05.result","svdSZcrES0.1.result","svdSZcrRS0.01.result","svdSZcrRS0.05.result","svdSZcrRS0.1.result"]

waveletZFPcrlist=["waveletZFPcr.result","waveletZFPcrPS0.01.result","waveletZFPcrPS0.05.result","waveletZFPcrPS0.1.result","waveletZFPcrES0.01.result","waveletZFPcrES0.05.result","waveletZFPcrES0.1.result","waveletZFPcrRS0.01.result","waveletZFPcrRS0.05.result","waveletZFPcrRS0.1.result"]
waveletSZcrlist=["waveletSZcr.result","waveletSZcrPS0.01.result","waveletSZcrPS0.05.result","waveletSZcrPS0.1.result","waveletSZcrES0.01.result","waveletSZcrES0.05.result","waveletSZcrES0.1.result","waveletSZcrRS0.01.result","waveletSZcrRS0.05.result","waveletSZcrRS0.1.result"]
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
   cr= functionread(pcaZFPcrlist[0])
   #print cr
   cr1= functionread(pcaZFPcrlist[i])
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
   cr= functionread(pcaSZcrlist[0])
   #print cr
   cr1= functionread(pcaSZcrlist[i])
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
   cr= functionread(svdZFPcrlist[0])
   #print cr
   cr1= functionread(svdZFPcrlist[i])
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
   cr= functionread(svdSZcrlist[0])
   #print cr
   cr1= functionread(svdSZcrlist[i])
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
   cr= functionread(waveletZFPcrlist[0])
   #print cr
   cr1= functionread(waveletZFPcrlist[i])
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
   cr= functionread(waveletSZcrlist[0])
   #print cr
   cr1= functionread(waveletSZcrlist[i])
   #print cr1
   # data = np.loadtxt(pcalist[0])
   # loss=data[:,0]
   # data = np.loadtxt(pcalist[i])
   # loss1=data[:,0]
   Err=0.0;
   for j in range(0,10):
       Err=Err+abs(cr1[j]-cr[j])/cr[j]
   print Err/10 


