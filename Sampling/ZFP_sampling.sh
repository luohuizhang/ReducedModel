rm ZFPPS0.*
rm ZFPES0.*
rm ZFPRS0.*
echo Heat3d
../ZFP samples/Heat3dPS0.01 192 192 1 >>ZFPPS0.01.result
../ZFP samples/Heat3dPS0.05 192 192 9 >>ZFPPS0.05.result
../ZFP samples/Heat3dPS0.1 192 192 19 >>ZFPPS0.1.result


../ZFP samples/Heat3dES0.01 192 192 1 >>ZFPES0.01.result
../ZFP samples/Heat3dES0.05 192 192 9 >>ZFPES0.05.result
../ZFP samples/Heat3dES0.1 192 192 19 >>ZFPES0.1.result


../ZFP samples/Heat3dRS0.01 192 192 1 >>ZFPRS0.01.result
../ZFP samples/Heat3dRS0.05 192 192 9 >>ZFPRS0.05.result
../ZFP samples/Heat3dRS0.1 192 192 19 >>ZFPRS0.1.result

echo Laplace
../ZFP samples/LaplacePS0.01 960 9 >>ZFPPS0.01.result 
../ZFP samples/LaplacePS0.05 960 48 >>ZFPPS0.05.result 
../ZFP samples/LaplacePS0.1 960 96 >>ZFPPS0.1.result 


../ZFP samples/LaplaceES0.01 960 9 >>ZFPES0.01.result 
../ZFP samples/LaplaceES0.05 960 48 >>ZFPES0.05.result 
../ZFP samples/LaplaceES0.1 960 96 >>ZFPES0.1.result 


../ZFP samples/LaplaceRS0.01 960 9 >>ZFPRS0.01.result 
../ZFP samples/LaplaceRS0.05 960 48 >>ZFPRS0.05.result 
../ZFP samples/LaplaceRS0.1 960 96 >>ZFPRS0.1.result 

echo Wave
../ZFP samples/WavePS0.01 80 5 >>ZFPPS0.01.result
../ZFP samples/WavePS0.05 80 25 >>ZFPPS0.05.result
../ZFP samples/WavePS0.1 80 51 >>ZFPPS0.1.result

../ZFP samples/WaveES0.01 80 5 >>ZFPES0.01.result
../ZFP samples/WaveES0.05 80 25 >>ZFPES0.05.result
../ZFP samples/WaveES0.1 80 51 >>ZFPES0.1.result

../ZFP samples/WaveRS0.01 80 5 >>ZFPRS0.01.result
../ZFP samples/WaveRS0.05 80 25 >>ZFPRS0.05.result
../ZFP samples/WaveRS0.1 80 51 >>ZFPRS0.1.result

echo Sedov
../ZFP samples/SedovPS0.01 200 2 >>ZFPPS0.01.result
../ZFP samples/SedovPS0.05 200 10 >>ZFPPS0.05.result
../ZFP samples/SedovPS0.1 200 20 >>ZFPPS0.1.result

../ZFP samples/SedovES0.01 200 2 >>ZFPES0.01.result
../ZFP samples/SedovES0.05 200 10 >>ZFPES0.05.result
../ZFP samples/SedovES0.1 200 20 >>ZFPES0.1.result


../ZFP samples/SedovRS0.01 200 2 >>ZFPRS0.01.result
../ZFP samples/SedovRS0.05 200 10 >>ZFPRS0.05.result
../ZFP samples/SedovRS0.1 200 20 >>ZFPRS0.1.result


echo Astro
../ZFP samples/AstroPS0.01 256 2 >>ZFPPS0.01.result
../ZFP samples/AstroPS0.05 256 12 >>ZFPPS0.05.result
../ZFP samples/AstroPS0.1 256 25 >>ZFPPS0.1.result

../ZFP samples/AstroES0.01 256 2 >>ZFPES0.01.result
../ZFP samples/AstroES0.05 256 12 >>ZFPES0.05.result
../ZFP samples/AstroES0.1 256 25 >>ZFPES0.1.result

../ZFP samples/AstroRS0.01 256 2 >>ZFPRS0.01.result
../ZFP samples/AstroRS0.05 256 12 >>ZFPRS0.05.result
../ZFP samples/AstroRS0.1 256 25 >>ZFPRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../ZFPfloat samples/HurricanePS0.01  500 50 >>ZFPPS0.01.result
../ZFPfloat samples/HurricanePS0.05  500 250 >>ZFPPS0.05.result
../ZFPfloat samples/HurricanePS0.1  500 500 >>ZFPPS0.1.result

../ZFPfloat samples/HurricaneES0.01  500 50 >>ZFPES0.01.result
../ZFPfloat samples/HurricaneES0.05  500 250 >>ZFPES0.05.result
../ZFPfloat samples/HurricaneES0.1  500 500 >>ZFPES0.1.result

../ZFPfloat samples/HurricaneRS0.01  500 50 >>ZFPRS0.01.result
../ZFPfloat samples/HurricaneRS0.05  500 250 >>ZFPRS0.05.result
../ZFPfloat samples/HurricaneRS0.1  500 500 >>ZFPRS0.1.result

echo CESM-ATM
../ZFPfloat samples/CESM-PS0.01 1800 36 >>ZFPPS0.01.result
../ZFPfloat samples/CESM-PS0.05 1800 180 >>ZFPPS0.05.result
../ZFPfloat samples/CESM-PS0.1 1800 360 >>ZFPPS0.1.result

../ZFPfloat samples/CESM-ES0.01 1800 36 >>ZFPES0.01.result
../ZFPfloat samples/CESM-ES0.05 1800 180 >>ZFPES0.05.result
../ZFPfloat samples/CESM-ES0.1 1800 360 >>ZFPES0.1.result

../ZFPfloat samples/CESM-RS0.01 1800 36 >>ZFPRS0.01.result
../ZFPfloat samples/CESM-RS0.05 1800 180 >>ZFPRS0.05.result
../ZFPfloat samples/CESM-RS0.1 1800 360 >>ZFPRS0.1.result

echo NYX
../ZFPfloat  samples/NYX-PS0.01 512 25 >>ZFPPS0.01.result
../ZFPfloat  samples/NYX-PS0.05 512 128 >>ZFPPS0.05.result
../ZFPfloat  samples/NYX-PS0.1 512 256 >>ZFPPS0.1.result


../ZFPfloat  samples/NYX-ES0.01 512 25 >>ZFPES0.01.result
../ZFPfloat  samples/NYX-ES0.05 512 128 >>ZFPES0.05.result
../ZFPfloat  samples/NYX-ES0.1 512 256 >>ZFPES0.1.result

../ZFPfloat  samples/NYX-RS0.01 512 25 >>ZFPRS0.01.result
../ZFPfloat  samples/NYX-RS0.05 512 128 >>ZFPRS0.05.result
../ZFPfloat  samples/NYX-RS0.1 512 256 >>ZFPRS0.1.result

echo XGC
../ZFP samples/XGC-PS0.01 512 206 >>ZFPPS0.01.result
../ZFP samples/XGC-PS0.05 512 1030 >>ZFPPS0.05.result
../ZFP samples/XGC-PS0.1 512 2069 >>ZFPPS0.1.result

../ZFP samples/XGC-ES0.01 512 206 >>ZFPES0.01.result
../ZFP samples/XGC-ES0.05 512 1030 >>ZFPES0.05.result
../ZFP samples/XGC-ES0.1 512 2069 >>ZFPES0.1.result

../ZFP samples/XGC-RS0.01 512 206 >>ZFPRS0.01.result
../ZFP samples/XGC-RS0.05 512 1030 >>ZFPRS0.05.result
../ZFP samples/XGC-RS0.1 512 2069 >>ZFPRS0.1.result

echo SD
../ZFP samples/S3D-PS0.01 500 500 5 >>ZFPPS0.01.result
../ZFP samples/S3D-PS0.05 500 500 25 >>ZFPPS0.05.result
../ZFP samples/S3D-PS0.1 500 500 50 >>ZFPPS0.1.result

../ZFP samples/S3D-ES0.01 500 500 5 >>ZFPES0.01.result
../ZFP samples/S3D-ES0.05 500 500 25 >>ZFPES0.05.result
../ZFP samples/S3D-ES0.1 500 500 50 >>ZFPES0.1.result


../ZFP samples/S3D-RS0.01 500 500 5 >>ZFPRS0.01.result
../ZFP samples/S3D-RS0.05 500 500 25 >>ZFPRS0.05.result
../ZFP samples/S3D-RS0.1 500 500 50 >>ZFPRS0.1.result
