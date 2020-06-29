rm svdPS0.*
rm svdES0.*
rm svdRS0.*
echo Heat3d
./svd samples/Heat3dPS0.01 192 192 1 >>svdPS0.01.result
./svd samples/Heat3dPS0.05 192 192 9 >>svdPS0.05.result
./svd samples/Heat3dPS0.1 192 192 19 >>svdPS0.1.result


./svd samples/Heat3dES0.01 192 192 1 >>svdES0.01.result
./svd samples/Heat3dES0.05 192 192 9 >>svdES0.05.result
./svd samples/Heat3dES0.1 192 192 19 >>svdES0.1.result


./svd samples/Heat3dRS0.01 192 192 1 >>svdRS0.01.result
./svd samples/Heat3dRS0.05 192 192 9 >>svdRS0.05.result
./svd samples/Heat3dRS0.1 192 192 19 >>svdRS0.1.result

echo Laplace
./svd samples/LaplacePS0.01 960 9 >>svdPS0.01.result 
./svd samples/LaplacePS0.05 960 48 >>svdPS0.05.result 
./svd samples/LaplacePS0.1 960 96 >>svdPS0.1.result 


./svd samples/LaplaceES0.01 960 9 >>svdES0.01.result 
./svd samples/LaplaceES0.05 960 48 >>svdES0.05.result 
./svd samples/LaplaceES0.1 960 96 >>svdES0.1.result 


./svd samples/LaplaceRS0.01 960 9 >>svdRS0.01.result 
./svd samples/LaplaceRS0.05 960 48 >>svdRS0.05.result 
./svd samples/LaplaceRS0.1 960 96 >>svdRS0.1.result 

echo Wave
./svd samples/WavePS0.01 80 5 >>svdPS0.01.result
./svd samples/WavePS0.05 80 25 >>svdPS0.05.result
./svd samples/WavePS0.1 80 51 >>svdPS0.1.result

./svd samples/WaveES0.01 80 5 >>svdES0.01.result
./svd samples/WaveES0.05 80 25 >>svdES0.05.result
./svd samples/WaveES0.1 80 51 >>svdES0.1.result

./svd samples/WaveRS0.01 80 5 >>svdRS0.01.result
./svd samples/WaveRS0.05 80 25 >>svdRS0.05.result
./svd samples/WaveRS0.1 80 51 >>svdRS0.1.result

echo Sedov
./svd samples/SedovPS0.01 200 2 >>svdPS0.01.result
./svd samples/SedovPS0.05 200 10 >>svdPS0.05.result
./svd samples/SedovPS0.1 200 20 >>svdPS0.1.result

./svd samples/SedovES0.01 200 2 >>svdES0.01.result
./svd samples/SedovES0.05 200 10 >>svdES0.05.result
./svd samples/SedovES0.1 200 20 >>svdES0.1.result


./svd samples/SedovRS0.01 200 2 >>svdRS0.01.result
./svd samples/SedovRS0.05 200 10 >>svdRS0.05.result
./svd samples/SedovRS0.1 200 20 >>svdRS0.1.result


echo Astro
./svd samples/AstroPS0.01 256 2 >>svdPS0.01.result
./svd samples/AstroPS0.05 256 12 >>svdPS0.05.result
./svd samples/AstroPS0.1 256 25 >>svdPS0.1.result

./svd samples/AstroES0.01 256 2 >>svdES0.01.result
./svd samples/AstroES0.05 256 12 >>svdES0.05.result
./svd samples/AstroES0.1 256 25 >>svdES0.1.result

./svd samples/AstroRS0.01 256 2 >>svdRS0.01.result
./svd samples/AstroRS0.05 256 12 >>svdRS0.05.result
./svd samples/AstroRS0.1 256 25 >>svdRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
./svdfloat samples/HurricanePS0.01  500 50 >>svdPS0.01.result
./svdfloat samples/HurricanePS0.05  500 250 >>svdPS0.05.result
./svdfloat samples/HurricanePS0.1  500 500 >>svdPS0.1.result

./svdfloat samples/HurricaneES0.01  500 50 >>svdES0.01.result
./svdfloat samples/HurricaneES0.05  500 250 >>svdES0.05.result
./svdfloat samples/HurricaneES0.1  500 500 >>svdES0.1.result

./svdfloat samples/HurricaneRS0.01  500 50 >>svdRS0.01.result
./svdfloat samples/HurricaneRS0.05  500 250 >>svdRS0.05.result
./svdfloat samples/HurricaneRS0.1  500 500 >>svdRS0.1.result

echo CESM-ATM
./svdfloat samples/CESM-PS0.01 1800 36 >>svdPS0.01.result
./svdfloat samples/CESM-PS0.05 1800 180 >>svdPS0.05.result
./svdfloat samples/CESM-PS0.1 1800 360 >>svdPS0.1.result

./svdfloat samples/CESM-ES0.01 1800 36 >>svdES0.01.result
./svdfloat samples/CESM-ES0.05 1800 180 >>svdES0.05.result
./svdfloat samples/CESM-ES0.1 1800 360 >>svdES0.1.result

./svdfloat samples/CESM-RS0.01 1800 36 >>svdRS0.01.result
./svdfloat samples/CESM-RS0.05 1800 180 >>svdRS0.05.result
./svdfloat samples/CESM-RS0.1 1800 360 >>svdRS0.1.result

echo NYX
./svdfloat  samples/NYX-PS0.01 512 25 >>svdPS0.01.result
./svdfloat  samples/NYX-PS0.05 512 128 >>svdPS0.05.result
./svdfloat  samples/NYX-PS0.1 512 256 >>svdPS0.1.result


./svdfloat  samples/NYX-ES0.01 512 25 >>svdES0.01.result
./svdfloat  samples/NYX-ES0.05 512 128 >>svdES0.05.result
./svdfloat  samples/NYX-ES0.1 512 256 >>svdES0.1.result

./svdfloat  samples/NYX-RS0.01 512 25 >>svdRS0.01.result
./svdfloat  samples/NYX-RS0.05 512 128 >>svdRS0.05.result
./svdfloat  samples/NYX-RS0.1 512 256 >>svdRS0.1.result

echo XGC

./svd samples/XGC-PS0.01 512 206 >>svdPS0.01.result
./svd samples/XGC-PS0.05 1030 512 >>svdPS0.05.result
./svd samples/XGC-PS0.1 2069 512 >>svdPS0.1.result

./svd samples/XGC-ES0.01 512 206 >>svdES0.01.result
./svd samples/XGC-ES0.05 1030 512 >>svdES0.05.result
./svd samples/XGC-ES0.1 2069 512 >>svdES0.1.result

./svd samples/XGC-RS0.01 512 206 >>svdRS0.01.result
./svd samples/XGC-RS0.05 1030 512 >>svdRS0.05.result
./svd samples/XGC-RS0.1 2069 512 >>svdRS0.1.result

echo SD
./svd samples/S3D-PS0.01 500 500 5 >>svdPS0.01.result
./svd samples/S3D-PS0.05 500 500 25 >>svdPS0.05.result
./svd samples/S3D-PS0.1 500 500 50 >>svdPS0.1.result

./svd samples/S3D-ES0.01 500 500 5 >>svdES0.01.result
./svd samples/S3D-ES0.05 500 500 25 >>svdES0.05.result
./svd samples/S3D-ES0.1 500 500 50 >>svdES0.1.result


./svd samples/S3D-RS0.01 500 500 5 >>svdRS0.01.result
./svd samples/S3D-RS0.05 500 500 25 >>svdRS0.05.result
./svd samples/S3D-RS0.1 500 500 50 >>svdRS0.1.result
