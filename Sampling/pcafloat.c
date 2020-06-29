#include <assert.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_statistics.h>
#include <gsl/gsl_eigen.h>
#include <gsl/gsl_blas.h>
#include "sz.h"

#define ratioEB 0.00001
#define Threshold 0.95
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

gsl_vector* pca(const gsl_matrix* data)
{
	/*
	   @param data - matrix of data vectors, MxN matrix, each column is a data vector, M - dimension, N - data vector count
	   @param L - dimension reduction
	 */
	assert(data != NULL);
	unsigned int i,j;
	unsigned int rows = data->size1;
	unsigned int cols = data->size2;
	gsl_vector* mean = gsl_vector_alloc(cols);

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
	gsl_matrix* eigenvectors = gsl_matrix_alloc(cols, cols);
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


	gsl_matrix_free(eigenvectors);
	gsl_matrix_free(mean_substracted_data);
	gsl_vector_free(mean);
	// Result is n LxN matrix, each column is the original data vector with reduced dimension from M to L
	return eigenvalues;
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

	float *temp =malloc(sizeN*sizeof(float));

	double *proportion=malloc(Nrun*NPC*sizeof(double));
	gsl_vector *S;
	for(int round=0;round<Nrun;round++)
	{
		fread(temp,sizeof(float),sizeN,fp);
		for(i=0;i<sizeN;i++)
			data[i]=(double)temp[i];
		const gsl_matrix_const_view mat=gsl_matrix_const_view_array(data, rows, cols);
		S = pca(&mat.matrix);
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
	cost_end();

	return 0;
}
