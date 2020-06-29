rm SZPS0.*
rm SZES0.*
rm SZRS0.*
echo Heat3d
../SZ samples/Heat3dPS0.01 192 192 1 >>SZPS0.01.result
../SZ samples/Heat3dPS0.05 192 192 9 >>SZPS0.05.result
../SZ samples/Heat3dPS0.1 192 192 19 >>SZPS0.1.result


../SZ samples/Heat3dES0.01 192 192 1 >>SZES0.01.result
../SZ samples/Heat3dES0.05 192 192 9 >>SZES0.05.result
../SZ samples/Heat3dES0.1 192 192 19 >>SZES0.1.result


../SZ samples/Heat3dRS0.01 192 192 1 >>SZRS0.01.result
../SZ samples/Heat3dRS0.05 192 192 9 >>SZRS0.05.result
../SZ samples/Heat3dRS0.1 192 192 19 >>SZRS0.1.result

echo Laplace
../SZ samples/LaplacePS0.01 960 9 >>SZPS0.01.result 
../SZ samples/LaplacePS0.05 960 48 >>SZPS0.05.result 
../SZ samples/LaplacePS0.1 960 96 >>SZPS0.1.result 


../SZ samples/LaplaceES0.01 960 9 >>SZES0.01.result 
../SZ samples/LaplaceES0.05 960 48 >>SZES0.05.result 
../SZ samples/LaplaceES0.1 960 96 >>SZES0.1.result 


../SZ samples/LaplaceRS0.01 960 9 >>SZRS0.01.result 
../SZ samples/LaplaceRS0.05 960 48 >>SZRS0.05.result 
../SZ samples/LaplaceRS0.1 960 96 >>SZRS0.1.result 

echo Wave
../SZ samples/WavePS0.01 80 5 >>SZPS0.01.result
../SZ samples/WavePS0.05 80 25 >>SZPS0.05.result
../SZ samples/WavePS0.1 80 51 >>SZPS0.1.result

../SZ samples/WaveES0.01 80 5 >>SZES0.01.result
../SZ samples/WaveES0.05 80 25 >>SZES0.05.result
../SZ samples/WaveES0.1 80 51 >>SZES0.1.result

../SZ samples/WaveRS0.01 80 5 >>SZRS0.01.result
../SZ samples/WaveRS0.05 80 25 >>SZRS0.05.result
../SZ samples/WaveRS0.1 80 51 >>SZRS0.1.result

echo Sedov
../SZ samples/SedovPS0.01 200 2 >>SZPS0.01.result
../SZ samples/SedovPS0.05 200 10 >>SZPS0.05.result
../SZ samples/SedovPS0.1 200 20 >>SZPS0.1.result

../SZ samples/SedovES0.01 200 2 >>SZES0.01.result
../SZ samples/SedovES0.05 200 10 >>SZES0.05.result
../SZ samples/SedovES0.1 200 20 >>SZES0.1.result


../SZ samples/SedovRS0.01 200 2 >>SZRS0.01.result
../SZ samples/SedovRS0.05 200 10 >>SZRS0.05.result
../SZ samples/SedovRS0.1 200 20 >>SZRS0.1.result


echo Astro
../SZ samples/AstroPS0.01 256 2 >>SZPS0.01.result
../SZ samples/AstroPS0.05 256 12 >>SZPS0.05.result
../SZ samples/AstroPS0.1 256 25 >>SZPS0.1.result

../SZ samples/AstroES0.01 256 2 >>SZES0.01.result
../SZ samples/AstroES0.05 256 12 >>SZES0.05.result
../SZ samples/AstroES0.1 256 25 >>SZES0.1.result

../SZ samples/AstroRS0.01 256 2 >>SZRS0.01.result
../SZ samples/AstroRS0.05 256 12 >>SZRS0.05.result
../SZ samples/AstroRS0.1 256 25 >>SZRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../SZfloat samples/HurricanePS0.01  500 50 >>SZPS0.01.result
../SZfloat samples/HurricanePS0.05  500 250 >>SZPS0.05.result
../SZfloat samples/HurricanePS0.1  500 500 >>SZPS0.1.result

../SZfloat samples/HurricaneES0.01  500 50 >>SZES0.01.result
../SZfloat samples/HurricaneES0.05  500 250 >>SZES0.05.result
../SZfloat samples/HurricaneES0.1  500 500 >>SZES0.1.result

../SZfloat samples/HurricaneRS0.01  500 50 >>SZRS0.01.result
../SZfloat samples/HurricaneRS0.05  500 250 >>SZRS0.05.result
../SZfloat samples/HurricaneRS0.1  500 500 >>SZRS0.1.result

echo CESM-ATM
../SZfloat samples/CESM-PS0.01 1800 36 >>SZPS0.01.result
../SZfloat samples/CESM-PS0.05 1800 180 >>SZPS0.05.result
../SZfloat samples/CESM-PS0.1 1800 360 >>SZPS0.1.result

../SZfloat samples/CESM-ES0.01 1800 36 >>SZES0.01.result
../SZfloat samples/CESM-ES0.05 1800 180 >>SZES0.05.result
../SZfloat samples/CESM-ES0.1 1800 360 >>SZES0.1.result

../SZfloat samples/CESM-RS0.01 1800 36 >>SZRS0.01.result
../SZfloat samples/CESM-RS0.05 1800 180 >>SZRS0.05.result
../SZfloat samples/CESM-RS0.1 1800 360 >>SZRS0.1.result

echo NYX
../SZfloat  samples/NYX-PS0.01 512 25 >>SZPS0.01.result
../SZfloat  samples/NYX-PS0.05 512 128 >>SZPS0.05.result
../SZfloat  samples/NYX-PS0.1 512 256 >>SZPS0.1.result


../SZfloat  samples/NYX-ES0.01 512 25 >>SZES0.01.result
../SZfloat  samples/NYX-ES0.05 512 128 >>SZES0.05.result
../SZfloat  samples/NYX-ES0.1 512 256 >>SZES0.1.result

../SZfloat  samples/NYX-RS0.01 512 25 >>SZRS0.01.result
../SZfloat  samples/NYX-RS0.05 512 128 >>SZRS0.05.result
../SZfloat  samples/NYX-RS0.1 512 256 >>SZRS0.1.result

echo XGC
../SZ samples/XGC-PS0.01 512 206 >>SZPS0.01.result
../SZ samples/XGC-PS0.05 512 1030 >>SZPS0.05.result
../SZ samples/XGC-PS0.1 512 2069 >>SZPS0.1.result

../SZ samples/XGC-ES0.01 512 206 >>SZES0.01.result
../SZ samples/XGC-ES0.05 512 1030 >>SZES0.05.result
../SZ samples/XGC-ES0.1 512 2069 >>SZES0.1.result

../SZ samples/XGC-RS0.01 512 206 >>SZRS0.01.result
../SZ samples/XGC-RS0.05 512 1030 >>SZRS0.05.result
../SZ samples/XGC-RS0.1 512 2069 >>SZRS0.1.result

echo SD
../SZ samples/S3D-PS0.01 500 500 5 >>SZPS0.01.result
../SZ samples/S3D-PS0.05 500 500 25 >>SZPS0.05.result
../SZ samples/S3D-PS0.1 500 500 50 >>SZPS0.1.result

../SZ samples/S3D-ES0.01 500 500 5 >>SZES0.01.result
../SZ samples/S3D-ES0.05 500 500 25 >>SZES0.05.result
../SZ samples/S3D-ES0.1 500 500 50 >>SZES0.1.result


../SZ samples/S3D-RS0.01 500 500 5 >>SZRS0.01.result
../SZ samples/S3D-RS0.05 500 500 25 >>SZRS0.05.result
../SZ samples/S3D-RS0.1 500 500 50 >>SZRS0.1.result
