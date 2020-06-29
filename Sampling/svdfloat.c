#include <assert.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_statistics.h>
#include <gsl/gsl_eigen.h>
#include <gsl/gsl_blas.h>
#include "sz.h"

#define NPC 7
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



void print_matrix (const gsl_matrix* data, unsigned int rows, unsigned int cols)
{
	int i,j;
	printf("Matrix internals\n");
	for (i=0;i<rows;i++)
	{
		for (j=0;j<cols;j++)
		{
			printf("%f ",gsl_matrix_get(data,i,j));
		}
		printf("\n");
	}


}

void print_vector (const   gsl_vector* data, unsigned int rows)
{
	int i,j;
	printf("Matrix internals\n");
	for (i=0;i<rows;i++)
	{
		printf("%f ",gsl_vector_get(data,i));
	}

	printf("\n");

}

gsl_vector* svd(const gsl_matrix* data)
{
	/*
	   @param data - matrix of data vectors, MxN matrix, each column is a data vector, M - dimension, N - data vector count
	   @param L - dimension reduction
	 */
	assert(data != NULL);
	unsigned int i,j;
	unsigned int rows = data->size1;
	unsigned int cols = data->size2;
	gsl_matrix * U=gsl_matrix_alloc(rows, cols);
	gsl_matrix_memcpy(U, data);
	gsl_matrix* V = gsl_matrix_alloc(cols, cols);
	gsl_vector * S=gsl_vector_alloc(cols);
	gsl_vector * work=gsl_vector_alloc(cols);

	gsl_linalg_SV_decomp(U,V,S,work);

	//	print_matrix( U,rows,cols);
	gsl_matrix_free(U);
	gsl_matrix_free(V);
	gsl_vector_free(work);

	return S;
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


	FILE *fp=fopen(oriFilePath,"r");
	if(fp==NULL){
		printf("Cannot open file %s.\n",oriFilePath);	
		return 0;
	}
	size_t dataLength = computeDataLength(r5,r4,r3,r2,r1);
	int rows, cols;
	rows=r1;cols=r2;
	int Nrun=dataLength/(r1*r2);
	int c_size=0;
	int i;
	cost_start(); 
	gsl_vector *S;
	double *proportion=malloc(Nrun*NPC*sizeof(double));
	double *data =malloc(rows*cols*sizeof(double));
	float *temp =malloc(rows*cols*sizeof(float));
	for(int round=0;round<Nrun;round++)
	{
		fread(temp,sizeof(float),rows*cols,fp);
		//printf("rows = %d, columns = %d \n",rows,cols);

		for(i=0;i<rows*cols;i++)
			data[i]=(double)temp[i];
		const gsl_matrix_const_view mat=gsl_matrix_const_view_array(data, rows, cols);
		S=svd(&mat.matrix);
		double sum=0;
		for(i=0;i<cols;i++)
			sum+=gsl_vector_get(S,i);
		double sumPC=0;
		for(i=0;i<NPC-1;i++){
			if(i<cols)
			sumPC+=gsl_vector_get(S,i)/sum;
			if(i<cols)
			proportion[round*NPC+i]=gsl_vector_get(S,i)/sum;
		}
		proportion[round*NPC+NPC-1]=1-sumPC;
		gsl_vector_free(S);


	}
	double valPC[NPC];
	for(i=0;i<NPC;i++){
		valPC[i]=0;
		for(int round=0;round<Nrun;round++)
		{
			valPC[i]+=proportion[round*NPC+i];
		}
		valPC[i]=valPC[i]/Nrun;
		printf("%lf ",valPC[i]);
	}
	printf("\n");
	free(data);
	free(temp);
	free(proportion);
//	printf("%lf\n",(double)dataLength*sizeof(double)/c_size);
	cost_end();
//	printf("timecost=%f\n",totalCost);
	return 0;
}
