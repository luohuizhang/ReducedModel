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
	double rmse;
	double rmse2;
	double *data =malloc(sizeN*sizeof(double));
	double *delta =malloc(sizeN*sizeof(double));

	gsl_matrix* diff = gsl_matrix_alloc(rows,cols);
	gsl_matrix* eigenvectors = gsl_matrix_alloc(cols, cols);
	gsl_matrix * U=gsl_matrix_alloc(rows, cols);
	gsl_matrix* V = gsl_matrix_alloc(cols, cols);
	gsl_vector * S=gsl_vector_alloc(cols);
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
		sz.absErrBound = EB;
		SZ_Init_Params(&sz);

		const gsl_matrix_const_view mat=gsl_matrix_const_view_array(data, rows, cols);
		int L = svd(&mat.matrix,U,V,S,diff,Threshold);

		for(i=0;i<rows;i++)
			for(j=0;j<cols;j++)
				delta[j+i*cols]=gsl_matrix_get(diff,i,j);
		//printf("rows = %d, columns = %d \n",rows,cols);
		size_t outSize1;
		unsigned char *bytes = SZ_compress(SZ_DOUBLE, delta, &outSize1, 0, 0, 0,0, rows* cols);
		c_size+=outSize1;

		int cols_red=L;
		for(i=0;i<rows;i++)
			for(j=0;j<cols_red;j++)
				delta[j+i*cols_red]=gsl_matrix_get(U,i,j);
		size_t outSize2;
		unsigned char *bytes_red = SZ_compress(SZ_DOUBLE, delta, &outSize2, 0, 0, 0, 0,rows* cols_red);
		c_size+=outSize2;

		for(i=0;i<cols_red;i++)
			for(j=0;j<cols;j++)
				delta[j+i*cols]=gsl_matrix_get(V,i,j);
		size_t outSize3;
		unsigned char *bytes_eigenvectors = SZ_compress(SZ_DOUBLE, delta, &outSize3, 0, 0, 0, 0,cols* cols_red);
		c_size+=outSize3;


		double *data1 = SZ_decompress(SZ_DOUBLE, bytes, outSize1, 0, 0, 0, 0, sizeN);
		double *Uk_a = SZ_decompress(SZ_DOUBLE, bytes_red, outSize2, 0, 0, 0, 0, rows* cols_red);
		double *Vk_a = SZ_decompress(SZ_DOUBLE, bytes_eigenvectors, outSize3, 0, 0, 0, 0,cols* cols_red );
		/*		for(i=0;i<rows;i++)
				for(j=0;j<cols_red;j++)
				gsl_matrix_set(U,i,j,Uk_a[j+i*cols_red]);
		 */
		for(i=0;i<cols_red;i++)
			for(j=0;j<cols;j++)
				gsl_matrix_set(V,i,j,Vk_a[j+i*cols]);

		gsl_matrix_view Uk = gsl_matrix_submatrix(U, 0, 0, rows, L);
		gsl_matrix_view Vk = gsl_matrix_submatrix(V, 0, 0, cols, L);
		gsl_matrix* Sigma = gsl_matrix_alloc(L, L);
		gsl_matrix_set_zero(Sigma);
		for(i=0;i<L;i++)
			gsl_matrix_set(Sigma,i,i,gsl_vector_get(S,i));
		gsl_matrix* UkS = gsl_matrix_alloc(rows, L);

		gsl_blas_dgemm(CblasNoTrans, CblasNoTrans, 1.0,  &Uk.matrix,Sigma, 0.0, UkS);
		gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  UkS,&Vk.matrix, 0.0, diff);


		gsl_matrix_sub(diff,&mat.matrix);


		for(i=0;i<rows;i++)
			for(j=0;j<cols;j++)
				delta[j+i*cols]=gsl_matrix_get(diff,i,j);
		//printf("rows = %d, columns = %d \n",rows,cols);
		size_t outSize4;
		unsigned char *bytes2 = SZ_compress(SZ_DOUBLE, delta, &outSize4, 0, 0, 0,0, rows* cols);
		//                printf("delta2=%d\n",outSize4);

		double *data2 = SZ_decompress(SZ_DOUBLE, bytes2, outSize4, 0, 0, 0, 0, sizeN);

		gsl_blas_dgemm(CblasNoTrans, CblasNoTrans, 1.0,  &Uk.matrix,Sigma, 0.0, UkS);
		gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  UkS,&Vk.matrix, 0.0, diff);

		for(i=0;i<rows;i++)
			for(j=0;j<cols;j++)
				data1[j+i*cols]=gsl_matrix_get(diff,i,j)-data1[j+i*cols];

		for(i=0;i<rows;i++)
			for(j=0;j<cols;j++)
				data2[j+i*cols]=gsl_matrix_get(diff,i,j)-data2[j+i*cols];
		rmse2+=RMSE(data,data2,sizeN)/(max-min);
		rmse+=RMSE(data,data1,sizeN)/(max-min);
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
	gsl_matrix_free(U);
	gsl_matrix_free(V);
	gsl_vector_free(S);
	free(data);
	free(delta);
	gsl_matrix_free(diff);
	gsl_matrix_free(eigenvectors);
	cost_end();
	printf("timecost=%f\n",totalCost);

	SZ_Finalize();
	printf("%lf\n",(double)dataLength*sizeof(double)/c_size);
	printf("%e\n",rmse);
	printf("%e\n",rmse2);
	return 0;
}
