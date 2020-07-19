rm svd.result
echo Heat3d
./svd ../Inputdata/Heat3d.dat.b 192 192 192 >>svd.result

echo Laplace
./svd ../Inputdata/Laplace.dat.b 960 960 >>svd.result 

echo Wave
./svd ../Inputdata/Wave.dat.b 80 512 >>svd.result

echo Sedov
./svd ../Inputdata/Sedov_pres.dat.b 200 200 >>svd.result

echo Astro
./svd ../Inputdata/astro.dat 256 256 >>svd.result
#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
./svdfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  500 500 10 >>svd.result

echo CESM-ATM
./svdfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat 180 360 10 >>svd.result


echo NYX
./svdfloat /media/luo/CODAR/512x512x512/temperature.dat 512 512 5 >>svd.result


echo XGC
./svd /media/luo/CODAR/XGC/xgc.3d.08100.dat 512 3449 6 >>svd.result


echo SD
./svd /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi 500 500 500 11 >>svd.result

