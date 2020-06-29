echo Heat3d
./PS ../Inputdata/Heat3d.dat.b samples/Heat3dPS0.01 192 192 192 0 0.01
./PS ../Inputdata/Heat3d.dat.b samples/Heat3dPS0.05 192 192 192 0 0.05
./PS ../Inputdata/Heat3d.dat.b samples/Heat3dPS0.1 192 192 192 0 0.1

./ES ../Inputdata/Heat3d.dat.b samples/Heat3dES0.01 192 192 192 0 0.01
./ES ../Inputdata/Heat3d.dat.b samples/Heat3dES0.05 192 192 192 0 0.05
./ES ../Inputdata/Heat3d.dat.b samples/Heat3dES0.1 192 192 192 0 0.1

./RS ../Inputdata/Heat3d.dat.b samples/Heat3dRS0.01 192 192 192 0 0.01
./RS ../Inputdata/Heat3d.dat.b samples/Heat3dRS0.05 192 192 192 0 0.05
./RS ../Inputdata/Heat3d.dat.b samples/Heat3dRS0.1 192 192 192 0 0.1

echo Laplace
./PS ../Inputdata/Laplace.dat.b  samples/LaplacePS0.01 960 960 0 0 0.01
./PS ../Inputdata/Laplace.dat.b  samples/LaplacePS0.05 960 960 0 0 0.05
./PS ../Inputdata/Laplace.dat.b  samples/LaplacePS0.1 960 960 0 0 0.1

./ES ../Inputdata/Laplace.dat.b  samples/LaplaceES0.01 960 960 0 0 0.01
./ES ../Inputdata/Laplace.dat.b  samples/LaplaceES0.05 960 960 0 0 0.05
./ES ../Inputdata/Laplace.dat.b  samples/LaplaceES0.1 960 960 0 0 0.1

./RS ../Inputdata/Laplace.dat.b  samples/LaplaceRS0.01 960 960 0 0 0.01
./RS ../Inputdata/Laplace.dat.b  samples/LaplaceRS0.05 960 960 0 0 0.05
./RS ../Inputdata/Laplace.dat.b  samples/LaplaceRS0.1 960 960 0 0 0.1

echo Wave
./PS ../Inputdata/Wave.dat.b  samples/WavePS0.01 512 80 0 0 0.01
./PS ../Inputdata/Wave.dat.b  samples/WavePS0.05 512 80 0 0 0.05
./PS ../Inputdata/Wave.dat.b  samples/WavePS0.1 512 80 0 0 0.1


./ES ../Inputdata/Wave.dat.b  samples/WaveES0.01 512 80 0 0 0.01
./ES ../Inputdata/Wave.dat.b  samples/WaveES0.05 512 80 0 0 0.05
./ES ../Inputdata/Wave.dat.b  samples/WaveES0.1 512 80 0 0 0.1

./RS ../Inputdata/Wave.dat.b  samples/WaveRS0.01 512 80 0 0 0.01
./RS ../Inputdata/Wave.dat.b  samples/WaveRS0.05 512 80 0 0 0.05
./RS ../Inputdata/Wave.dat.b  samples/WaveRS0.1 512 80 0 0 0.1

echo Sedov
./PS ../Inputdata/Sedov_pres.dat.b  samples/SedovPS0.01 200 200 0 0 0.01
./PS ../Inputdata/Sedov_pres.dat.b  samples/SedovPS0.05 200 200 0 0 0.05
./PS ../Inputdata/Sedov_pres.dat.b  samples/SedovPS0.1 200 200 0 0 0.1

./ES ../Inputdata/Sedov_pres.dat.b  samples/SedovES0.01 200 200 0 0 0.01
./ES ../Inputdata/Sedov_pres.dat.b  samples/SedovES0.05 200 200 0 0 0.05
./ES ../Inputdata/Sedov_pres.dat.b  samples/SedovES0.1 200 200 0 0 0.1

./RS ../Inputdata/Sedov_pres.dat.b  samples/SedovRS0.01 200 200 0 0 0.01
./RS ../Inputdata/Sedov_pres.dat.b  samples/SedovRS0.05 200 200 0 0 0.05
./RS ../Inputdata/Sedov_pres.dat.b  samples/SedovRS0.1 200 200 0 0 0.1

echo Astro
./PS ../Inputdata/Astro.dat.b  samples/AstroPS0.01 256 256 0 0 0.01
./PS ../Inputdata/Astro.dat.b  samples/AstroPS0.05 256 256 0 0 0.05
./PS ../Inputdata/Astro.dat.b  samples/AstroPS0.1 256 256 0 0 0.1

./ES ../Inputdata/Astro.dat.b  samples/AstroES0.01 256 256 0 0 0.01
./ES ../Inputdata/Astro.dat.b  samples/AstroES0.05 256 256 0 0 0.05
./ES ../Inputdata/Astro.dat.b  samples/AstroES0.1 256 256 0 0 0.1

./RS ../Inputdata/Astro.dat.b  samples/AstroRS0.01 256 256 0 0 0.01
./RS ../Inputdata/Astro.dat.b  samples/AstroRS0.05 256 256 0 0 0.05
./RS ../Inputdata/Astro.dat.b  samples/AstroRS0.1 256 256 0 0 0.1

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
./PSfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricanePS0.01 500 500 10 0  0.01
./PSfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricanePS0.05 500 500 10 0  0.05
./PSfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricanePS0.1 500 500 10 0  0.1

./ESfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneES0.01 500 500 10 0  0.01
./ESfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneES0.05 500 500 10 0  0.05
./ESfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneES0.1 500 500 10 0  0.1

./RSfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneRS0.01 500 500 10 0  0.01
./RSfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneRS0.05 500 500 10 0  0.05
./RSfloat /media/luo/CODAR/100x500x500/Pf48.bin.f32  samples/HurricaneRS0.1 500 500 10 0  0.1



echo CESM-ATM
./PSfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-PS0.01 1800 3600 0 0 0.01
./PSfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-PS0.05 1800 3600 0 0 0.05
./PSfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-PS0.1 1800 3600 0 0 0.1


./ESfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-ES0.01 1800 3600 0 0 0.01
./ESfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-ES0.05 1800 3600 0 0 0.05
./ESfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-ES0.1 1800 3600 0 0 0.1

./RSfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-RS0.01 1800 3600 0 0 0.01
./RSfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-RS0.05 1800 3600 0 0 0.05
./RSfloat /media/luo/CODAR/1800x3600/FLUT_1_1800_3600.dat samples/CESM-RS0.1 1800 3600 0 0 0.1

echo NYX
./PSfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-PS0.01 512 512 512 0 0.01
./PSfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-PS0.05 512 512 512 0 0.05
./PSfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-PS0.1 512 512 512 0 0.1

./ESfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-ES0.01 512 512 512 0 0.01
./ESfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-ES0.05 512 512 512 0 0.05
./ESfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-ES0.1 512 512 512 0 0.1

./RSfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-RS0.01 512 512 512 0 0.01
./RSfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-RS0.05 512 512 512 0 0.05
./RSfloat /media/luo/CODAR/512x512x512/temperature.dat samples/NYX-RS0.1 512 512 512 0 0.1

echo XGC
./PS /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-PS0.01 20694 512 0 0 0.01
./PS /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-PS0.05 20694 512 0 0 0.05
./PS /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-PS0.1 20694 512 0 0 0.1

./ES /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-ES0.01 20694 512 0 0 0.01
./ES /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-ES0.05 20694 512 0 0 0.05
./ES /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-ES0.1 20694 512 0 0 0.1

./RS /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-RS0.01 20694 512 0 0 0.01
./RS /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-RS0.05 20694 512 0 0 0.05
./RS /media/luo/CODAR/XGC/xgc.3d.08100.dat samples/XGC-RS0.1 20694 512 0 0 0.1

echo SD
./PS /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-PS0.01 500 500 500 0 0.01
./PS /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-PS0.05 500 500 500 0 0.05
./PS /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-PS0.1 500 500 500 0 0.1

./ES /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-ES0.01 500 500 500 0 0.01
./ES /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-ES0.05 500 500 500 0 0.05
./ES /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-ES0.1 500 500 500 0 0.1

./RS /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-RS0.01 500 500 500 0 0.01
./RS /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-RS0.05 500 500 500 0 0.05
./RS /media/luo/CODAR/S3D/stat_planar.1.1000E-03.field.mpi samples/S3D-RS0.1 500 500 500 0 0.1
