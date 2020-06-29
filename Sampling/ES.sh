echo Heat3d

./pca samples/Heat3dES0.01 192 368 >>
./svd samples/Heat3dES0.01 192 368
./wavelet samples/Heat3dES0.01 192 368
./ES ../Inputdata/Heat3d.dat.b samples/Heat3dES0.05 192 192 192 0 0.05
./ES ../Inputdata/Heat3d.dat.b samples/Heat3dES0.1 192 192 192 0 0.1


echo Laplace

./ES ../Inputdata/Laplace.dat.b  samples/LaplaceES0.01 960 960 0 0 0.01
./ES ../Inputdata/Laplace.dat.b  samples/LaplaceES0.05 960 960 0 0 0.05
./ES ../Inputdata/Laplace.dat.b  samples/LaplaceES0.1 960 960 0 0 0.1


echo Wave


./ES ../Inputdata/Wave.dat.b  samples/WaveES0.01 512 80 0 0 0.01
./ES ../Inputdata/Wave.dat.b  samples/WaveES0.05 512 80 0 0 0.05
./ES ../Inputdata/Wave.dat.b  samples/WaveES0.1 512 80 0 0 0.1


echo Sedov

./ES ../Inputdata/Sedov_pres.dat.b  samples/SedovES0.01 200 200 0 0 0.01
./ES ../Inputdata/Sedov_pres.dat.b  samples/SedovES0.05 200 200 0 0 0.05
./ES ../Inputdata/Sedov_pres.dat.b  samples/SedovES0.1 200 200 0 0 0.1


echo Astro

./ES ../Inputdata/Astro.dat.b  samples/AstroES0.01 256 256 0 0 0.01
./ES ../Inputdata/Astro.dat.b  samples/AstroES0.05 256 256 0 0 0.05
./ES ../Inputdata/Astro.dat.b  samples/AstroES0.1 256 256 0 0 0.1


#0.95 or L=1
#Hurricane ISABEL
echo ISABEL

./ESfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneES0.01 500 500 10 0  0.01
./ESfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneES0.05 500 500 10 0  0.05
./ESfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneES0.1 500 500 10 0  0.1




echo CESM-ATM


./ESfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-ES0.01 1800 3600 0 0 0.01
./ESfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-ES0.05 1800 3600 0 0 0.05
./ESfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-ES0.1 1800 3600 0 0 0.1


echo NYX

./ESfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-ES0.01 512 512 512 0 0.01
./ESfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-ES0.05 512 512 512 0 0.05
./ESfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-ES0.1 512 512 512 0 0.1

echo XGC

./ES /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-ES0.01 20694 512 0 0 0.01
./ES /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-ES0.05 20694 512 0 0 0.05
./ES /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-ES0.1 20694 512 0 0 0.1

echo SD

./ES /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-ES0.01 500 500 500 0 0.01
./ES /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-ES0.05 500 500 500 0 0.05
./ES /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-ES0.1 500 500 500 0 0.1

