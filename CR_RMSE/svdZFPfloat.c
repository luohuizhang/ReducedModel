#include <assert.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_statistics.h>
#include <gsl/gsl_eigen.h>
#include <gsl/gsl_blas.h>
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

int svd(const gsl_matrix* data, gsl_matrix* U, gsl_matrix* V, gsl_vector * S,gsl_matrix* diff,double threshold )
{
	/*
	   @param data - matrix of data vectors, MxN matrix, each column is a data vector, M - dimension, N - data vector count
	   @param L - dimension reduction
	 */
	assert(data != NULL);
	unsigned int i,j;
	unsigned int rows = data->size1;
	unsigned int cols = data->size2;
	gsl_vector * work=gsl_vector_alloc(cols);

	gsl_matrix_memcpy(U, data);
	gsl_linalg_SV_decomp(U,V,S,work);

	int L=0;
	double sum=0;
	for(i=0;i<cols;i++)
		sum+=gsl_vector_get(S,i);
	while(threshold>0)
	{
		threshold-=gsl_vector_get(S,L)/sum;
		L++;
	}

	if(L>0.05*cols)
		L=0.05*cols;
	if(L<0.03*cols)
		L=0.03*cols;

	gsl_matrix_view Uk = gsl_matrix_submatrix(U, 0, 0, rows, L);
	gsl_matrix_view Vk = gsl_matrix_submatrix(V, 0, 0, cols, L);
	gsl_matrix* Sigma = gsl_matrix_alloc(L, L);
	gsl_matrix_set_zero(Sigma);
	for(i=0;i<L;i++)
		gsl_matrix_set(Sigma,i,i,gsl_vector_get(S,i));
	gsl_matrix* UkS = gsl_matrix_alloc(rows, L);

	gsl_blas_dgemm(CblasNoTrans, CblasNoTrans, 1.0,  &Uk.matrix,Sigma, 0.0, UkS);
	gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  UkS,&Vk.matrix, 0.0, diff);


	gsl_matrix_sub(diff,data);
	//	print_matrix( U,rows,cols);
	gsl_vector_free(work);
	gsl_matrix_free(Sigma);
	gsl_matrix_free(UkS);

	return L;
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
	int i,j;

	double rmse[31];
	double errorBound[31];
	int c_size[31];

	for(i=0;i<31;i++)
	{
		rmse[i]=0;
		double exp=-7.0+0.2*i;
		errorBound[i]=pow(10,exp);
		c_size[i]=0;
	}


	double *data =malloc(sizeN*sizeof(double));
	float *temp=malloc(sizeN*sizeof(float));

	double *delta =malloc(sizeN*sizeof(double));

	gsl_matrix* diff = gsl_matrix_alloc(rows,cols);
	gsl_matrix * U=gsl_matrix_alloc(rows, cols);
	gsl_matrix* V = gsl_matrix_alloc(cols, cols);
	gsl_matrix* diff1 = gsl_matrix_alloc(rows,cols);
	gsl_matrix * U1=gsl_matrix_alloc(rows, cols);
	gsl_matrix* V1 = gsl_matrix_alloc(cols, cols);
	gsl_vector * S=gsl_vector_alloc(cols);
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

		const gsl_matrix_const_view mat=gsl_matrix_const_view_array(data, rows, cols);
		int L = svd(&mat.matrix,U,V,S,diff,Threshold);
		int cols_red=L;

		for(int EBi=0;EBi<31;EBi++){
			double EB=(max-min)*errorBound[EBi];


			for(i=0;i<rows;i++)
				for(j=0;j<cols;j++)
					delta[j+i*cols]=gsl_matrix_get(diff,i,j);
			//printf("rows = %d, columns = %d \n",rows,cols);
			size_t outSize1;
			void *bytes = zfp1D_compress(delta, &outSize1,  rows* cols,EB);
			c_size[EBi]+=outSize1;

			for(i=0;i<rows;i++)
				for(j=0;j<cols_red;j++)
					delta[j+i*cols_red]=gsl_matrix_get(U,i,j);
			size_t outSize2;
			void *bytes_red = zfp1D_compress(delta, &outSize2,  rows* cols_red,EB);
			c_size[EBi]+=outSize2;

			for(i=0;i<cols_red;i++)
				for(j=0;j<cols;j++)
					delta[j+i*cols]=gsl_matrix_get(V,i,j);
			size_t outSize3;
			void *bytes_eigenvectors = zfp1D_compress(delta, &outSize3,cols* cols_red,EB);
			c_size[EBi]+=outSize3;
			double *data1=malloc(sizeN*sizeof(double));
			double *Uk_a=malloc(rows* cols_red*sizeof(double));
			double *Vk_a=malloc(cols* cols_red*sizeof(double));
			zfp1D_decompress(data1, bytes, outSize1,  sizeN,EB);
			zfp1D_decompress(Uk_a,bytes_red, outSize2,  rows* cols_red,EB);
			zfp1D_decompress(Vk_a,bytes_eigenvectors, outSize3,  cols* cols_red,EB);


			/*		for(i=0;i<rows;i++)
					for(j=0;j<cols_red;j++)
					gsl_matrix_set(U,i,j,Uk_a[j+i*cols_red]);
			 */
			for(i=0;i<cols_red;i++)
				for(j=0;j<cols;j++)
					gsl_matrix_set(V1,i,j,Vk_a[j+i*cols]);

			gsl_matrix_view Uk = gsl_matrix_submatrix(U, 0, 0, rows, L);
			gsl_matrix_view Vk = gsl_matrix_submatrix(V1, 0, 0, cols, L);
			gsl_matrix* Sigma = gsl_matrix_alloc(L, L);
			gsl_matrix_set_zero(Sigma);
			for(i=0;i<L;i++)
				gsl_matrix_set(Sigma,i,i,gsl_vector_get(S,i));
			gsl_matrix* UkS = gsl_matrix_alloc(rows, L);

			gsl_blas_dgemm(CblasNoTrans, CblasNoTrans, 1.0,  &Uk.matrix,Sigma, 0.0, UkS);
			gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  UkS,&Vk.matrix, 0.0, diff1);


			gsl_matrix_sub(diff1,&mat.matrix);


			for(i=0;i<rows;i++)
				for(j=0;j<cols;j++)
					delta[j+i*cols]=gsl_matrix_get(diff1,i,j);
			//printf("rows = %d, columns = %d \n",rows,cols);
			size_t outSize4;
			void *bytes2 =  zfp1D_compress(delta, &outSize4,  rows* cols,EB);
			//                printf("delta2=%d\n",outSize4);

			double *data2=malloc(sizeN*sizeof(double));
			zfp1D_decompress(data2, bytes2, outSize4,  sizeN,EB);


			gsl_blas_dgemm(CblasNoTrans, CblasNoTrans, 1.0,  &Uk.matrix,Sigma, 0.0, UkS);
			gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  UkS,&Vk.matrix, 0.0, diff1);


			for(i=0;i<rows;i++)
				for(j=0;j<cols;j++)
					data2[j+i*cols]=gsl_matrix_get(diff1,i,j)-data2[j+i*cols];
			rmse[EBi]+=RMSE(data,data2,sizeN)/(max-min);
			free(data1);
			free(data2);
			free(Uk_a);
			free(Vk_a);
			free(bytes);
			free(bytes2);
			free(bytes_red);
			free(bytes_eigenvectors);

			gsl_matrix_free(Sigma);
			gsl_matrix_free(UkS);
		}
	}
	gsl_matrix_free(U);
	gsl_matrix_free(V);
	gsl_matrix_free(U1);
	gsl_matrix_free(V1);
	gsl_vector_free(S);
	free(data);
	free(temp);
	free(delta);
	gsl_matrix_free(diff);
	gsl_matrix_free(diff1);
	cost_end();
	for( int EBi=0;EBi<31;EBi++)
		printf("%lf ",(double)dataLength*sizeof(double)/c_size[EBi]);
	printf("\n");

	for( int EBi=0;EBi<31;EBi++)
		printf("%e ",rmse[EBi]/Nrun);
	printf("\n");
	return 0;
}
