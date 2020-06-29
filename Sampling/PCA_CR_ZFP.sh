rm pcaZFPcrPS0.*
rm pcaZFPcrES0.*
rm pcaZFPcrRS0.*
echo Heat3d
../pcaZFP samples/Heat3dPS0.01 192 192 1 >>pcaZFPcrPS0.01.result
../pcaZFP samples/Heat3dPS0.05 192 192 9 >>pcaZFPcrPS0.05.result
../pcaZFP samples/Heat3dPS0.1 192 192 19 >>pcaZFPcrPS0.1.result


../pcaZFP samples/Heat3dES0.01 192 192 1 >>pcaZFPcrES0.01.result
../pcaZFP samples/Heat3dES0.05 192 192 9 >>pcaZFPcrES0.05.result
../pcaZFP samples/Heat3dES0.1 192 192 19 >>pcaZFPcrES0.1.result


../pcaZFP samples/Heat3dRS0.01 192 192 1 >>pcaZFPcrRS0.01.result
../pcaZFP samples/Heat3dRS0.05 192 192 9 >>pcaZFPcrRS0.05.result
../pcaZFP samples/Heat3dRS0.1 192 192 19 >>pcaZFPcrRS0.1.result

echo Laplace
../pcaZFP samples/LaplacePS0.01 960 9 >>pcaZFPcrPS0.01.result 
../pcaZFP samples/LaplacePS0.05 960 48 >>pcaZFPcrPS0.05.result 
../pcaZFP samples/LaplacePS0.1 960 96 >>pcaZFPcrPS0.1.result 


../pcaZFP samples/LaplaceES0.01 960 9 >>pcaZFPcrES0.01.result 
../pcaZFP samples/LaplaceES0.05 960 48 >>pcaZFPcrES0.05.result 
../pcaZFP samples/LaplaceES0.1 960 96 >>pcaZFPcrES0.1.result 


../pcaZFP samples/LaplaceRS0.01 960 9 >>pcaZFPcrRS0.01.result 
../pcaZFP samples/LaplaceRS0.05 960 48 >>pcaZFPcrRS0.05.result 
../pcaZFP samples/LaplaceRS0.1 960 96 >>pcaZFPcrRS0.1.result 

echo Wave
../pcaZFP samples/WavePS0.01 80 5 >>pcaZFPcrPS0.01.result
../pcaZFP samples/WavePS0.05 80 25 >>pcaZFPcrPS0.05.result
../pcaZFP samples/WavePS0.1 80 51 >>pcaZFPcrPS0.1.result

../pcaZFP samples/WaveES0.01 80 5 >>pcaZFPcrES0.01.result
../pcaZFP samples/WaveES0.05 80 25 >>pcaZFPcrES0.05.result
../pcaZFP samples/WaveES0.1 80 51 >>pcaZFPcrES0.1.result

../pcaZFP samples/WaveRS0.01 80 5 >>pcaZFPcrRS0.01.result
../pcaZFP samples/WaveRS0.05 80 25 >>pcaZFPcrRS0.05.result
../pcaZFP samples/WaveRS0.1 80 51 >>pcaZFPcrRS0.1.result

echo Sedov
../pcaZFP samples/SedovPS0.01 200 2 >>pcaZFPcrPS0.01.result
../pcaZFP samples/SedovPS0.05 200 10 >>pcaZFPcrPS0.05.result
../pcaZFP samples/SedovPS0.1 200 20 >>pcaZFPcrPS0.1.result

../pcaZFP samples/SedovES0.01 200 2 >>pcaZFPcrES0.01.result
../pcaZFP samples/SedovES0.05 200 10 >>pcaZFPcrES0.05.result
../pcaZFP samples/SedovES0.1 200 20 >>pcaZFPcrES0.1.result


../pcaZFP samples/SedovRS0.01 200 2 >>pcaZFPcrRS0.01.result
../pcaZFP samples/SedovRS0.05 200 10 >>pcaZFPcrRS0.05.result
../pcaZFP samples/SedovRS0.1 200 20 >>pcaZFPcrRS0.1.result


echo Astro
../pcaZFP samples/AstroPS0.01 256 2 >>pcaZFPcrPS0.01.result
../pcaZFP samples/AstroPS0.05 256 12 >>pcaZFPcrPS0.05.result
../pcaZFP samples/AstroPS0.1 256 25 >>pcaZFPcrPS0.1.result

../pcaZFP samples/AstroES0.01 256 2 >>pcaZFPcrES0.01.result
../pcaZFP samples/AstroES0.05 256 12 >>pcaZFPcrES0.05.result
../pcaZFP samples/AstroES0.1 256 25 >>pcaZFPcrES0.1.result

../pcaZFP samples/AstroRS0.01 256 2 >>pcaZFPcrRS0.01.result
../pcaZFP samples/AstroRS0.05 256 12 >>pcaZFPcrRS0.05.result
../pcaZFP samples/AstroRS0.1 256 25 >>pcaZFPcrRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../pcaZFPfloat samples/HurricanePS0.01  500 50 >>pcaZFPcrPS0.01.result
../pcaZFPfloat samples/HurricanePS0.05  500 250 >>pcaZFPcrPS0.05.result
../pcaZFPfloat samples/HurricanePS0.1  500 500 >>pcaZFPcrPS0.1.result

../pcaZFPfloat samples/HurricaneES0.01  500 50 >>pcaZFPcrES0.01.result
../pcaZFPfloat samples/HurricaneES0.05  500 250 >>pcaZFPcrES0.05.result
../pcaZFPfloat samples/HurricaneES0.1  500 500 >>pcaZFPcrES0.1.result

../pcaZFPfloat samples/HurricaneRS0.01  500 50 >>pcaZFPcrRS0.01.result
../pcaZFPfloat samples/HurricaneRS0.05  500 250 >>pcaZFPcrRS0.05.result
../pcaZFPfloat samples/HurricaneRS0.1  500 500 >>pcaZFPcrRS0.1.result

echo CESM-ATM
../pcaZFPfloat samples/CESM-PS0.01 1800 36 >>pcaZFPcrPS0.01.result
../pcaZFPfloat samples/CESM-PS0.05 1800 180 >>pcaZFPcrPS0.05.result
../pcaZFPfloat samples/CESM-PS0.1 1800 360 >>pcaZFPcrPS0.1.result

../pcaZFPfloat samples/CESM-ES0.01 1800 36 >>pcaZFPcrES0.01.result
../pcaZFPfloat samples/CESM-ES0.05 1800 180 >>pcaZFPcrES0.05.result
../pcaZFPfloat samples/CESM-ES0.1 1800 360 >>pcaZFPcrES0.1.result

../pcaZFPfloat samples/CESM-RS0.01 1800 36 >>pcaZFPcrRS0.01.result
../pcaZFPfloat samples/CESM-RS0.05 1800 180 >>pcaZFPcrRS0.05.result
../pcaZFPfloat samples/CESM-RS0.1 1800 360 >>pcaZFPcrRS0.1.result

echo NYX
../pcaZFPfloat  samples/NYX-PS0.01 512 25 >>pcaZFPcrPS0.01.result
../pcaZFPfloat  samples/NYX-PS0.05 512 128 >>pcaZFPcrPS0.05.result
../pcaZFPfloat  samples/NYX-PS0.1 512 256 >>pcaZFPcrPS0.1.result


../pcaZFPfloat  samples/NYX-ES0.01 512 25 >>pcaZFPcrES0.01.result
../pcaZFPfloat  samples/NYX-ES0.05 512 128 >>pcaZFPcrES0.05.result
../pcaZFPfloat  samples/NYX-ES0.1 512 256 >>pcaZFPcrES0.1.result

../pcaZFPfloat  samples/NYX-RS0.01 512 25 >>pcaZFPcrRS0.01.result
../pcaZFPfloat  samples/NYX-RS0.05 512 128 >>pcaZFPcrRS0.05.result
../pcaZFPfloat  samples/NYX-RS0.1 512 256 >>pcaZFPcrRS0.1.result

echo XGC
../pcaZFP samples/XGC-PS0.01 512 206 >>pcaZFPcrPS0.01.result
../pcaZFP samples/XGC-PS0.05 512 1030 >>pcaZFPcrPS0.05.result
../pcaZFP samples/XGC-PS0.1 512 2069 >>pcaZFPcrPS0.1.result

../pcaZFP samples/XGC-ES0.01 512 206 >>pcaZFPcrES0.01.result
../pcaZFP samples/XGC-ES0.05 512 1030 >>pcaZFPcrES0.05.result
../pcaZFP samples/XGC-ES0.1 512 2069 >>pcaZFPcrES0.1.result

../pcaZFP samples/XGC-RS0.01 512 206 >>pcaZFPcrRS0.01.result
../pcaZFP samples/XGC-RS0.05 512 1030 >>pcaZFPcrRS0.05.result
../pcaZFP samples/XGC-RS0.1 512 2069 >>pcaZFPcrRS0.1.result

echo SD
../pcaZFP samples/S3D-PS0.01 500 500 5 >>pcaZFPcrPS0.01.result
../pcaZFP samples/S3D-PS0.05 500 500 25 >>pcaZFPcrPS0.05.result
../pcaZFP samples/S3D-PS0.1 500 500 50 >>pcaZFPcrPS0.1.result

../pcaZFP samples/S3D-ES0.01 500 500 5 >>pcaZFPcrES0.01.result
../pcaZFP samples/S3D-ES0.05 500 500 25 >>pcaZFPcrES0.05.result
../pcaZFP samples/S3D-ES0.1 500 500 50 >>pcaZFPcrES0.1.result


../pcaZFP samples/S3D-RS0.01 500 500 5 >>pcaZFPcrRS0.01.result
../pcaZFP samples/S3D-RS0.05 500 500 25 >>pcaZFPcrRS0.05.result
../pcaZFP samples/S3D-RS0.1 500 500 50 >>pcaZFPcrRS0.1.result
