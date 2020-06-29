rm waveletPS0.*
rm waveletES0.*
rm waveletRS0.*
echo Heat3d
../sizeRM/waveletSZ samples/Heat3dPS0.01 192 192 1 >>waveletPS0.01.result
../sizeRM/waveletSZ samples/Heat3dPS0.05 192 192 9 >>waveletPS0.05.result
../sizeRM/waveletSZ samples/Heat3dPS0.1 192 192 19 >>waveletPS0.1.result


../sizeRM/waveletSZ samples/Heat3dES0.01 192 192 1 >>waveletES0.01.result
../sizeRM/waveletSZ samples/Heat3dES0.05 192 192 9 >>waveletES0.05.result
../sizeRM/waveletSZ samples/Heat3dES0.1 192 192 19 >>waveletES0.1.result


../sizeRM/waveletSZ samples/Heat3dRS0.01 192 192 1 >>waveletRS0.01.result
../sizeRM/waveletSZ samples/Heat3dRS0.05 192 192 9 >>waveletRS0.05.result
../sizeRM/waveletSZ samples/Heat3dRS0.1 192 192 19 >>waveletRS0.1.result

echo Laplace
../sizeRM/waveletSZ samples/LaplacePS0.01 960 9 >>waveletPS0.01.result 
../sizeRM/waveletSZ samples/LaplacePS0.05 960 48 >>waveletPS0.05.result 
../sizeRM/waveletSZ samples/LaplacePS0.1 960 96 >>waveletPS0.1.result 


../sizeRM/waveletSZ samples/LaplaceES0.01 960 9 >>waveletES0.01.result 
../sizeRM/waveletSZ samples/LaplaceES0.05 960 48 >>waveletES0.05.result 
../sizeRM/waveletSZ samples/LaplaceES0.1 960 96 >>waveletES0.1.result 


../sizeRM/waveletSZ samples/LaplaceRS0.01 960 9 >>waveletRS0.01.result 
../sizeRM/waveletSZ samples/LaplaceRS0.05 960 48 >>waveletRS0.05.result 
../sizeRM/waveletSZ samples/LaplaceRS0.1 960 96 >>waveletRS0.1.result 

echo Wave
../sizeRM/waveletSZ samples/WavePS0.01 80 5 >>waveletPS0.01.result
../sizeRM/waveletSZ samples/WavePS0.05 80 25 >>waveletPS0.05.result
../sizeRM/waveletSZ samples/WavePS0.1 80 51 >>waveletPS0.1.result

../sizeRM/waveletSZ samples/WaveES0.01 80 5 >>waveletES0.01.result
../sizeRM/waveletSZ samples/WaveES0.05 80 25 >>waveletES0.05.result
../sizeRM/waveletSZ samples/WaveES0.1 80 51 >>waveletES0.1.result

../sizeRM/waveletSZ samples/WaveRS0.01 80 5 >>waveletRS0.01.result
../sizeRM/waveletSZ samples/WaveRS0.05 80 25 >>waveletRS0.05.result
../sizeRM/waveletSZ samples/WaveRS0.1 80 51 >>waveletRS0.1.result

echo Sedov
../sizeRM/waveletSZ samples/SedovPS0.01 200 2 >>waveletPS0.01.result
../sizeRM/waveletSZ samples/SedovPS0.05 200 10 >>waveletPS0.05.result
../sizeRM/waveletSZ samples/SedovPS0.1 200 20 >>waveletPS0.1.result

../sizeRM/waveletSZ samples/SedovES0.01 200 2 >>waveletES0.01.result
../sizeRM/waveletSZ samples/SedovES0.05 200 10 >>waveletES0.05.result
../sizeRM/waveletSZ samples/SedovES0.1 200 20 >>waveletES0.1.result


../sizeRM/waveletSZ samples/SedovRS0.01 200 2 >>waveletRS0.01.result
../sizeRM/waveletSZ samples/SedovRS0.05 200 10 >>waveletRS0.05.result
../sizeRM/waveletSZ samples/SedovRS0.1 200 20 >>waveletRS0.1.result


echo Astro
../sizeRM/waveletSZ samples/AstroPS0.01 256 2 >>waveletPS0.01.result
../sizeRM/waveletSZ samples/AstroPS0.05 256 12 >>waveletPS0.05.result
../sizeRM/waveletSZ samples/AstroPS0.1 256 25 >>waveletPS0.1.result

../sizeRM/waveletSZ samples/AstroES0.01 256 2 >>waveletES0.01.result
../sizeRM/waveletSZ samples/AstroES0.05 256 12 >>waveletES0.05.result
../sizeRM/waveletSZ samples/AstroES0.1 256 25 >>waveletES0.1.result

../sizeRM/waveletSZ samples/AstroRS0.01 256 2 >>waveletRS0.01.result
../sizeRM/waveletSZ samples/AstroRS0.05 256 12 >>waveletRS0.05.result
../sizeRM/waveletSZ samples/AstroRS0.1 256 25 >>waveletRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../sizeRM/waveletSZfloat samples/HurricanePS0.01  500 50 >>waveletPS0.01.result
../sizeRM/waveletSZfloat samples/HurricanePS0.05  500 250 >>waveletPS0.05.result
../sizeRM/waveletSZfloat samples/HurricanePS0.1  500 500 >>waveletPS0.1.result

../sizeRM/waveletSZfloat samples/HurricaneES0.01  500 50 >>waveletES0.01.result
../sizeRM/waveletSZfloat samples/HurricaneES0.05  500 250 >>waveletES0.05.result
../sizeRM/waveletSZfloat samples/HurricaneES0.1  500 500 >>waveletES0.1.result

../sizeRM/waveletSZfloat samples/HurricaneRS0.01  500 50 >>waveletRS0.01.result
../sizeRM/waveletSZfloat samples/HurricaneRS0.05  500 250 >>waveletRS0.05.result
../sizeRM/waveletSZfloat samples/HurricaneRS0.1  500 500 >>waveletRS0.1.result

echo CESM-ATM
../sizeRM/waveletSZfloat samples/CESM-PS0.01 1800 36 >>waveletPS0.01.result
../sizeRM/waveletSZfloat samples/CESM-PS0.05 1800 180 >>waveletPS0.05.result
../sizeRM/waveletSZfloat samples/CESM-PS0.1 1800 360 >>waveletPS0.1.result

../sizeRM/waveletSZfloat samples/CESM-ES0.01 1800 36 >>waveletES0.01.result
../sizeRM/waveletSZfloat samples/CESM-ES0.05 1800 180 >>waveletES0.05.result
../sizeRM/waveletSZfloat samples/CESM-ES0.1 1800 360 >>waveletES0.1.result

../sizeRM/waveletSZfloat samples/CESM-RS0.01 1800 36 >>waveletRS0.01.result
../sizeRM/waveletSZfloat samples/CESM-RS0.05 1800 180 >>waveletRS0.05.result
../sizeRM/waveletSZfloat samples/CESM-RS0.1 1800 360 >>waveletRS0.1.result

echo NYX
../sizeRM/waveletSZfloat  samples/NYX-PS0.01 512 25 >>waveletPS0.01.result
../sizeRM/waveletSZfloat  samples/NYX-PS0.05 512 128 >>waveletPS0.05.result
../sizeRM/waveletSZfloat  samples/NYX-PS0.1 512 256 >>waveletPS0.1.result


../sizeRM/waveletSZfloat  samples/NYX-ES0.01 512 25 >>waveletES0.01.result
../sizeRM/waveletSZfloat  samples/NYX-ES0.05 512 128 >>waveletES0.05.result
../sizeRM/waveletSZfloat  samples/NYX-ES0.1 512 256 >>waveletES0.1.result

../sizeRM/waveletSZfloat  samples/NYX-RS0.01 512 25 >>waveletRS0.01.result
../sizeRM/waveletSZfloat  samples/NYX-RS0.05 512 128 >>waveletRS0.05.result
../sizeRM/waveletSZfloat  samples/NYX-RS0.1 512 256 >>waveletRS0.1.result

echo XGC
../sizeRM/waveletSZ samples/XGC-PS0.01 512 206 >>waveletPS0.01.result
../sizeRM/waveletSZ samples/XGC-PS0.05 512 1030 >>waveletPS0.05.result
../sizeRM/waveletSZ samples/XGC-PS0.1 512 2069 >>waveletPS0.1.result

../sizeRM/waveletSZ samples/XGC-ES0.01 512 206 >>waveletES0.01.result
../sizeRM/waveletSZ samples/XGC-ES0.05 512 1030 >>waveletES0.05.result
../sizeRM/waveletSZ samples/XGC-ES0.1 512 2069 >>waveletES0.1.result

../sizeRM/waveletSZ samples/XGC-RS0.01 512 206 >>waveletRS0.01.result
../sizeRM/waveletSZ samples/XGC-RS0.05 512 1030 >>waveletRS0.05.result
../sizeRM/waveletSZ samples/XGC-RS0.1 512 2069 >>waveletRS0.1.result

echo SD
../sizeRM/waveletSZ samples/S3D-PS0.01 500 500 5 >>waveletPS0.01.result
../sizeRM/waveletSZ samples/S3D-PS0.05 500 500 25 >>waveletPS0.05.result
../sizeRM/waveletSZ samples/S3D-PS0.1 500 500 50 >>waveletPS0.1.result

../sizeRM/waveletSZ samples/S3D-ES0.01 500 500 5 >>waveletES0.01.result
../sizeRM/waveletSZ samples/S3D-ES0.05 500 500 25 >>waveletES0.05.result
../sizeRM/waveletSZ samples/S3D-ES0.1 500 500 50 >>waveletES0.1.result


../sizeRM/waveletSZ samples/S3D-RS0.01 500 500 5 >>waveletRS0.01.result
../sizeRM/waveletSZ samples/S3D-RS0.05 500 500 25 >>waveletRS0.05.result
../sizeRM/waveletSZ samples/S3D-RS0.1 500 500 50 >>waveletRS0.1.result
