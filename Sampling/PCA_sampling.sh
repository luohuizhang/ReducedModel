rm pcaPS0.*
rm pcaES0.*
rm pcaRS0.*
echo Heat3d
./pca samples/Heat3dPS0.01 192 192 1 >>pcaPS0.01.result
./pca samples/Heat3dPS0.05 192 192 9 >>pcaPS0.05.result
./pca samples/Heat3dPS0.1 192 192 19 >>pcaPS0.1.result


./pca samples/Heat3dES0.01 192 192 1 >>pcaES0.01.result
./pca samples/Heat3dES0.05 192 192 9 >>pcaES0.05.result
./pca samples/Heat3dES0.1 192 192 19 >>pcaES0.1.result


./pca samples/Heat3dRS0.01 192 192 1 >>pcaRS0.01.result
./pca samples/Heat3dRS0.05 192 192 9 >>pcaRS0.05.result
./pca samples/Heat3dRS0.1 192 192 19 >>pcaRS0.1.result

echo Laplace
./pca samples/LaplacePS0.01 960 9 >>pcaPS0.01.result 
./pca samples/LaplacePS0.05 960 48 >>pcaPS0.05.result 
./pca samples/LaplacePS0.1 960 96 >>pcaPS0.1.result 


./pca samples/LaplaceES0.01 960 9 >>pcaES0.01.result 
./pca samples/LaplaceES0.05 960 48 >>pcaES0.05.result 
./pca samples/LaplaceES0.1 960 96 >>pcaES0.1.result 


./pca samples/LaplaceRS0.01 960 9 >>pcaRS0.01.result 
./pca samples/LaplaceRS0.05 960 48 >>pcaRS0.05.result 
./pca samples/LaplaceRS0.1 960 96 >>pcaRS0.1.result 

echo Wave
./pca samples/WavePS0.01 80 5 >>pcaPS0.01.result
./pca samples/WavePS0.05 80 25 >>pcaPS0.05.result
./pca samples/WavePS0.1 80 51 >>pcaPS0.1.result

./pca samples/WaveES0.01 80 5 >>pcaES0.01.result
./pca samples/WaveES0.05 80 25 >>pcaES0.05.result
./pca samples/WaveES0.1 80 51 >>pcaES0.1.result

./pca samples/WaveRS0.01 80 5 >>pcaRS0.01.result
./pca samples/WaveRS0.05 80 25 >>pcaRS0.05.result
./pca samples/WaveRS0.1 80 51 >>pcaRS0.1.result

echo Sedov
./pca samples/SedovPS0.01 200 2 >>pcaPS0.01.result
./pca samples/SedovPS0.05 200 10 >>pcaPS0.05.result
./pca samples/SedovPS0.1 200 20 >>pcaPS0.1.result

./pca samples/SedovES0.01 200 2 >>pcaES0.01.result
./pca samples/SedovES0.05 200 10 >>pcaES0.05.result
./pca samples/SedovES0.1 200 20 >>pcaES0.1.result


./pca samples/SedovRS0.01 200 2 >>pcaRS0.01.result
./pca samples/SedovRS0.05 200 10 >>pcaRS0.05.result
./pca samples/SedovRS0.1 200 20 >>pcaRS0.1.result


echo Astro
./pca samples/AstroPS0.01 256 2 >>pcaPS0.01.result
./pca samples/AstroPS0.05 256 12 >>pcaPS0.05.result
./pca samples/AstroPS0.1 256 25 >>pcaPS0.1.result

./pca samples/AstroES0.01 256 2 >>pcaES0.01.result
./pca samples/AstroES0.05 256 12 >>pcaES0.05.result
./pca samples/AstroES0.1 256 25 >>pcaES0.1.result

./pca samples/AstroRS0.01 256 2 >>pcaRS0.01.result
./pca samples/AstroRS0.05 256 12 >>pcaRS0.05.result
./pca samples/AstroRS0.1 256 25 >>pcaRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
./pcafloat samples/HurricanePS0.01  500 50 >>pcaPS0.01.result
./pcafloat samples/HurricanePS0.05  500 250 >>pcaPS0.05.result
./pcafloat samples/HurricanePS0.1  500 500 >>pcaPS0.1.result

./pcafloat samples/HurricaneES0.01  500 50 >>pcaES0.01.result
./pcafloat samples/HurricaneES0.05  500 250 >>pcaES0.05.result
./pcafloat samples/HurricaneES0.1  500 500 >>pcaES0.1.result

./pcafloat samples/HurricaneRS0.01  500 50 >>pcaRS0.01.result
./pcafloat samples/HurricaneRS0.05  500 250 >>pcaRS0.05.result
./pcafloat samples/HurricaneRS0.1  500 500 >>pcaRS0.1.result

echo CESM-ATM
./pcafloat samples/CESM-PS0.01 1800 36 >>pcaPS0.01.result
./pcafloat samples/CESM-PS0.05 1800 180 >>pcaPS0.05.result
./pcafloat samples/CESM-PS0.1 1800 360 >>pcaPS0.1.result

./pcafloat samples/CESM-ES0.01 1800 36 >>pcaES0.01.result
./pcafloat samples/CESM-ES0.05 1800 180 >>pcaES0.05.result
./pcafloat samples/CESM-ES0.1 1800 360 >>pcaES0.1.result

./pcafloat samples/CESM-RS0.01 1800 36 >>pcaRS0.01.result
./pcafloat samples/CESM-RS0.05 1800 180 >>pcaRS0.05.result
./pcafloat samples/CESM-RS0.1 1800 360 >>pcaRS0.1.result

echo NYX
./pcafloat  samples/NYX-PS0.01 512 25 >>pcaPS0.01.result
./pcafloat  samples/NYX-PS0.05 512 128 >>pcaPS0.05.result
./pcafloat  samples/NYX-PS0.1 512 256 >>pcaPS0.1.result


./pcafloat  samples/NYX-ES0.01 512 25 >>pcaES0.01.result
./pcafloat  samples/NYX-ES0.05 512 128 >>pcaES0.05.result
./pcafloat  samples/NYX-ES0.1 512 256 >>pcaES0.1.result

./pcafloat  samples/NYX-RS0.01 512 25 >>pcaRS0.01.result
./pcafloat  samples/NYX-RS0.05 512 128 >>pcaRS0.05.result
./pcafloat  samples/NYX-RS0.1 512 256 >>pcaRS0.1.result

echo XGC
./pca samples/XGC-PS0.01 512 206 >>pcaPS0.01.result
./pca samples/XGC-PS0.05 512 1030 >>pcaPS0.05.result
./pca samples/XGC-PS0.1 512 2069 >>pcaPS0.1.result

./pca samples/XGC-ES0.01 512 206 >>pcaES0.01.result
./pca samples/XGC-ES0.05 512 1030 >>pcaES0.05.result
./pca samples/XGC-ES0.1 512 2069 >>pcaES0.1.result

./pca samples/XGC-RS0.01 512 206 >>pcaRS0.01.result
./pca samples/XGC-RS0.05 512 1030 >>pcaRS0.05.result
./pca samples/XGC-RS0.1 512 2069 >>pcaRS0.1.result

echo SD
./pca samples/S3D-PS0.01 500 500 5 >>pcaPS0.01.result
./pca samples/S3D-PS0.05 500 500 25 >>pcaPS0.05.result
./pca samples/S3D-PS0.1 500 500 50 >>pcaPS0.1.result

./pca samples/S3D-ES0.01 500 500 5 >>pcaES0.01.result
./pca samples/S3D-ES0.05 500 500 25 >>pcaES0.05.result
./pca samples/S3D-ES0.1 500 500 50 >>pcaES0.1.result


./pca samples/S3D-RS0.01 500 500 5 >>pcaRS0.01.result
./pca samples/S3D-RS0.05 500 500 25 >>pcaRS0.05.result
./pca samples/S3D-RS0.1 500 500 50 >>pcaRS0.1.result
