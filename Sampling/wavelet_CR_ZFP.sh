rm waveletZFPcrPS0.*
rm waveletZFPcrES0.*
rm waveletZFPcrRS0.*
echo Heat3d
../waveletZFP samples/Heat3dPS0.01 192 192 1 >>waveletZFPcrPS0.01.result
../waveletZFP samples/Heat3dPS0.05 192 192 9 >>waveletZFPcrPS0.05.result
../waveletZFP samples/Heat3dPS0.1 192 192 19 >>waveletZFPcrPS0.1.result


../waveletZFP samples/Heat3dES0.01 192 192 1 >>waveletZFPcrES0.01.result
../waveletZFP samples/Heat3dES0.05 192 192 9 >>waveletZFPcrES0.05.result
../waveletZFP samples/Heat3dES0.1 192 192 19 >>waveletZFPcrES0.1.result


../waveletZFP samples/Heat3dRS0.01 192 192 1 >>waveletZFPcrRS0.01.result
../waveletZFP samples/Heat3dRS0.05 192 192 9 >>waveletZFPcrRS0.05.result
../waveletZFP samples/Heat3dRS0.1 192 192 19 >>waveletZFPcrRS0.1.result

echo Laplace
../waveletZFP samples/LaplacePS0.01 960 9 >>waveletZFPcrPS0.01.result 
../waveletZFP samples/LaplacePS0.05 960 48 >>waveletZFPcrPS0.05.result 
../waveletZFP samples/LaplacePS0.1 960 96 >>waveletZFPcrPS0.1.result 


../waveletZFP samples/LaplaceES0.01 960 9 >>waveletZFPcrES0.01.result 
../waveletZFP samples/LaplaceES0.05 960 48 >>waveletZFPcrES0.05.result 
../waveletZFP samples/LaplaceES0.1 960 96 >>waveletZFPcrES0.1.result 


../waveletZFP samples/LaplaceRS0.01 960 9 >>waveletZFPcrRS0.01.result 
../waveletZFP samples/LaplaceRS0.05 960 48 >>waveletZFPcrRS0.05.result 
../waveletZFP samples/LaplaceRS0.1 960 96 >>waveletZFPcrRS0.1.result 

echo Wave
../waveletZFP samples/WavePS0.01 80 5 >>waveletZFPcrPS0.01.result
../waveletZFP samples/WavePS0.05 80 25 >>waveletZFPcrPS0.05.result
../waveletZFP samples/WavePS0.1 80 51 >>waveletZFPcrPS0.1.result

../waveletZFP samples/WaveES0.01 80 5 >>waveletZFPcrES0.01.result
../waveletZFP samples/WaveES0.05 80 25 >>waveletZFPcrES0.05.result
../waveletZFP samples/WaveES0.1 80 51 >>waveletZFPcrES0.1.result

../waveletZFP samples/WaveRS0.01 80 5 >>waveletZFPcrRS0.01.result
../waveletZFP samples/WaveRS0.05 80 25 >>waveletZFPcrRS0.05.result
../waveletZFP samples/WaveRS0.1 80 51 >>waveletZFPcrRS0.1.result

echo Sedov
../waveletZFP samples/SedovPS0.01 200 2 >>waveletZFPcrPS0.01.result
../waveletZFP samples/SedovPS0.05 200 10 >>waveletZFPcrPS0.05.result
../waveletZFP samples/SedovPS0.1 200 20 >>waveletZFPcrPS0.1.result

../waveletZFP samples/SedovES0.01 200 2 >>waveletZFPcrES0.01.result
../waveletZFP samples/SedovES0.05 200 10 >>waveletZFPcrES0.05.result
../waveletZFP samples/SedovES0.1 200 20 >>waveletZFPcrES0.1.result


../waveletZFP samples/SedovRS0.01 200 2 >>waveletZFPcrRS0.01.result
../waveletZFP samples/SedovRS0.05 200 10 >>waveletZFPcrRS0.05.result
../waveletZFP samples/SedovRS0.1 200 20 >>waveletZFPcrRS0.1.result


echo Astro
../waveletZFP samples/AstroPS0.01 256 2 >>waveletZFPcrPS0.01.result
../waveletZFP samples/AstroPS0.05 256 12 >>waveletZFPcrPS0.05.result
../waveletZFP samples/AstroPS0.1 256 25 >>waveletZFPcrPS0.1.result

../waveletZFP samples/AstroES0.01 256 2 >>waveletZFPcrES0.01.result
../waveletZFP samples/AstroES0.05 256 12 >>waveletZFPcrES0.05.result
../waveletZFP samples/AstroES0.1 256 25 >>waveletZFPcrES0.1.result

../waveletZFP samples/AstroRS0.01 256 2 >>waveletZFPcrRS0.01.result
../waveletZFP samples/AstroRS0.05 256 12 >>waveletZFPcrRS0.05.result
../waveletZFP samples/AstroRS0.1 256 25 >>waveletZFPcrRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../waveletZFPfloat samples/HurricanePS0.01  500 50 >>waveletZFPcrPS0.01.result
../waveletZFPfloat samples/HurricanePS0.05  500 250 >>waveletZFPcrPS0.05.result
../waveletZFPfloat samples/HurricanePS0.1  500 500 >>waveletZFPcrPS0.1.result

../waveletZFPfloat samples/HurricaneES0.01  500 50 >>waveletZFPcrES0.01.result
../waveletZFPfloat samples/HurricaneES0.05  500 250 >>waveletZFPcrES0.05.result
../waveletZFPfloat samples/HurricaneES0.1  500 500 >>waveletZFPcrES0.1.result

../waveletZFPfloat samples/HurricaneRS0.01  500 50 >>waveletZFPcrRS0.01.result
../waveletZFPfloat samples/HurricaneRS0.05  500 250 >>waveletZFPcrRS0.05.result
../waveletZFPfloat samples/HurricaneRS0.1  500 500 >>waveletZFPcrRS0.1.result

echo CESM-ATM
../waveletZFPfloat samples/CESM-PS0.01 1800 36 >>waveletZFPcrPS0.01.result
../waveletZFPfloat samples/CESM-PS0.05 1800 180 >>waveletZFPcrPS0.05.result
../waveletZFPfloat samples/CESM-PS0.1 1800 360 >>waveletZFPcrPS0.1.result

../waveletZFPfloat samples/CESM-ES0.01 1800 36 >>waveletZFPcrES0.01.result
../waveletZFPfloat samples/CESM-ES0.05 1800 180 >>waveletZFPcrES0.05.result
../waveletZFPfloat samples/CESM-ES0.1 1800 360 >>waveletZFPcrES0.1.result

../waveletZFPfloat samples/CESM-RS0.01 1800 36 >>waveletZFPcrRS0.01.result
../waveletZFPfloat samples/CESM-RS0.05 1800 180 >>waveletZFPcrRS0.05.result
../waveletZFPfloat samples/CESM-RS0.1 1800 360 >>waveletZFPcrRS0.1.result

echo NYX
../waveletZFPfloat  samples/NYX-PS0.01 512 25 >>waveletZFPcrPS0.01.result
../waveletZFPfloat  samples/NYX-PS0.05 512 128 >>waveletZFPcrPS0.05.result
../waveletZFPfloat  samples/NYX-PS0.1 512 256 >>waveletZFPcrPS0.1.result


../waveletZFPfloat  samples/NYX-ES0.01 512 25 >>waveletZFPcrES0.01.result
../waveletZFPfloat  samples/NYX-ES0.05 512 128 >>waveletZFPcrES0.05.result
../waveletZFPfloat  samples/NYX-ES0.1 512 256 >>waveletZFPcrES0.1.result

../waveletZFPfloat  samples/NYX-RS0.01 512 25 >>waveletZFPcrRS0.01.result
../waveletZFPfloat  samples/NYX-RS0.05 512 128 >>waveletZFPcrRS0.05.result
../waveletZFPfloat  samples/NYX-RS0.1 512 256 >>waveletZFPcrRS0.1.result

echo XGC
../waveletZFP samples/XGC-PS0.01 512 206 >>waveletZFPcrPS0.01.result
../waveletZFP samples/XGC-PS0.05 512 1030 >>waveletZFPcrPS0.05.result
../waveletZFP samples/XGC-PS0.1 512 2069 >>waveletZFPcrPS0.1.result

../waveletZFP samples/XGC-ES0.01 512 206 >>waveletZFPcrES0.01.result
../waveletZFP samples/XGC-ES0.05 512 1030 >>waveletZFPcrES0.05.result
../waveletZFP samples/XGC-ES0.1 512 2069 >>waveletZFPcrES0.1.result

../waveletZFP samples/XGC-RS0.01 512 206 >>waveletZFPcrRS0.01.result
../waveletZFP samples/XGC-RS0.05 512 1030 >>waveletZFPcrRS0.05.result
../waveletZFP samples/XGC-RS0.1 512 2069 >>waveletZFPcrRS0.1.result

echo SD
../waveletZFP samples/S3D-PS0.01 500 500 5 >>waveletZFPcrPS0.01.result
../waveletZFP samples/S3D-PS0.05 500 500 25 >>waveletZFPcrPS0.05.result
../waveletZFP samples/S3D-PS0.1 500 500 50 >>waveletZFPcrPS0.1.result

../waveletZFP samples/S3D-ES0.01 500 500 5 >>waveletZFPcrES0.01.result
../waveletZFP samples/S3D-ES0.05 500 500 25 >>waveletZFPcrES0.05.result
../waveletZFP samples/S3D-ES0.1 500 500 50 >>waveletZFPcrES0.1.result


../waveletZFP samples/S3D-RS0.01 500 500 5 >>waveletZFPcrRS0.01.result
../waveletZFP samples/S3D-RS0.05 500 500 25 >>waveletZFPcrRS0.05.result
../waveletZFP samples/S3D-RS0.1 500 500 50 >>waveletZFPcrRS0.1.result
