#include "sz.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "wavelib.h"



struct timeval startTime;
struct timeval endTime;  /* Start and end times */
struct timeval costStart; /*only used for recording the cost*/
double totalCost = 0;


void cost_start()
{
	gettimeofday(&costStart, NULL);
}

void cost_end()
{
	double elapsed;
	struct timeval costEnd;
	gettimeofday(&costEnd, NULL);
	elapsed = ((costEnd.tv_sec*1000000+costEnd.tv_usec)-(costStart.tv_sec*1000000+costStart.tv_usec))/1000000.0;
	totalCost += elapsed;
}

double absmax(double *array, int N) {
	double max;
	int i;

	max = 0.0;
	for (i = 0; i < N; ++i) {
		if (fabs(array[i]) >= max) {
			max = fabs(array[i]);
		}
	}

	return max;
}

double generate_rnd() {
	double rnd;

	rnd = (double) (rand() % 100 + 1);

	return rnd;
}



int main(int argc, char* argv[])
{

	size_t r5=0,r4=0,r3=0,r2=0,r1=0;
	char oriFilePath[640], outputFilePath[640];

	if(argc < 3)
	{
		printf("Test case: testdouble_compress [srcFilePath] [dimension sizes...]\n");
		printf("Example: testdouble_compress testdouble_8_8_128.dat 8 8 128\n");
		exit(0);
	}
	sprintf(oriFilePath, "%s", argv[1]);
	if(argc>=3)
		r1 = atoi(argv[2]); //8
	if(argc>=4)
		r2 = atoi(argv[3]); //8
	if(argc>=5)
		r3 = atoi(argv[4]); //128
	if(argc>=6)
		r4 = atoi(argv[5]);
	if(argc>=7)
		r5 = atoi(argv[6]);
	int status = 0;
	//status = SZ_Init(cfgFile);

	sz_params sz;
	memset(&sz, 0, sizeof(sz_params));
	sz.sol_ID = SZ;
	sz.sampleDistance = 100;
	sz.quantization_intervals = 0;
	sz.max_quant_intervals = 65536;
	sz.predThreshold = 0.98;
	sz.szMode = SZ_BEST_COMPRESSION;
	sz.losslessCompressor = ZSTD_COMPRESSOR;
	sz.gzipMode = 1;
	sz.errorBoundMode = ABS;
	sz.absErrBound = 1E-6;

	SZ_Init_Params(&sz);

	sprintf(outputFilePath, "%s.sz", oriFilePath);

	FILE *fp=fopen(oriFilePath,"r");
	if(fp==NULL){
		printf("Cannot open file %s.\n",oriFilePath);	
		return 0;
	}
	size_t dataLength = computeDataLength(r5,r4,r3,r2,r1);
	int rows, cols;
	rows=r2;cols=r1;
	int sizeN=rows*cols;
	int Nrun=dataLength/(r1*r2);
	int c_size=0;
	int i,j;
	cost_start(); 
	for(int round=0;round<Nrun;round++)
	{
		double *data =malloc(sizeN*sizeof(double));
		fread(data,sizeof(double),sizeN,fp);
		//printf("rows = %d, columns = %d \n",rows,cols);
		size_t outSize;
		unsigned char *bytes = SZ_compress(SZ_DOUBLE, data, &outSize, 0, 0, 0, rows, cols);
		c_size+=outSize;
		free(bytes);


	double  *wavecoeffs,*oup,*diff;
	double amax;

	wave_object obj;
	wt2_object wt;

	char *name = "haar";
	obj = wave_init(name);// Initialize the wavelet
	oup = (double*)calloc(sizeN, sizeof(double));
	diff = (double*)calloc(sizeN, sizeof(double));
    
	int J = 1;

	wt = wt2_init(obj, "dwt", rows,cols, J);


	wavecoeffs = dwt2(wt, data);

	//cLL = getWT2Coeffs(wt, wavecoeffs, 1, "D", &ir, &ic);
       int zeroCnt=0;
       for (i = 0; i < rows; ++i) {
                for (j = 0; j < cols; j++) {
			if(abs(wavecoeffs[i*cols + j]<1)){
				wavecoeffs[i*cols + j]=0;
				zeroCnt++;
			}
			//printf("%lf ",wavecoeffs[i*cols + j]);
                }
		//printf("\n");
        }
	//dispWT2Coeffs(cLL, ir, ic);
	
	idwt2(wt, wavecoeffs, oup);

	for (i = 0; i < rows*cols; ++i) {
		diff[i] = oup[i] - data[i];
	}

	amax = absmax(diff, rows*cols);

	//wt2_summary(wt);

	printf("Abs Max %g \n", amax);

	wave_free(obj);
	wt2_free(wt);
	free(wavecoeffs);
	free(oup);
	free(diff);
		free(data);
	}
	printf("%lf\n",(double)dataLength*sizeof(double)/c_size);
	cost_end();
	printf("timecost=%f\n",totalCost);
	SZ_Finalize();
	return 0;




}

