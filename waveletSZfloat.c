#include "sz.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "wavelib.h"
#include "zfp.h"
#include "util.h"




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
	float *temp=malloc(sizeN*sizeof(float));
	double *data =malloc(sizeN*sizeof(double));
	double *oup = (double*)calloc(sizeN, sizeof(double));
	float *diff = (float*)calloc(sizeN, sizeof(float));
	for(int round=0;round<Nrun;round++)
	{
		fread(temp,sizeof(float),sizeN,fp);
		//printf("rows = %d, columns = %d \n",rows,cols);

		double max=-100000000;
		double min=100000000;
		for(i=0;i<sizeN;i++){
			data[i]=(double)temp[i];
			if(data[i]>max)
				max=data[i];
			if(data[i]<min)
				min=data[i];
		}

		double EB=(max-min)*ratioEB;


		double  *wavecoeffs;
		double amax;

		wave_object obj;
		wt2_object wt;

		char *name = "haar";
		obj = wave_init(name);// Initialize the wavelet

		int J = 1;

		wt = wt2_init(obj, "dwt", rows,cols, J);


		wavecoeffs = dwt2(wt, data);

		//cLL = getWT2Coeffs(wt, wavecoeffs, 1, "D", &ir, &ic);
		max=-10000000;
		for(i=0;i<sizeN;i++){
			if(wavecoeffs[i]>max)
				max=wavecoeffs[i];
		}

		int zeroCnt=0;
		double threshold=max*0.05;
		//	double threshold=1;
		for (i = 0; i < rows; ++i) {
			for (j = 0; j < cols; j++) {
				if(abs(wavecoeffs[i*cols + j])<threshold){
					//	printf("%lf ",wavecoeffs[i*cols + j]);

					wavecoeffs[i*cols + j]=0;
				}
				else 
					zeroCnt++;
			}
			//printf("\n");
		}
		//dispWT2Coeffs(cLL, ir, ic);

		idwt2(wt, wavecoeffs, oup);

		for (i = 0; i < rows*cols; ++i) {
			diff[i] = (float)(oup[i] - data[i]);
		}
		sz.absErrBound = EB;

		SZ_Init_Params(&sz);

		size_t outSize;
		unsigned char *bytes = SZ_compress(SZ_FLOAT, diff, &outSize, 0, 0, 0, 0, sizeN);
		c_size+=outSize;
		c_size+=zeroCnt*outSize/sizeN;
		//		printf("zeroCnt:%d\n",zeroCnt);
		free(bytes);

		//			amax = absmax(diff, rows*cols);

		//wt2_summary(wt);

		//			printf("Abs Max %g \n", amax);

		wave_free(obj);
		wt2_free(wt);
		free(wavecoeffs);
	}
	free(oup);
	free(temp);
	free(diff);
	free(data);
	cost_end();
	printf("timecost=%f\n",totalCost);
	printf("%lf\n",(double)dataLength*sizeof(float)/c_size);
	SZ_Finalize();
	fclose(fp);
	return 0;




}

