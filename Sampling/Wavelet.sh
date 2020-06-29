rm wavelet.result
echo Heat3d
../sizeRM/waveletSZ ../Inputdata/Heat3d.dat.b 192 192 192 >>wavelet.result

echo Laplace
../sizeRM/waveletSZ ../Inputdata/Laplace.dat.b 960 960 >>wavelet.result

echo Wave
../sizeRM/waveletSZ ../Inputdata/Wave.dat.b 80 512 >>wavelet.result

echo Sedov
../sizeRM/waveletSZ ../Inputdata/Sedov_pres.dat.b 200 200 >>wavelet.result

echo Astro
../sizeRM/waveletSZ ../Inputdata/astro.dat 256 256 >>wavelet.result
#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../sizeRM/waveletSZfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  500 500 10 >>wavelet.result

echo CESM-ATM
../sizeRM/waveletSZfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat 180 360 10 >>wavelet.result


echo NYX
../sizeRM/waveletSZfloat /media/luo/CODAR/512x512x512/temperature.dat 512 512 5 >>wavelet.result


echo XGC
../sizeRM/waveletSZ /media/luo/CODAR/XGC/xgc.3d.08100.dat 512 3449 >>wavelet.result


echo SD
../sizeRM/waveletSZ /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi 500 500 5 >>wavelet.result

