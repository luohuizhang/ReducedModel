rm pca.result
echo Heat3d
./pca ../Inputdata/Heat3d.dat.b 192 192 192 >>pca.result

echo Laplace
./pca ../Inputdata/Laplace.dat.b 960 960 >>pca.result 

echo Wave
./pca ../Inputdata/Wave.dat.b 80 512 >>pca.result

echo Sedov
./pca ../Inputdata/Sedov_pres.dat.b 200 200 >>pca.result

echo Astro
./pca ../Inputdata/astro.dat 256 256 >>pca.result
#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
./pcafloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  500 500 10 >>pca.result

echo CESM-ATM
./pcafloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat 180 360 10 >>pca.result


echo NYX
./pcafloat /media/luo/CODAR/512x512x512/temperature.dat 512 512 5 >>pca.result


echo XGC
./pca /media/luo/CODAR/XGC/xgc.3d.08100.dat 512 20694 >>pca.result


echo SD
./pca /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi 500 500 500 11 >>pca.result

