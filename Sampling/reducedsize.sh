rm RM.full
echo Heat3d
../sizeRM/pcaSZ ../Inputdata/Heat3d.dat.b 192 192 192 >>RM.full
../sizeRM/svdSZ ../Inputdata/Heat3d.dat.b 192 192 192  >>RM.full
../sizeRM/waveletSZ ../Inputdata/Heat3d.dat.b 192 192 192 >>RM.full

echo Laplace
../sizeRM/pcaSZ ../Inputdata/Laplace.dat.b 960 960 >>RM.full
../sizeRM/svdSZ ../Inputdata/Laplace.dat.b 960 960 >>RM.full
../sizeRM/waveletSZ ../Inputdata/Laplace.dat.b 960 960 >>RM.full

echo Wave
../sizeRM/pcaSZ ../Inputdata/Wave.dat.b 80 512 >>RM.full
../sizeRM/svdSZ ../Inputdata/Wave.dat.b 80 512 >>RM.full
../sizeRM/waveletSZ ../Inputdata/Wave.dat.b 80 512 >>RM.full

echo Sedov
../sizeRM/pcaSZ ../Inputdata/Sedov_pres.dat.b 200 200 >>RM.full
../sizeRM/svdSZ ../Inputdata/Sedov_pres.dat.b 200 200 >>RM.full
../sizeRM/waveletSZ ../Inputdata/Sedov_pres.dat.b 200 200 >>RM.full

echo Astro
../sizeRM/pcaSZ ../Inputdata/astro.dat 256 256 >>RM.full
../sizeRM/svdSZ ../Inputdata/astro.dat 256 256 >>RM.full
../sizeRM/waveletSZ ../Inputdata/astro.dat 256 256 >>RM.full
#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../sizeRM/pcaSZfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  500 500 10 >>RM.full
../sizeRM/svdSZfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  500 500 10 >>RM.full
../sizeRM/waveletSZfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  500 500 10 >>RM.full

echo CESM-ATM
../sizeRM/pcaSZfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat 180 360 10 >>RM.full
../sizeRM/svdSZfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat 180 360 10 >>RM.full
../sizeRM/waveletSZfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat 180 360 10 >>RM.full


echo NYX
../sizeRM/pcaSZfloat /media/luo/CODAR/512x512x512/temperature.dat 512 512 5 >>RM.full
../sizeRM/svdSZfloat /media/luo/CODAR/512x512x512/temperature.dat 512 512 5 >>RM.full
../sizeRM/waveletSZfloat /media/luo/CODAR/512x512x512/temperature.dat 512 512 5 >>RM.full


echo XGC
../sizeRM/pcaSZ /media/luo/CODAR/XGC/xgc.3d.08100.dat 512 3449 >>RM.full
../sizeRM/svdSZ /media/luo/CODAR/XGC/xgc.3d.08100.dat 512 3449  >>RM.full
../sizeRM/waveletSZ /media/luo/CODAR/XGC/xgc.3d.08100.dat 512 3449 >>RM.full


echo SD
../sizeRM/pcaSZ /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi 500 500 5 >>RM.full
../sizeRM/svdSZ /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi 500 500 5 >>RM.full
../sizeRM/waveletSZ /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi 500 500 5 >>RM.full

