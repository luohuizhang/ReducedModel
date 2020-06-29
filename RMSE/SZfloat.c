#include "sz.h"
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
	sz.absErrBound = 1;


	sprintf(outputFilePath, "%s.sz", oriFilePath);
	cost_start();
	FILE *fp=fopen(oriFilePath,"r");
	if(fp==NULL){
		printf("Cannot open file %s.\n",oriFilePath);	
		return 0;
	}
	size_t dataLength = computeDataLength(r5,r4,r3,r2,r1);
	int rows, cols;
	rows=r2;cols=r1;
	int Nrun=dataLength/(r1*r2);
	int sizeN=rows*cols;
	int c_size=0;
	int i,j;

	float *temp =malloc(sizeN*sizeof(float));
	double *data =malloc(sizeN*sizeof(double));
	double rmse=0;
	for(int round=0;round<Nrun;round++)
	{
		fread(temp,sizeof(float),sizeN,fp);

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
		sz.absErrBound = EB;
		//                printf("EB=%lf\n",EB);

		SZ_Init_Params(&sz);
		size_t outSize;
		unsigned char *bytes = SZ_compress(SZ_DOUBLE, data, &outSize, 0, 0, 0, 0,sizeN);
		c_size+=outSize;

		double *data1 = SZ_decompress(SZ_DOUBLE, bytes, outSize, 0, 0, 0, 0, sizeN);
		rmse+=RMSE(data,data1,sizeN)/(max-min);
		free(bytes);
		free(data1);
	}
	free(data);
	free(temp);
	cost_end();
	printf("timecost=%f\n",totalCost);

	SZ_Finalize();
	printf("SZ compression=%lf\n",(double)dataLength*sizeof(double)/c_size);
	printf("SZ rmse=%e\n",rmse/Nrun);
	printf("SZ rmse=%e\n",rmse/Nrun);

	return 0;
}
