rm pcaSZcrPS0.*
rm pcaSZcrES0.*
rm pcaSZcrRS0.*
echo Heat3d
../pcaSZ samples/Heat3dPS0.01 192 192 1 >>pcaSZcrPS0.01.result
../pcaSZ samples/Heat3dPS0.05 192 192 9 >>pcaSZcrPS0.05.result
../pcaSZ samples/Heat3dPS0.1 192 192 19 >>pcaSZcrPS0.1.result


../pcaSZ samples/Heat3dES0.01 192 192 1 >>pcaSZcrES0.01.result
../pcaSZ samples/Heat3dES0.05 192 192 9 >>pcaSZcrES0.05.result
../pcaSZ samples/Heat3dES0.1 192 192 19 >>pcaSZcrES0.1.result


../pcaSZ samples/Heat3dRS0.01 192 192 1 >>pcaSZcrRS0.01.result
../pcaSZ samples/Heat3dRS0.05 192 192 9 >>pcaSZcrRS0.05.result
../pcaSZ samples/Heat3dRS0.1 192 192 19 >>pcaSZcrRS0.1.result

echo Laplace
../pcaSZ samples/LaplacePS0.01 960 9 >>pcaSZcrPS0.01.result 
../pcaSZ samples/LaplacePS0.05 960 48 >>pcaSZcrPS0.05.result 
../pcaSZ samples/LaplacePS0.1 960 96 >>pcaSZcrPS0.1.result 


../pcaSZ samples/LaplaceES0.01 960 9 >>pcaSZcrES0.01.result 
../pcaSZ samples/LaplaceES0.05 960 48 >>pcaSZcrES0.05.result 
../pcaSZ samples/LaplaceES0.1 960 96 >>pcaSZcrES0.1.result 


../pcaSZ samples/LaplaceRS0.01 960 9 >>pcaSZcrRS0.01.result 
../pcaSZ samples/LaplaceRS0.05 960 48 >>pcaSZcrRS0.05.result 
../pcaSZ samples/LaplaceRS0.1 960 96 >>pcaSZcrRS0.1.result 

echo Wave
../pcaSZ samples/WavePS0.01 80 5 >>pcaSZcrPS0.01.result
../pcaSZ samples/WavePS0.05 80 25 >>pcaSZcrPS0.05.result
../pcaSZ samples/WavePS0.1 80 51 >>pcaSZcrPS0.1.result

../pcaSZ samples/WaveES0.01 80 5 >>pcaSZcrES0.01.result
../pcaSZ samples/WaveES0.05 80 25 >>pcaSZcrES0.05.result
../pcaSZ samples/WaveES0.1 80 51 >>pcaSZcrES0.1.result

../pcaSZ samples/WaveRS0.01 80 5 >>pcaSZcrRS0.01.result
../pcaSZ samples/WaveRS0.05 80 25 >>pcaSZcrRS0.05.result
../pcaSZ samples/WaveRS0.1 80 51 >>pcaSZcrRS0.1.result

echo Sedov
../pcaSZ samples/SedovPS0.01 200 2 >>pcaSZcrPS0.01.result
../pcaSZ samples/SedovPS0.05 200 10 >>pcaSZcrPS0.05.result
../pcaSZ samples/SedovPS0.1 200 20 >>pcaSZcrPS0.1.result

../pcaSZ samples/SedovES0.01 200 2 >>pcaSZcrES0.01.result
../pcaSZ samples/SedovES0.05 200 10 >>pcaSZcrES0.05.result
../pcaSZ samples/SedovES0.1 200 20 >>pcaSZcrES0.1.result


../pcaSZ samples/SedovRS0.01 200 2 >>pcaSZcrRS0.01.result
../pcaSZ samples/SedovRS0.05 200 10 >>pcaSZcrRS0.05.result
../pcaSZ samples/SedovRS0.1 200 20 >>pcaSZcrRS0.1.result


echo Astro
../pcaSZ samples/AstroPS0.01 256 2 >>pcaSZcrPS0.01.result
../pcaSZ samples/AstroPS0.05 256 12 >>pcaSZcrPS0.05.result
../pcaSZ samples/AstroPS0.1 256 25 >>pcaSZcrPS0.1.result

../pcaSZ samples/AstroES0.01 256 2 >>pcaSZcrES0.01.result
../pcaSZ samples/AstroES0.05 256 12 >>pcaSZcrES0.05.result
../pcaSZ samples/AstroES0.1 256 25 >>pcaSZcrES0.1.result

../pcaSZ samples/AstroRS0.01 256 2 >>pcaSZcrRS0.01.result
../pcaSZ samples/AstroRS0.05 256 12 >>pcaSZcrRS0.05.result
../pcaSZ samples/AstroRS0.1 256 25 >>pcaSZcrRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../pcaSZfloat samples/HurricanePS0.01  500 50 >>pcaSZcrPS0.01.result
../pcaSZfloat samples/HurricanePS0.05  500 250 >>pcaSZcrPS0.05.result
../pcaSZfloat samples/HurricanePS0.1  500 500 >>pcaSZcrPS0.1.result

../pcaSZfloat samples/HurricaneES0.01  500 50 >>pcaSZcrES0.01.result
../pcaSZfloat samples/HurricaneES0.05  500 250 >>pcaSZcrES0.05.result
../pcaSZfloat samples/HurricaneES0.1  500 500 >>pcaSZcrES0.1.result

../pcaSZfloat samples/HurricaneRS0.01  500 50 >>pcaSZcrRS0.01.result
../pcaSZfloat samples/HurricaneRS0.05  500 250 >>pcaSZcrRS0.05.result
../pcaSZfloat samples/HurricaneRS0.1  500 500 >>pcaSZcrRS0.1.result

echo CESM-ATM
../pcaSZfloat samples/CESM-PS0.01 1800 36 >>pcaSZcrPS0.01.result
../pcaSZfloat samples/CESM-PS0.05 1800 180 >>pcaSZcrPS0.05.result
../pcaSZfloat samples/CESM-PS0.1 1800 360 >>pcaSZcrPS0.1.result

../pcaSZfloat samples/CESM-ES0.01 1800 36 >>pcaSZcrES0.01.result
../pcaSZfloat samples/CESM-ES0.05 1800 180 >>pcaSZcrES0.05.result
../pcaSZfloat samples/CESM-ES0.1 1800 360 >>pcaSZcrES0.1.result

../pcaSZfloat samples/CESM-RS0.01 1800 36 >>pcaSZcrRS0.01.result
../pcaSZfloat samples/CESM-RS0.05 1800 180 >>pcaSZcrRS0.05.result
../pcaSZfloat samples/CESM-RS0.1 1800 360 >>pcaSZcrRS0.1.result

echo NYX
../pcaSZfloat  samples/NYX-PS0.01 512 25 >>pcaSZcrPS0.01.result
../pcaSZfloat  samples/NYX-PS0.05 512 128 >>pcaSZcrPS0.05.result
../pcaSZfloat  samples/NYX-PS0.1 512 256 >>pcaSZcrPS0.1.result


../pcaSZfloat  samples/NYX-ES0.01 512 25 >>pcaSZcrES0.01.result
../pcaSZfloat  samples/NYX-ES0.05 512 128 >>pcaSZcrES0.05.result
../pcaSZfloat  samples/NYX-ES0.1 512 256 >>pcaSZcrES0.1.result

../pcaSZfloat  samples/NYX-RS0.01 512 25 >>pcaSZcrRS0.01.result
../pcaSZfloat  samples/NYX-RS0.05 512 128 >>pcaSZcrRS0.05.result
../pcaSZfloat  samples/NYX-RS0.1 512 256 >>pcaSZcrRS0.1.result

echo XGC
../pcaSZ samples/XGC-PS0.01 512 206 >>pcaSZcrPS0.01.result
../pcaSZ samples/XGC-PS0.05 512 1030 >>pcaSZcrPS0.05.result
../pcaSZ samples/XGC-PS0.1 512 2069 >>pcaSZcrPS0.1.result

../pcaSZ samples/XGC-ES0.01 512 206 >>pcaSZcrES0.01.result
../pcaSZ samples/XGC-ES0.05 512 1030 >>pcaSZcrES0.05.result
../pcaSZ samples/XGC-ES0.1 512 2069 >>pcaSZcrES0.1.result

../pcaSZ samples/XGC-RS0.01 512 206 >>pcaSZcrRS0.01.result
../pcaSZ samples/XGC-RS0.05 512 1030 >>pcaSZcrRS0.05.result
../pcaSZ samples/XGC-RS0.1 512 2069 >>pcaSZcrRS0.1.result

echo SD
../pcaSZ samples/S3D-PS0.01 500 500 5 >>pcaSZcrPS0.01.result
../pcaSZ samples/S3D-PS0.05 500 500 25 >>pcaSZcrPS0.05.result
../pcaSZ samples/S3D-PS0.1 500 500 50 >>pcaSZcrPS0.1.result

../pcaSZ samples/S3D-ES0.01 500 500 5 >>pcaSZcrES0.01.result
../pcaSZ samples/S3D-ES0.05 500 500 25 >>pcaSZcrES0.05.result
../pcaSZ samples/S3D-ES0.1 500 500 50 >>pcaSZcrES0.1.result


../pcaSZ samples/S3D-RS0.01 500 500 5 >>pcaSZcrRS0.01.result
../pcaSZ samples/S3D-RS0.05 500 500 25 >>pcaSZcrRS0.05.result
../pcaSZ samples/S3D-RS0.1 500 500 50 >>pcaSZcrRS0.1.result
