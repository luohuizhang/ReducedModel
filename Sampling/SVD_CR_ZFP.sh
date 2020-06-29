rm svdZFPcrPS0.*
rm svdZFPcrES0.*
rm svdZFPcrRS0.*
echo Heat3d
../svdZFP samples/Heat3dPS0.01 192 192 1 >>svdZFPcrPS0.01.result
../svdZFP samples/Heat3dPS0.05 192 192 9 >>svdZFPcrPS0.05.result
../svdZFP samples/Heat3dPS0.1 192 192 19 >>svdZFPcrPS0.1.result


../svdZFP samples/Heat3dES0.01 192 192 1 >>svdZFPcrES0.01.result
../svdZFP samples/Heat3dES0.05 192 192 9 >>svdZFPcrES0.05.result
../svdZFP samples/Heat3dES0.1 192 192 19 >>svdZFPcrES0.1.result


../svdZFP samples/Heat3dRS0.01 192 192 1 >>svdZFPcrRS0.01.result
../svdZFP samples/Heat3dRS0.05 192 192 9 >>svdZFPcrRS0.05.result
../svdZFP samples/Heat3dRS0.1 192 192 19 >>svdZFPcrRS0.1.result

echo Laplace
../svdZFP samples/LaplacePS0.01 960 9 >>svdZFPcrPS0.01.result 
../svdZFP samples/LaplacePS0.05 960 48 >>svdZFPcrPS0.05.result 
../svdZFP samples/LaplacePS0.1 960 96 >>svdZFPcrPS0.1.result 


../svdZFP samples/LaplaceES0.01 960 9 >>svdZFPcrES0.01.result 
../svdZFP samples/LaplaceES0.05 960 48 >>svdZFPcrES0.05.result 
../svdZFP samples/LaplaceES0.1 960 96 >>svdZFPcrES0.1.result 


../svdZFP samples/LaplaceRS0.01 960 9 >>svdZFPcrRS0.01.result 
../svdZFP samples/LaplaceRS0.05 960 48 >>svdZFPcrRS0.05.result 
../svdZFP samples/LaplaceRS0.1 960 96 >>svdZFPcrRS0.1.result 

echo Wave
../svdZFP samples/WavePS0.01 80 5 >>svdZFPcrPS0.01.result
../svdZFP samples/WavePS0.05 80 25 >>svdZFPcrPS0.05.result
../svdZFP samples/WavePS0.1 80 51 >>svdZFPcrPS0.1.result

../svdZFP samples/WaveES0.01 80 5 >>svdZFPcrES0.01.result
../svdZFP samples/WaveES0.05 80 25 >>svdZFPcrES0.05.result
../svdZFP samples/WaveES0.1 80 51 >>svdZFPcrES0.1.result

../svdZFP samples/WaveRS0.01 80 5 >>svdZFPcrRS0.01.result
../svdZFP samples/WaveRS0.05 80 25 >>svdZFPcrRS0.05.result
../svdZFP samples/WaveRS0.1 80 51 >>svdZFPcrRS0.1.result

echo Sedov
../svdZFP samples/SedovPS0.01 200 2 >>svdZFPcrPS0.01.result
../svdZFP samples/SedovPS0.05 200 10 >>svdZFPcrPS0.05.result
../svdZFP samples/SedovPS0.1 200 20 >>svdZFPcrPS0.1.result

../svdZFP samples/SedovES0.01 200 2 >>svdZFPcrES0.01.result
../svdZFP samples/SedovES0.05 200 10 >>svdZFPcrES0.05.result
../svdZFP samples/SedovES0.1 200 20 >>svdZFPcrES0.1.result


../svdZFP samples/SedovRS0.01 200 2 >>svdZFPcrRS0.01.result
../svdZFP samples/SedovRS0.05 200 10 >>svdZFPcrRS0.05.result
../svdZFP samples/SedovRS0.1 200 20 >>svdZFPcrRS0.1.result


echo Astro
../svdZFP samples/AstroPS0.01 256 2 >>svdZFPcrPS0.01.result
../svdZFP samples/AstroPS0.05 256 12 >>svdZFPcrPS0.05.result
../svdZFP samples/AstroPS0.1 256 25 >>svdZFPcrPS0.1.result

../svdZFP samples/AstroES0.01 256 2 >>svdZFPcrES0.01.result
../svdZFP samples/AstroES0.05 256 12 >>svdZFPcrES0.05.result
../svdZFP samples/AstroES0.1 256 25 >>svdZFPcrES0.1.result

../svdZFP samples/AstroRS0.01 256 2 >>svdZFPcrRS0.01.result
../svdZFP samples/AstroRS0.05 256 12 >>svdZFPcrRS0.05.result
../svdZFP samples/AstroRS0.1 256 25 >>svdZFPcrRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../svdZFPfloat samples/HurricanePS0.01  500 50 >>svdZFPcrPS0.01.result
../svdZFPfloat samples/HurricanePS0.05  500 250 >>svdZFPcrPS0.05.result
../svdZFPfloat samples/HurricanePS0.1  500 500 >>svdZFPcrPS0.1.result

../svdZFPfloat samples/HurricaneES0.01  500 50 >>svdZFPcrES0.01.result
../svdZFPfloat samples/HurricaneES0.05  500 250 >>svdZFPcrES0.05.result
../svdZFPfloat samples/HurricaneES0.1  500 500 >>svdZFPcrES0.1.result

../svdZFPfloat samples/HurricaneRS0.01  500 50 >>svdZFPcrRS0.01.result
../svdZFPfloat samples/HurricaneRS0.05  500 250 >>svdZFPcrRS0.05.result
../svdZFPfloat samples/HurricaneRS0.1  500 500 >>svdZFPcrRS0.1.result

echo CESM-ATM
../svdZFPfloat samples/CESM-PS0.01 1800 36 >>svdZFPcrPS0.01.result
../svdZFPfloat samples/CESM-PS0.05 1800 180 >>svdZFPcrPS0.05.result
../svdZFPfloat samples/CESM-PS0.1 1800 360 >>svdZFPcrPS0.1.result

../svdZFPfloat samples/CESM-ES0.01 1800 36 >>svdZFPcrES0.01.result
../svdZFPfloat samples/CESM-ES0.05 1800 180 >>svdZFPcrES0.05.result
../svdZFPfloat samples/CESM-ES0.1 1800 360 >>svdZFPcrES0.1.result

../svdZFPfloat samples/CESM-RS0.01 1800 36 >>svdZFPcrRS0.01.result
../svdZFPfloat samples/CESM-RS0.05 1800 180 >>svdZFPcrRS0.05.result
../svdZFPfloat samples/CESM-RS0.1 1800 360 >>svdZFPcrRS0.1.result

echo NYX
../svdZFPfloat  samples/NYX-PS0.01 512 25 >>svdZFPcrPS0.01.result
../svdZFPfloat  samples/NYX-PS0.05 512 128 >>svdZFPcrPS0.05.result
../svdZFPfloat  samples/NYX-PS0.1 512 256 >>svdZFPcrPS0.1.result


../svdZFPfloat  samples/NYX-ES0.01 512 25 >>svdZFPcrES0.01.result
../svdZFPfloat  samples/NYX-ES0.05 512 128 >>svdZFPcrES0.05.result
../svdZFPfloat  samples/NYX-ES0.1 512 256 >>svdZFPcrES0.1.result

../svdZFPfloat  samples/NYX-RS0.01 512 25 >>svdZFPcrRS0.01.result
../svdZFPfloat  samples/NYX-RS0.05 512 128 >>svdZFPcrRS0.05.result
../svdZFPfloat  samples/NYX-RS0.1 512 256 >>svdZFPcrRS0.1.result

echo XGC
../svdZFP samples/XGC-PS0.01 512 206 >>svdZFPcrPS0.01.result
../svdZFP samples/XGC-PS0.05 512 1030 >>svdZFPcrPS0.05.result
../svdZFP samples/XGC-PS0.1 512 2069 >>svdZFPcrPS0.1.result

../svdZFP samples/XGC-ES0.01 512 206 >>svdZFPcrES0.01.result
../svdZFP samples/XGC-ES0.05 512 1030 >>svdZFPcrES0.05.result
../svdZFP samples/XGC-ES0.1 512 2069 >>svdZFPcrES0.1.result

../svdZFP samples/XGC-RS0.01 512 206 >>svdZFPcrRS0.01.result
../svdZFP samples/XGC-RS0.05 512 1030 >>svdZFPcrRS0.05.result
../svdZFP samples/XGC-RS0.1 512 2069 >>svdZFPcrRS0.1.result

echo SD
../svdZFP samples/S3D-PS0.01 500 500 5 >>svdZFPcrPS0.01.result
../svdZFP samples/S3D-PS0.05 500 500 25 >>svdZFPcrPS0.05.result
../svdZFP samples/S3D-PS0.1 500 500 50 >>svdZFPcrPS0.1.result

../svdZFP samples/S3D-ES0.01 500 500 5 >>svdZFPcrES0.01.result
../svdZFP samples/S3D-ES0.05 500 500 25 >>svdZFPcrES0.05.result
../svdZFP samples/S3D-ES0.1 500 500 50 >>svdZFPcrES0.1.result


../svdZFP samples/S3D-RS0.01 500 500 5 >>svdZFPcrRS0.01.result
../svdZFP samples/S3D-RS0.05 500 500 25 >>svdZFPcrRS0.05.result
../svdZFP samples/S3D-RS0.1 500 500 50 >>svdZFPcrRS0.1.result
