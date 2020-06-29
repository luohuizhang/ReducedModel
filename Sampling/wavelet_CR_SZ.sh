rm waveletSZcrPS0.*
rm waveletSZcrES0.*
rm waveletSZcrRS0.*
echo Heat3d
../waveletSZ samples/Heat3dPS0.01 192 192 1 >>waveletSZcrPS0.01.result
../waveletSZ samples/Heat3dPS0.05 192 192 9 >>waveletSZcrPS0.05.result
../waveletSZ samples/Heat3dPS0.1 192 192 19 >>waveletSZcrPS0.1.result


../waveletSZ samples/Heat3dES0.01 192 192 1 >>waveletSZcrES0.01.result
../waveletSZ samples/Heat3dES0.05 192 192 9 >>waveletSZcrES0.05.result
../waveletSZ samples/Heat3dES0.1 192 192 19 >>waveletSZcrES0.1.result


../waveletSZ samples/Heat3dRS0.01 192 192 1 >>waveletSZcrRS0.01.result
../waveletSZ samples/Heat3dRS0.05 192 192 9 >>waveletSZcrRS0.05.result
../waveletSZ samples/Heat3dRS0.1 192 192 19 >>waveletSZcrRS0.1.result

echo Laplace
../waveletSZ samples/LaplacePS0.01 960 9 >>waveletSZcrPS0.01.result 
../waveletSZ samples/LaplacePS0.05 960 48 >>waveletSZcrPS0.05.result 
../waveletSZ samples/LaplacePS0.1 960 96 >>waveletSZcrPS0.1.result 


../waveletSZ samples/LaplaceES0.01 960 9 >>waveletSZcrES0.01.result 
../waveletSZ samples/LaplaceES0.05 960 48 >>waveletSZcrES0.05.result 
../waveletSZ samples/LaplaceES0.1 960 96 >>waveletSZcrES0.1.result 


../waveletSZ samples/LaplaceRS0.01 960 9 >>waveletSZcrRS0.01.result 
../waveletSZ samples/LaplaceRS0.05 960 48 >>waveletSZcrRS0.05.result 
../waveletSZ samples/LaplaceRS0.1 960 96 >>waveletSZcrRS0.1.result 

echo Wave
../waveletSZ samples/WavePS0.01 80 5 >>waveletSZcrPS0.01.result
../waveletSZ samples/WavePS0.05 80 25 >>waveletSZcrPS0.05.result
../waveletSZ samples/WavePS0.1 80 51 >>waveletSZcrPS0.1.result

../waveletSZ samples/WaveES0.01 80 5 >>waveletSZcrES0.01.result
../waveletSZ samples/WaveES0.05 80 25 >>waveletSZcrES0.05.result
../waveletSZ samples/WaveES0.1 80 51 >>waveletSZcrES0.1.result

../waveletSZ samples/WaveRS0.01 80 5 >>waveletSZcrRS0.01.result
../waveletSZ samples/WaveRS0.05 80 25 >>waveletSZcrRS0.05.result
../waveletSZ samples/WaveRS0.1 80 51 >>waveletSZcrRS0.1.result

echo Sedov
../waveletSZ samples/SedovPS0.01 200 2 >>waveletSZcrPS0.01.result
../waveletSZ samples/SedovPS0.05 200 10 >>waveletSZcrPS0.05.result
../waveletSZ samples/SedovPS0.1 200 20 >>waveletSZcrPS0.1.result

../waveletSZ samples/SedovES0.01 200 2 >>waveletSZcrES0.01.result
../waveletSZ samples/SedovES0.05 200 10 >>waveletSZcrES0.05.result
../waveletSZ samples/SedovES0.1 200 20 >>waveletSZcrES0.1.result


../waveletSZ samples/SedovRS0.01 200 2 >>waveletSZcrRS0.01.result
../waveletSZ samples/SedovRS0.05 200 10 >>waveletSZcrRS0.05.result
../waveletSZ samples/SedovRS0.1 200 20 >>waveletSZcrRS0.1.result


echo Astro
../waveletSZ samples/AstroPS0.01 256 2 >>waveletSZcrPS0.01.result
../waveletSZ samples/AstroPS0.05 256 12 >>waveletSZcrPS0.05.result
../waveletSZ samples/AstroPS0.1 256 25 >>waveletSZcrPS0.1.result

../waveletSZ samples/AstroES0.01 256 2 >>waveletSZcrES0.01.result
../waveletSZ samples/AstroES0.05 256 12 >>waveletSZcrES0.05.result
../waveletSZ samples/AstroES0.1 256 25 >>waveletSZcrES0.1.result

../waveletSZ samples/AstroRS0.01 256 2 >>waveletSZcrRS0.01.result
../waveletSZ samples/AstroRS0.05 256 12 >>waveletSZcrRS0.05.result
../waveletSZ samples/AstroRS0.1 256 25 >>waveletSZcrRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../waveletSZfloat samples/HurricanePS0.01  500 50 >>waveletSZcrPS0.01.result
../waveletSZfloat samples/HurricanePS0.05  500 250 >>waveletSZcrPS0.05.result
../waveletSZfloat samples/HurricanePS0.1  500 500 >>waveletSZcrPS0.1.result

../waveletSZfloat samples/HurricaneES0.01  500 50 >>waveletSZcrES0.01.result
../waveletSZfloat samples/HurricaneES0.05  500 250 >>waveletSZcrES0.05.result
../waveletSZfloat samples/HurricaneES0.1  500 500 >>waveletSZcrES0.1.result

../waveletSZfloat samples/HurricaneRS0.01  500 50 >>waveletSZcrRS0.01.result
../waveletSZfloat samples/HurricaneRS0.05  500 250 >>waveletSZcrRS0.05.result
../waveletSZfloat samples/HurricaneRS0.1  500 500 >>waveletSZcrRS0.1.result

echo CESM-ATM
../waveletSZfloat samples/CESM-PS0.01 1800 36 >>waveletSZcrPS0.01.result
../waveletSZfloat samples/CESM-PS0.05 1800 180 >>waveletSZcrPS0.05.result
../waveletSZfloat samples/CESM-PS0.1 1800 360 >>waveletSZcrPS0.1.result

../waveletSZfloat samples/CESM-ES0.01 1800 36 >>waveletSZcrES0.01.result
../waveletSZfloat samples/CESM-ES0.05 1800 180 >>waveletSZcrES0.05.result
../waveletSZfloat samples/CESM-ES0.1 1800 360 >>waveletSZcrES0.1.result

../waveletSZfloat samples/CESM-RS0.01 1800 36 >>waveletSZcrRS0.01.result
../waveletSZfloat samples/CESM-RS0.05 1800 180 >>waveletSZcrRS0.05.result
../waveletSZfloat samples/CESM-RS0.1 1800 360 >>waveletSZcrRS0.1.result

echo NYX
../waveletSZfloat  samples/NYX-PS0.01 512 25 >>waveletSZcrPS0.01.result
../waveletSZfloat  samples/NYX-PS0.05 512 128 >>waveletSZcrPS0.05.result
../waveletSZfloat  samples/NYX-PS0.1 512 256 >>waveletSZcrPS0.1.result


../waveletSZfloat  samples/NYX-ES0.01 512 25 >>waveletSZcrES0.01.result
../waveletSZfloat  samples/NYX-ES0.05 512 128 >>waveletSZcrES0.05.result
../waveletSZfloat  samples/NYX-ES0.1 512 256 >>waveletSZcrES0.1.result

../waveletSZfloat  samples/NYX-RS0.01 512 25 >>waveletSZcrRS0.01.result
../waveletSZfloat  samples/NYX-RS0.05 512 128 >>waveletSZcrRS0.05.result
../waveletSZfloat  samples/NYX-RS0.1 512 256 >>waveletSZcrRS0.1.result

echo XGC
../waveletSZ samples/XGC-PS0.01 512 206 >>waveletSZcrPS0.01.result
../waveletSZ samples/XGC-PS0.05 512 1030 >>waveletSZcrPS0.05.result
../waveletSZ samples/XGC-PS0.1 512 2069 >>waveletSZcrPS0.1.result

../waveletSZ samples/XGC-ES0.01 512 206 >>waveletSZcrES0.01.result
../waveletSZ samples/XGC-ES0.05 512 1030 >>waveletSZcrES0.05.result
../waveletSZ samples/XGC-ES0.1 512 2069 >>waveletSZcrES0.1.result

../waveletSZ samples/XGC-RS0.01 512 206 >>waveletSZcrRS0.01.result
../waveletSZ samples/XGC-RS0.05 512 1030 >>waveletSZcrRS0.05.result
../waveletSZ samples/XGC-RS0.1 512 2069 >>waveletSZcrRS0.1.result

echo SD
../waveletSZ samples/S3D-PS0.01 500 500 5 >>waveletSZcrPS0.01.result
../waveletSZ samples/S3D-PS0.05 500 500 25 >>waveletSZcrPS0.05.result
../waveletSZ samples/S3D-PS0.1 500 500 50 >>waveletSZcrPS0.1.result

../waveletSZ samples/S3D-ES0.01 500 500 5 >>waveletSZcrES0.01.result
../waveletSZ samples/S3D-ES0.05 500 500 25 >>waveletSZcrES0.05.result
../waveletSZ samples/S3D-ES0.1 500 500 50 >>waveletSZcrES0.1.result


../waveletSZ samples/S3D-RS0.01 500 500 5 >>waveletSZcrRS0.01.result
../waveletSZ samples/S3D-RS0.05 500 500 25 >>waveletSZcrRS0.05.result
../waveletSZ samples/S3D-RS0.1 500 500 50 >>waveletSZcrRS0.1.result
