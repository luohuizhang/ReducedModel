rm waveletcrPS0.*
rm waveletcrES0.*
rm waveletcrRS0.*
echo Heat3d
../waveletZFP samples/Heat3dPS0.01 192 192 1 >>waveletcrPS0.01.result
../waveletZFP samples/Heat3dPS0.05 192 192 9 >>waveletcrPS0.05.result
../waveletZFP samples/Heat3dPS0.1 192 192 19 >>waveletcrPS0.1.result


../waveletZFP samples/Heat3dES0.01 192 192 1 >>waveletcrES0.01.result
../waveletZFP samples/Heat3dES0.05 192 192 9 >>waveletcrES0.05.result
../waveletZFP samples/Heat3dES0.1 192 192 19 >>waveletcrES0.1.result


../waveletZFP samples/Heat3dRS0.01 192 192 1 >>waveletcrRS0.01.result
../waveletZFP samples/Heat3dRS0.05 192 192 9 >>waveletcrRS0.05.result
../waveletZFP samples/Heat3dRS0.1 192 192 19 >>waveletcrRS0.1.result

echo Laplace
../waveletZFP samples/LaplacePS0.01 960 9 >>waveletcrPS0.01.result 
../waveletZFP samples/LaplacePS0.05 960 48 >>waveletcrPS0.05.result 
../waveletZFP samples/LaplacePS0.1 960 96 >>waveletcrPS0.1.result 


../waveletZFP samples/LaplaceES0.01 960 9 >>waveletcrES0.01.result 
../waveletZFP samples/LaplaceES0.05 960 48 >>waveletcrES0.05.result 
../waveletZFP samples/LaplaceES0.1 960 96 >>waveletcrES0.1.result 


../waveletZFP samples/LaplaceRS0.01 960 9 >>waveletcrRS0.01.result 
../waveletZFP samples/LaplaceRS0.05 960 48 >>waveletcrRS0.05.result 
../waveletZFP samples/LaplaceRS0.1 960 96 >>waveletcrRS0.1.result 

echo Wave
../waveletZFP samples/WavePS0.01 80 5 >>waveletcrPS0.01.result
../waveletZFP samples/WavePS0.05 80 25 >>waveletcrPS0.05.result
../waveletZFP samples/WavePS0.1 80 51 >>waveletcrPS0.1.result

../waveletZFP samples/WaveES0.01 80 5 >>waveletcrES0.01.result
../waveletZFP samples/WaveES0.05 80 25 >>waveletcrES0.05.result
../waveletZFP samples/WaveES0.1 80 51 >>waveletcrES0.1.result

../waveletZFP samples/WaveRS0.01 80 5 >>waveletcrRS0.01.result
../waveletZFP samples/WaveRS0.05 80 25 >>waveletcrRS0.05.result
../waveletZFP samples/WaveRS0.1 80 51 >>waveletcrRS0.1.result

echo Sedov
../waveletZFP samples/SedovPS0.01 200 2 >>waveletcrPS0.01.result
../waveletZFP samples/SedovPS0.05 200 10 >>waveletcrPS0.05.result
../waveletZFP samples/SedovPS0.1 200 20 >>waveletcrPS0.1.result

../waveletZFP samples/SedovES0.01 200 2 >>waveletcrES0.01.result
../waveletZFP samples/SedovES0.05 200 10 >>waveletcrES0.05.result
../waveletZFP samples/SedovES0.1 200 20 >>waveletcrES0.1.result


../waveletZFP samples/SedovRS0.01 200 2 >>waveletcrRS0.01.result
../waveletZFP samples/SedovRS0.05 200 10 >>waveletcrRS0.05.result
../waveletZFP samples/SedovRS0.1 200 20 >>waveletcrRS0.1.result


echo Astro
../waveletZFP samples/AstroPS0.01 256 2 >>waveletcrPS0.01.result
../waveletZFP samples/AstroPS0.05 256 12 >>waveletcrPS0.05.result
../waveletZFP samples/AstroPS0.1 256 25 >>waveletcrPS0.1.result

../waveletZFP samples/AstroES0.01 256 2 >>waveletcrES0.01.result
../waveletZFP samples/AstroES0.05 256 12 >>waveletcrES0.05.result
../waveletZFP samples/AstroES0.1 256 25 >>waveletcrES0.1.result

../waveletZFP samples/AstroRS0.01 256 2 >>waveletcrRS0.01.result
../waveletZFP samples/AstroRS0.05 256 12 >>waveletcrRS0.05.result
../waveletZFP samples/AstroRS0.1 256 25 >>waveletcrRS0.1.result

#0.95 or L=1
#Hurricane ISABEL
echo ISABEL
../waveletZFPfloat samples/HurricanePS0.01  500 50 >>waveletcrPS0.01.result
../waveletZFPfloat samples/HurricanePS0.05  500 250 >>waveletcrPS0.05.result
../waveletZFPfloat samples/HurricanePS0.1  500 500 >>waveletcrPS0.1.result

../waveletZFPfloat samples/HurricaneES0.01  500 50 >>waveletcrES0.01.result
../waveletZFPfloat samples/HurricaneES0.05  500 250 >>waveletcrES0.05.result
../waveletZFPfloat samples/HurricaneES0.1  500 500 >>waveletcrES0.1.result

../waveletZFPfloat samples/HurricaneRS0.01  500 50 >>waveletcrRS0.01.result
../waveletZFPfloat samples/HurricaneRS0.05  500 250 >>waveletcrRS0.05.result
../waveletZFPfloat samples/HurricaneRS0.1  500 500 >>waveletcrRS0.1.result

echo CESM-ATM
../waveletZFPfloat samples/CESM-PS0.01 1800 36 >>waveletcrPS0.01.result
../waveletZFPfloat samples/CESM-PS0.05 1800 180 >>waveletcrPS0.05.result
../waveletZFPfloat samples/CESM-PS0.1 1800 360 >>waveletcrPS0.1.result

../waveletZFPfloat samples/CESM-ES0.01 1800 36 >>waveletcrES0.01.result
../waveletZFPfloat samples/CESM-ES0.05 1800 180 >>waveletcrES0.05.result
../waveletZFPfloat samples/CESM-ES0.1 1800 360 >>waveletcrES0.1.result

../waveletZFPfloat samples/CESM-RS0.01 1800 36 >>waveletcrRS0.01.result
../waveletZFPfloat samples/CESM-RS0.05 1800 180 >>waveletcrRS0.05.result
../waveletZFPfloat samples/CESM-RS0.1 1800 360 >>waveletcrRS0.1.result

echo NYX
../waveletZFPfloat  samples/NYX-PS0.01 512 25 >>waveletcrPS0.01.result
../waveletZFPfloat  samples/NYX-PS0.05 512 128 >>waveletcrPS0.05.result
../waveletZFPfloat  samples/NYX-PS0.1 512 256 >>waveletcrPS0.1.result


../waveletZFPfloat  samples/NYX-ES0.01 512 25 >>waveletcrES0.01.result
../waveletZFPfloat  samples/NYX-ES0.05 512 128 >>waveletcrES0.05.result
../waveletZFPfloat  samples/NYX-ES0.1 512 256 >>waveletcrES0.1.result

../waveletZFPfloat  samples/NYX-RS0.01 512 25 >>waveletcrRS0.01.result
../waveletZFPfloat  samples/NYX-RS0.05 512 128 >>waveletcrRS0.05.result
../waveletZFPfloat  samples/NYX-RS0.1 512 256 >>waveletcrRS0.1.result

echo XGC
../waveletZFP samples/XGC-PS0.01 512 206 >>waveletcrPS0.01.result
../waveletZFP samples/XGC-PS0.05 512 1030 >>waveletcrPS0.05.result
../waveletZFP samples/XGC-PS0.1 512 2069 >>waveletcrPS0.1.result

../waveletZFP samples/XGC-ES0.01 512 206 >>waveletcrES0.01.result
../waveletZFP samples/XGC-ES0.05 512 1030 >>waveletcrES0.05.result
../waveletZFP samples/XGC-ES0.1 512 2069 >>waveletcrES0.1.result

../waveletZFP samples/XGC-RS0.01 512 206 >>waveletcrRS0.01.result
../waveletZFP samples/XGC-RS0.05 512 1030 >>waveletcrRS0.05.result
../waveletZFP samples/XGC-RS0.1 512 2069 >>waveletcrRS0.1.result

echo SD
../waveletZFP samples/S3D-PS0.01 500 500 5 >>waveletcrPS0.01.result
../waveletZFP samples/S3D-PS0.05 500 500 25 >>waveletcrPS0.05.result
../waveletZFP samples/S3D-PS0.1 500 500 50 >>waveletcrPS0.1.result

../waveletZFP samples/S3D-ES0.01 500 500 5 >>waveletcrES0.01.result
../waveletZFP samples/S3D-ES0.05 500 500 25 >>waveletcrES0.05.result
../waveletZFP samples/S3D-ES0.1 500 500 50 >>waveletcrES0.1.result


../waveletZFP samples/S3D-RS0.01 500 500 5 >>waveletcrRS0.01.result
../waveletZFP samples/S3D-RS0.05 500 500 25 >>waveletcrRS0.05.result
../waveletZFP samples/S3D-RS0.1 500 500 50 >>waveletcrRS0.1.result
