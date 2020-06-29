rm svdSZcrPS0.*
rm svdSZcrES0.*
rm svdSZcrRS0.*
echo Heat3d
../svdSZ samples/Heat3dPS0.01 192 192 1 >>svdSZcrPS0.01.result
../svdSZ samples/Heat3dPS0.05 192 192 9 >>svdSZcrPS0.05.result
../svdSZ samples/Heat3dPS0.1 192 192 19 >>svdSZcrPS0.1.result


../svdSZ samples/Heat3dES0.01 192 192 1 >>svdSZcrES0.01.result
../svdSZ samples/Heat3dES0.05 192 192 9 >>svdSZcrES0.05.result
../svdSZ samples/Heat3dES0.1 192 192 19 >>svdSZcrES0.1.result


../svdSZ samples/Heat3dRS0.01 192 192 1 >>svdSZcrRS0.01.result
../svdSZ samples/Heat3dRS0.05 192 192 9 >>svdSZcrRS0.05.result
../svdSZ samples/Heat3dRS0.1 192 192 19 >>svdSZcrRS0.1.result

echo Laplace
../svdSZ samples/LaplacePS0.01 960 9 >>svdSZcrPS0.01.result 
../svdSZ samples/LaplacePS0.05 960 48 >>svdSZcrPS0.05.result 
../svdSZ samples/LaplacePS0.1 960 96 >>svdSZcrPS0.1.result 


../svdSZ samples/LaplaceES0.01 960 9 >>svdSZcrES0.01.result 
../svdSZ samples/LaplaceES0.05 960 48 >>svdSZcrES0.05.result 
../svdSZ samples/LaplaceES0.1 960 96 >>svdSZcrES0.1.result 


../svdSZ samples/LaplaceRS0.01 960 9 >>svdSZcrRS0.01.result 
../svdSZ samples/LaplaceRS0.05 960 48 >>svdSZcrRS0.05.result 
../svdSZ samples/LaplaceRS0.1 960 96 >>svdSZcrRS0.1.result 

echo Wave
../svdSZ samples/WavePS0.01 80 5 >>svdSZcrPS0.01.result
../svdSZ samples/WavePS0.05 80 25 >>svdSZcrPS0.05.result
../svdSZ samples/WavePS0.1 80 51 >>svdSZcrPS0.1.result

../svdSZ samples/WaveES0.01 80 5 >>svdSZcrES0.01.result
../svdSZ samples/WaveES0.05 80 25 >>svdSZcrES0.05.result
../svdSZ samples/WaveES0.1 80 51 >>svdSZcrES0.1.result

../svdSZ samples/WaveRS0.01 80 5 >>svdSZcrRS0.01.result
../svdSZ samples/WaveRS0.05 80 25 >>svdSZcrRS0.05.result
../svdSZ samples/WaveRS0.1 80 51 >>svdSZcrRS0.1.result

echo Sedov
../svdSZ samples/SedovPS0.01 200 2 >>svdSZcrPS0.01.result
../svdSZ samples/SedovPS0.05 200 10 >>svdSZcrPS0.05.result
../svdSZ samples/SedovPS0.1 200 20 >>svdSZcrPS0.1.result

../svdSZ samples/SedovES0.01 200 2 >>svdSZcrES0.01.result
../svdSZ samples/SedovES0.05 200 10 >>svdSZcrES0.05.result
../svdSZ samples/SedovES0.1 200 20 >>svdSZcrES0.1.result


../svdSZ samples/SedovRS0.01 200 2 >>svdSZcrRS0.01.result
../svdSZ samples/SedovRS0.05 200 10 >>svdSZcrRS0.05.result
../svdSZ samples/SedovRS0.1 200 20 >>svdSZcrRS0.1.result


echo Astro
../svdSZ samples/AstroPS0.01 256 2 >>svdSZcrPS0.01.result
../svdSZ samples/AstroPS0.05 256 12 >>svdSZcrPS0.05.result
../svdSZ samples/AstroPS0.1 256 25 >>svdSZcrPS0.1.result

../svdSZ samples/AstroES0.01 256 2 >>svdSZcrES0.01.result
../svdSZ samples/AstroES0.05 256 12 >>svdSZcrES0.05.result
../svdSZ samples/AstroES0.1 256 25 >>svdSZcrES0.1.result

../svdSZ samples/AstroRS0.01 256 2 >>svdSZcrRS0.01.result
../svdSZ samples/AstroRS0.05 256 12 >>svdSZcrRS0.05.result
../svdSZ samples/AstroRS0.1 256 25 >>svdSZcrRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../svdSZfloat samples/HurricanePS0.01  500 50 >>svdSZcrPS0.01.result
../svdSZfloat samples/HurricanePS0.05  500 250 >>svdSZcrPS0.05.result
../svdSZfloat samples/HurricanePS0.1  500 500 >>svdSZcrPS0.1.result

../svdSZfloat samples/HurricaneES0.01  500 50 >>svdSZcrES0.01.result
../svdSZfloat samples/HurricaneES0.05  500 250 >>svdSZcrES0.05.result
../svdSZfloat samples/HurricaneES0.1  500 500 >>svdSZcrES0.1.result

../svdSZfloat samples/HurricaneRS0.01  500 50 >>svdSZcrRS0.01.result
../svdSZfloat samples/HurricaneRS0.05  500 250 >>svdSZcrRS0.05.result
../svdSZfloat samples/HurricaneRS0.1  500 500 >>svdSZcrRS0.1.result

echo CESM-ATM
../svdSZfloat samples/CESM-PS0.01 1800 36 >>svdSZcrPS0.01.result
../svdSZfloat samples/CESM-PS0.05 1800 180 >>svdSZcrPS0.05.result
../svdSZfloat samples/CESM-PS0.1 1800 360 >>svdSZcrPS0.1.result

../svdSZfloat samples/CESM-ES0.01 1800 36 >>svdSZcrES0.01.result
../svdSZfloat samples/CESM-ES0.05 1800 180 >>svdSZcrES0.05.result
../svdSZfloat samples/CESM-ES0.1 1800 360 >>svdSZcrES0.1.result

../svdSZfloat samples/CESM-RS0.01 1800 36 >>svdSZcrRS0.01.result
../svdSZfloat samples/CESM-RS0.05 1800 180 >>svdSZcrRS0.05.result
../svdSZfloat samples/CESM-RS0.1 1800 360 >>svdSZcrRS0.1.result

echo NYX
../svdSZfloat  samples/NYX-PS0.01 512 25 >>svdSZcrPS0.01.result
../svdSZfloat  samples/NYX-PS0.05 512 128 >>svdSZcrPS0.05.result
../svdSZfloat  samples/NYX-PS0.1 512 256 >>svdSZcrPS0.1.result


../svdSZfloat  samples/NYX-ES0.01 512 25 >>svdSZcrES0.01.result
../svdSZfloat  samples/NYX-ES0.05 512 128 >>svdSZcrES0.05.result
../svdSZfloat  samples/NYX-ES0.1 512 256 >>svdSZcrES0.1.result

../svdSZfloat  samples/NYX-RS0.01 512 25 >>svdSZcrRS0.01.result
../svdSZfloat  samples/NYX-RS0.05 512 128 >>svdSZcrRS0.05.result
../svdSZfloat  samples/NYX-RS0.1 512 256 >>svdSZcrRS0.1.result

echo XGC
../svdSZ samples/XGC-PS0.01 512 206 >>svdSZcrPS0.01.result
../svdSZ samples/XGC-PS0.05 512 1030 >>svdSZcrPS0.05.result
../svdSZ samples/XGC-PS0.1 512 2069 >>svdSZcrPS0.1.result

../svdSZ samples/XGC-ES0.01 512 206 >>svdSZcrES0.01.result
../svdSZ samples/XGC-ES0.05 512 1030 >>svdSZcrES0.05.result
../svdSZ samples/XGC-ES0.1 512 2069 >>svdSZcrES0.1.result

../svdSZ samples/XGC-RS0.01 512 206 >>svdSZcrRS0.01.result
../svdSZ samples/XGC-RS0.05 512 1030 >>svdSZcrRS0.05.result
../svdSZ samples/XGC-RS0.1 512 2069 >>svdSZcrRS0.1.result

echo SD
../svdSZ samples/S3D-PS0.01 500 500 5 >>svdSZcrPS0.01.result
../svdSZ samples/S3D-PS0.05 500 500 25 >>svdSZcrPS0.05.result
../svdSZ samples/S3D-PS0.1 500 500 50 >>svdSZcrPS0.1.result

../svdSZ samples/S3D-ES0.01 500 500 5 >>svdSZcrES0.01.result
../svdSZ samples/S3D-ES0.05 500 500 25 >>svdSZcrES0.05.result
../svdSZ samples/S3D-ES0.1 500 500 50 >>svdSZcrES0.1.result


../svdSZ samples/S3D-RS0.01 500 500 5 >>svdSZcrRS0.01.result
../svdSZ samples/S3D-RS0.05 500 500 25 >>svdSZcrRS0.05.result
../svdSZ samples/S3D-RS0.1 500 500 50 >>svdSZcrRS0.1.result
