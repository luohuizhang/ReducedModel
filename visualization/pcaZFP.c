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
	int c_size=0;
	int i,j;

	double *data =malloc(sizeN*sizeof(double));
	double *delta =malloc(sizeN*sizeof(double));
	double rmse=0;
	double rmse2=0;

	gsl_matrix* diff = gsl_matrix_alloc(rows,cols);
	gsl_matrix* eigenvectors = gsl_matrix_alloc(cols, cols);
	gsl_vector* mean = gsl_vector_alloc(cols);
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
		const gsl_matrix_const_view mat=gsl_matrix_const_view_array(data, rows, cols);
		red_data = pca(&mat.matrix,eigenvectors,diff,mean,Threshold);
		for(i=0;i<rows;i++)
			for(j=0;j<cols;j++)
				delta[j+i*cols]=gsl_matrix_get(diff,i,j);
		//printf("rows = %d, columns = %d \n",rows,cols);
		size_t outSize1;
		void *bytes = zfp1D_compress(delta, &outSize1,  rows* cols,EB);
		c_size+=outSize1;
		//                printf("delta1:%d ",outSize1);


		int cols_red=red_data->size2;
		for(i=0;i<rows;i++)
			for(j=0;j<cols_red;j++)
				delta[j+i*cols_red]=gsl_matrix_get(red_data,i,j);
		//printf("rows = %d, columns = %d \n",rows,cols);
		size_t outSize2;
		void *bytes_red = zfp1D_compress( delta, &outSize2, rows* cols_red,EB);
		c_size+=outSize2;

		for(i=0;i<cols;i++)
			for(j=0;j<cols_red;j++)
				delta[j+i*cols_red]=gsl_matrix_get(eigenvectors,i,j);
		//printf("rows = %d, columns = %d \n",rows,cols);
		size_t outSize3;
		void *bytes_eigenvectors = zfp1D_compress( delta, &outSize3, cols* cols_red,EB);
		c_size+=outSize3;



                double *data1=malloc(sizeN*sizeof(double));
                double *Uk=malloc(rows* cols_red*sizeof(double));
                double *Vk=malloc(cols* cols_red*sizeof(double));
		  zfp1D_decompress(data1, bytes, outSize1,  sizeN,EB);
		  zfp1D_decompress(Uk,bytes_red, outSize2,  rows* cols_red,EB);
		  zfp1D_decompress(Vk,bytes_eigenvectors, outSize3,  cols* cols_red,EB);
		for(i=0;i<rows;i++)
			for(j=0;j<cols_red;j++)
				gsl_matrix_set(red_data,i,j,Uk[j+i*cols_red]);

		for(i=0;i<cols;i++)
			for(j=0;j<cols_red;j++)
				gsl_matrix_set(eigenvectors,i,j,Vk[j+i*cols_red]);




		gsl_matrix_view L_eigenvectors = gsl_matrix_submatrix(eigenvectors, 0, 0, cols, cols_red);
		gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  red_data, &L_eigenvectors.matrix, 0.0, diff);
		for(i = 0; i < rows; i++) {
			gsl_vector_view mean_substracted_point_view = gsl_matrix_row(diff, i);
			gsl_vector_add(&mean_substracted_point_view.vector, mean);
		}

		gsl_matrix_sub(diff,&mat.matrix);
		for(i=0;i<rows;i++)
			for(j=0;j<cols;j++)
				delta[j+i*cols]=gsl_matrix_get(diff,i,j);
		//printf("rows = %d, columns = %d \n",rows,cols);
		size_t outSize4;
		void *bytes2 =  zfp1D_compress( delta, &outSize4,  rows* cols,EB);
		//                printf("delta2=%d\n",outSize4);


                double *data2=malloc(sizeN*sizeof(double));
		  zfp1D_decompress(data2, bytes2, outSize4,  sizeN,EB);
		gsl_blas_dgemm(CblasNoTrans, CblasTrans, 1.0,  red_data, &L_eigenvectors.matrix, 0.0, diff);
		for(i = 0; i < rows; i++) {
			gsl_vector_view mean_substracted_point_view = gsl_matrix_row(diff, i);
			gsl_vector_add(&mean_substracted_point_view.vector, mean);
		}
		for(i=0;i<rows;i++)
			for(j=0;j<cols;j++)
				data1[j+i*cols]=gsl_matrix_get(diff,i,j)-data1[j+i*cols];

		for(i=0;i<rows;i++)
			for(j=0;j<cols;j++)
				data2[j+i*cols]=gsl_matrix_get(diff,i,j)-data2[j+i*cols];
		rmse2+=RMSE(data,data2,sizeN)/(max-min);
		rmse+=RMSE(data,data1,sizeN)/(max-min);
		gsl_matrix_free(red_data);
		free(data1);
		free(data2);
		free(Uk);
		free(Vk);
		free(bytes);
		free(bytes2);
		free(bytes_red);
		free(bytes_eigenvectors);
	}
	free(data);
	free(delta);
	gsl_matrix_free(diff);
	gsl_vector_free(mean);
	gsl_matrix_free(eigenvectors);
	cost_end();
	printf("timecost=%f\n",totalCost);

	printf("%lf\n",(double)dataLength*sizeof(double)/c_size);
	printf("%e\n",rmse);
	printf("%e\n",rmse2);
	return 0;
}
