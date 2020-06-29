#include<time.h> 
#include<sz.h>
#include<stdio.h>
#include <stdlib.h>

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
// A comparator function used by qsort 
int compare(const void * a, const void * b) 
{ 
	return ( *(int*)a - *(int*)b ); 
} 

int main(int argc, char* argv[])
{

	size_t r4=0,r3=0,r2=0,r1=0;
	double ratio;
	char oriFilePath[640], outputFilePath[640];

	if(argc < 3)
	{
		printf("Test case: ZFP [srcFilePath] [dimension sizes...]\n");
		printf("Example: ZFP testdouble_8_8_128.dat 8 8 128\n");
		exit(0);
	}
	sprintf(oriFilePath, "%s", argv[1]);
	sprintf(outputFilePath, "%s", argv[2]);
	if(argc>=4)
		r1 = atoi(argv[3]); //8
	if(argc>=5)
		r2 = atoi(argv[4]); //8
	if(argc>=6)
		r3 = atoi(argv[5]); //128
	if(argc>=7)
		r4 = atoi(argv[6]);
	if(argc>=8)
		ratio=atof(argv[7]);



	cost_start();
	FILE *fp=fopen(oriFilePath,"r");
	if(fp==NULL){
		printf("Cannot open file %s.\n",oriFilePath);	
		//	return 0;
	}
	FILE *fpout=fopen(outputFilePath,"w");
	if(fpout==NULL){
		printf("Cannot open file %s.\n",outputFilePath);	
		//	return 0;
	}
	size_t dataLength = computeDataLength(0,r4,r3,r2,r1);
	int rows, cols;
	rows=r1;cols=r2;
	int Nrun=dataLength/cols;
	int Nsample=(int)Nrun*ratio;
	int i,j;

	srand(time(0)); 
	int *a=malloc(Nrun*sizeof(int));	

	for (i=0;i<Nrun;i++)

		a[i]=i+1;

	int w,t;
	for (i=0;i<Nsample;i++)

	{
		w=rand()%(Nrun-i)+i;

		t=a[i];

		a[i]=a[w];

		a[w]=t;

	}

	qsort(a, Nsample, sizeof(int), compare); 


	double *data =malloc(cols*sizeof(double));
	int cnt=0;
	for(int round=0;round<Nrun;round++)
	{
		fread(data,sizeof(double),cols,fp);
		if(a[cnt]==round){
			fwrite(data,sizeof(double),cols,fpout);
			cnt++;
		}
		if(cnt>=Nsample)
			break;
	}
	free(a);
	fclose(fp);
	fclose(fpout);
	return 0;
}
