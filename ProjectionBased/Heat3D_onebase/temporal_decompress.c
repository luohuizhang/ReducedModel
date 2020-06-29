#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double average(double s[], int sz){
	double t = 0;
	for(int i=0; i< sz; i++){
		t+= s[i];
	}
	return t/sz;
}

int main(int argc, char *argv[]){
	if(argc<4)
	{
		printf("Usage: temporl-predict file1 file2 file3 size\n");
		return 1;
	}
	char* file1 = argv[1]; 
	char* file2 = argv[2]; 
	char * file3= argv[3];
	char * file4= argv[4];
	int sz = atoi(argv[5]); 
	//    int sz=66*66*130;
	printf("%s, %s, %s, %s, %d\n", file1, file2, file3,file4, sz);
	//    printf("size of double: %ld\n", sizeof(double));
	double * ptr1 = (double *)malloc(sz * sizeof(double)) ;
	double * ptr2 = (double *)malloc(sz * sizeof(double)) ;
	double * ptr3=(double *)malloc(sz * sizeof(double));
	double * data = (double *)malloc(sz * sizeof(double)) ;

	FILE* stream1 = fopen(file1, "rb");
	FILE* stream2 = fopen(file2, "rb");
	FILE* stream3 = fopen(file3, "rb");
	FILE* stream4 = fopen(file4, "wb");
	//fread(ptr, sizeof(float), 6, stream);



	/*	for(int i=0;i<sz;i++){
		fscanf(stream1,"%lf",&ptr1[i]);		
		fscanf(stream2,"%lf",&ptr2[i]);
		fscanf(stream3,"%lf",&ptr3[i]);
		}
	 */
      
	fread(ptr1, sizeof(double),sz,stream1);
//        printf("luoluoluo\n");
	fread(ptr2, sizeof(double),sz,stream2);
	fread(ptr3, sizeof(double),sz,stream3);
	double rd = 0;
	double ad = 0;
	for(int i=0;i<sz;i++){
		data[i]=2*ptr2[i] - ptr1[i]-ptr3[i];
	}
	fwrite(data, sizeof(double),sz,stream4);
	fclose(stream1);
	fclose(stream2);
	fclose(stream3);
	fclose(stream4);
}
