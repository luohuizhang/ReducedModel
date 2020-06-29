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

gsl_matrix* pca(const gsl_matrix* data,gsl_matrix* eigenvectors, gsl_matrix* diff, gsl_vector* mean,double threshold)
{
	/*
	   @param data - matrix of data vectors, MxN matrix, each column is a data vector, M - dimension, N - data vector count
	   @param L - dimension reduction
	 */
	assert(data != NULL);
	unsigned int i,j;
	unsigned int rows = data->size1;
	unsigned int cols = data->size2;

	for(i = 0; i < cols; i++) {
		double sum=0;
		for(j=0;j<rows;j++)
			sum+=gsl_matrix_get(data,j,i);
		gsl_vector_set(mean, i, sum/(double)rows);
	}

	// Get mean-substracted data into matrix mean_substracted_data.
	gsl_matrix* mean_substracted_data = gsl_matrix_alloc(rows, cols);
	gsl_matrix_memcpy(mean_substracted_data, data);

	for(i = 0; i < rows; i++) {
		gsl_vector_view mean_substracted_point_view = gsl_matrix_row(mean_substracted_data, i);
		gsl_vector_sub(&mean_substracted_point_view.vector, mean);
	}
	//print_matrix( mean_substracted_data, rows,cols);

	// Compute Covariance matrix
	gsl_matrix* covariance_matrix = gsl_matrix_alloc(cols, cols);
	//	gsl_blas_dgemm(CblasTrans, CblasNoTrans, 1.0 / (double)(cols - 1), mean_substracted_data, mean_substracted_data, 0.0, covariance_matrix);
	gsl_blas_dgemm( CblasTrans, CblasNoTrans, 1.0 / (double)(cols*cols-1), mean_substracted_data, mean_substracted_data, 0.0, covariance_matrix);
	//print_matrix(covariance_matrix,cols,cols);
	// Get eigenvectors, sort by eigenvalue.
	gsl_vector* eigenvalues = gsl_vector_alloc(cols);
	//	gsl_matrix* eigenvectors = gsl_matrix_alloc(cols, cols);
	gsl_eigen_symmv_workspace* workspace = gsl_eigen_symmv_alloc(cols);
	gsl_eigen_symmv(covariance_matrix, eigenvalues, eigenvectors, workspace);
	gsl_eigen_symmv_free(workspace);
	gsl_matrix_free(covariance_matrix);
	//printf("eigenvalue\n");
	//print_vector(eigenvalues,cols);
	//	printf("eigenvectors\n");
	//	print_matrix(eigenvectors,cols,cols);
	// Sort the eigenvectors
	//gsl_eigen_symmv_sort(eigenvalues, eigenvectors, GSL_EIGEN_SORT_ABS_DESC);
	gsl_eigen_symmv_sort(eigenvalues, eigenvectors, GSL_EIGEN_SORT_VAL_DESC);
	//	printf("eigenvalue\n");
	//	print_vector(eigenvalues,cols);
	//	printf("eigenvectors\n");

	int L=0;
	double sum=0;
	for(i=0;i<cols;i++)
		sum+=gsl_vector_get(eigenvalues,i);
	while(threshold>0)
	{
		threshold-=gsl_vector_get(eigenvalues,L)/sum;
		L++;
	}
	if(L>0.05*cols)
		L=0.05*cols;
	if(L<0.03*cols)
		L=0.03*cols;

	// Project the original dataset
	gsl_matrix* result = gsl_matrix_alloc(rows,L);
	gsl_matrix_view L_eigenvectors = gsl_matrix_submatrix(eigenvectors, 0, 0, cols, L);
	// gsl_blas_dgemm(CblasTrans, CblasNoTrans, 1.0, &L_eigenvectors.matrix, data, 0.0, result);
	//		printf(" L_eigenvectors\n");
	//		print_matrix(&L_eigenvectors.matrix,cols,L);

	gsl_blas_dgemm(CblasNoTrans, CblasNoTrans, 1.0,  mean_substracted_data,&L_eigenvectors.matrix, 0.0, result);

	//		print_matrix(result,rows,L);
	//	print_matrix( reconstruct,rows,cols);
	gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  result, &L_eigenvectors.matrix, 0.0, diff);
	for(i = 0; i < rows; i++) {
		gsl_vector_view mean_substracted_point_view = gsl_matrix_row(diff, i);
		gsl_vector_add(&mean_substracted_point_view.vector, mean);
	}

	gsl_matrix_sub(diff,data);
	//print_matrix( reconstruct,rows,cols);

	gsl_vector_free(eigenvalues);
	//gsl_matrix_free(eigenvectors);
	gsl_matrix_free(mean_substracted_data);
	// Result is n LxN matrix, each column is the original data vector with reduced dimension from M to L
	return result;
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


	gsl_matrix *red_data;
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
	int i,j;

	double *data =malloc(sizeN*sizeof(double));
	double *delta =malloc(sizeN*sizeof(double));

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

	gsl_matrix* diff = gsl_matrix_alloc(rows,cols);
	gsl_matrix* diff1 = gsl_matrix_alloc(rows,cols);
	gsl_matrix* eigenvectors = gsl_matrix_alloc(cols, cols);
	gsl_vector* mean = gsl_vector_alloc(cols);
	gsl_matrix* red_data1=gsl_matrix_alloc(rows, cols);
	gsl_matrix* eigenvectors1 = gsl_matrix_alloc(cols, cols);
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

		const gsl_matrix_const_view mat=gsl_matrix_const_view_array(data, rows, cols);
		red_data = pca(&mat.matrix,eigenvectors,diff,mean,Threshold);
		int cols_red=red_data->size2;
		for(int EBi=0;EBi<31;EBi++){

			double EB=(max-min)*errorBound[EBi];

			sz.absErrBound = EB;
			SZ_Init_Params(&sz);
			for(i=0;i<rows;i++)
				for(j=0;j<cols;j++)
					delta[j+i*cols]=gsl_matrix_get(diff,i,j);
			//printf("rows = %d, columns = %d \n",rows,cols);
			size_t outSize1;
			unsigned char *bytes = SZ_compress(SZ_DOUBLE, delta, &outSize1, 0, 0, 0,0, rows* cols);
			c_size[EBi]+=outSize1;
			//                printf("delta1:%d ",outSize1);


			for(i=0;i<rows;i++)
				for(j=0;j<cols_red;j++)
					delta[j+i*cols_red]=gsl_matrix_get(red_data,i,j);
			//printf("rows = %d, columns = %d \n",rows,cols);
			size_t outSize2;
			unsigned char *bytes_red = SZ_compress(SZ_DOUBLE, delta, &outSize2, 0, 0, 0, 0,rows* cols_red);
			c_size[EBi]+=outSize2;

			for(i=0;i<cols;i++)
				for(j=0;j<cols_red;j++)
					delta[j+i*cols_red]=gsl_matrix_get(eigenvectors,i,j);
			//printf("rows = %d, columns = %d \n",rows,cols);
			size_t outSize3;
			unsigned char *bytes_eigenvectors = SZ_compress(SZ_DOUBLE, delta, &outSize3, 0, 0, 0, 0,cols* cols_red);
			c_size[EBi]+=outSize3;



			double *data1 = SZ_decompress(SZ_DOUBLE, bytes, outSize1, 0, 0, 0, 0, sizeN);
			double *Uk = SZ_decompress(SZ_DOUBLE, bytes_red, outSize2, 0, 0, 0, 0, rows* cols_red);
			double *Vk = SZ_decompress(SZ_DOUBLE, bytes_eigenvectors, outSize3, 0, 0, 0, 0,cols* cols_red );
			for(i=0;i<rows;i++)
				for(j=0;j<cols_red;j++)
					gsl_matrix_set(red_data1,i,j,Uk[j+i*cols_red]);

			for(i=0;i<cols;i++)
				for(j=0;j<cols_red;j++)
					gsl_matrix_set(eigenvectors1,i,j,Vk[j+i*cols_red]);




			gsl_matrix_view L_red = gsl_matrix_submatrix(red_data1, 0, 0, rows, cols_red);
			gsl_matrix_view L_eigenvectors = gsl_matrix_submatrix(eigenvectors1, 0, 0, cols, cols_red);
			gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  &L_red.matrix, &L_eigenvectors.matrix, 0.0, diff1);
			for(i = 0; i < rows; i++) {
				gsl_vector_view mean_substracted_point_view = gsl_matrix_row(diff1, i);
				gsl_vector_add(&mean_substracted_point_view.vector, mean);
			}

			gsl_matrix_sub(diff1,&mat.matrix);

			for(i=0;i<rows;i++)
				for(j=0;j<cols;j++)
					delta[j+i*cols]=gsl_matrix_get(diff1,i,j);
			//printf("rows = %d, columns = %d \n",rows,cols);
			size_t outSize4;
			unsigned char *bytes2 = SZ_compress(SZ_DOUBLE, delta, &outSize4, 0, 0, 0,0, rows* cols);
			//                printf("delta2=%d\n",outSize4);

			double *data2 = SZ_decompress(SZ_DOUBLE, bytes2, outSize4, 0, 0, 0, 0, sizeN);

			gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  &L_red.matrix, &L_eigenvectors.matrix, 0.0, diff1);
			for(i = 0; i < rows; i++) {
				gsl_vector_view mean_substracted_point_view = gsl_matrix_row(diff1, i);
				gsl_vector_add(&mean_substracted_point_view.vector, mean);
			}

			for(i=0;i<rows;i++)
				for(j=0;j<cols;j++)
					data2[j+i*cols]=gsl_matrix_get(diff1,i,j)-data2[j+i*cols];
			rmse[EBi]+=RMSE(data,data2,sizeN)/(max-min);
			free(data1);
			free(data2);
			free(Uk);
			free(Vk);
			free(bytes);
			free(bytes2);
			free(bytes_red);
			free(bytes_eigenvectors);
		}
			gsl_matrix_free(red_data);
	}
	free(data);
	free(delta);
	gsl_matrix_free(diff);
	gsl_matrix_free(diff1);
	gsl_vector_free(mean);
	gsl_matrix_free(eigenvectors);
	gsl_matrix_free(eigenvectors1);
			gsl_matrix_free(red_data1);
	cost_end();

	SZ_Finalize();
	for( int EBi=0;EBi<31;EBi++)
		printf("%lf ",(double)dataLength*sizeof(double)/c_size[EBi]);
	printf("\n");

	for( int EBi=0;EBi<31;EBi++)
		printf("%e ",rmse[EBi]/Nrun);
	printf("\n");

	return 0;
}
