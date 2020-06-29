#include "zfp.h"
#include "sz.h"
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
		printf("Test case: ZFP [srcFilePath] [dimension sizes...]\n");
		printf("Example: ZFP testdouble_8_8_128.dat 8 8 128\n");
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



	cost_start();
	FILE *fp=fopen(oriFilePath,"r");
	if(fp==NULL){
		printf("Cannot open file %s.\n",oriFilePath);	
		return 0;
	}
	sprintf(outputFilePath, "ZFP.reconstruction");
	FILE *fw=fopen(outputFilePath,"w");
	if(fp==NULL){
		printf("Cannot open file %s.\n",outputFilePath);
		return 0;
	}

	size_t dataLength = computeDataLength(r5,r4,r3,r2,r1);
	int rows, cols;
	rows=r2;cols=r1;
	int Nrun=dataLength/(r1*r2);
	int sizeN=rows*cols;
	int c_size=0;
	int i,j;

	double *data =malloc(sizeN*sizeof(double));
	double rmse=0;

	for(int round=0;round<Nrun;round++)
	{
		fread(data,sizeof(double),sizeN,fp);
		double max=-100000000;
		double min=100000000;
		for(i=0;i<sizeN;i++){
			if(data[i]>max)
				max=data[i];
			if(data[i]<min)
				min=data[i];
		}

		double EB=(max-min)*ratioEB;
		/*		int it=0;
				for(i=0;i<rows;i++)
				for(j=0;j<cols;j++)
				{

				printf("%lf ",data[it]);
				it++;
				if(it%20==0)
				printf("\n");
				}*/
		double* data1=malloc(sizeN*sizeof(double));

		int outSize;
		void * buffer;
		buffer=zfp1D_compress(data,&outSize,sizeN,EB);
		c_size+=outSize;
		//	printf("%d\n",c_size);
		zfp1D_decompress(data1,buffer,outSize,sizeN,EB);
		rmse+=RMSE(data,data1,sizeN)/(max-min);
		free(buffer);

		fwrite(data1,sizeof(double),sizeN,fw);

	}
	free(data);
	cost_end();
	printf("timecost=%f\n",totalCost);

	printf("%lf\n",(double)dataLength*sizeof(double)/c_size);
	printf("rmse=%e\n",rmse);
	printf("rmse=%e\n",rmse);
	fclose(fp);
	fclose(fw);
	return 0;
}
