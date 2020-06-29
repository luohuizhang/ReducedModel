#include<math.h>
#define ratioEB 0.00001
#define Threshold 0.95

int
zfp3D_compress (double * array, int nx, int ny, int nz,double tolerance )
{
	zfp_type type;     /* array scalar type */
	zfp_field* field;  /* array meta data */
	zfp_stream* zfp;   /* compressed stream */
	void* buffer;      /* storage for compressed stream */
	size_t bufsize;    /* byte size of compressed buffer */
	bitstream * stream; /* bit stream to write to or read from */
	size_t zfpsize;    /* byte size of compressed stream */

	/* allocate meta data for the 3D array a[nz][ny][nx] */
	type = zfp_type_double;
	field = zfp_field_3d (array, type, nx,ny,nz);

	/* allocate meta data for a compressed stream */
	zfp = zfp_stream_open (NULL);

	/* set compression mode and parameters via one of three functions */
	/*  zfp_stream_set_rate(zfp, rate, type, 3, 0); */
	/* A_precision = zfp_stream_set_precision(zfp, precision, type);*/
	zfp_stream_set_accuracy (zfp, tolerance);


	/* allocate buffer for compressed data */
	bufsize = zfp_stream_maximum_size (zfp, field);
	buffer = malloc (bufsize);
	assert (buffer);
	/* associate bit stream with allocated buffer */
	stream = stream_open (buffer, bufsize);
	zfp_stream_set_bit_stream (zfp, stream);
	zfp_stream_rewind (zfp);

	/* compress array and output compressed stream */
	//zfpsize = zfp_compress (zfp, field);
	zfpsize = zfp_compress(zfp, field);
	if (!zfpsize) {
		fprintf(stderr, "compression failed\n");
	}
	assert (zfpsize);
	zfp_field_free (field);
	zfp_stream_close (zfp);
	stream_close (stream);

	free( buffer);

	return zfpsize;
}
	
int
zfp2D_compress (double * array, int nx, int ny, double tolerance )
{
	zfp_type type;     /* array scalar type */
	zfp_field* field;  /* array meta data */
	zfp_stream* zfp;   /* compressed stream */
	void* buffer;      /* storage for compressed stream */
	size_t bufsize;    /* byte size of compressed buffer */
	bitstream * stream; /* bit stream to write to or read from */
	size_t zfpsize;    /* byte size of compressed stream */

	/* allocate meta data for the 3D array a[nz][ny][nx] */
	type = zfp_type_double;
	field = zfp_field_2d (array, type, nx,ny);

	/* allocate meta data for a compressed stream */
	zfp = zfp_stream_open (NULL);

	/* set compression mode and parameters via one of three functions */
	/*  zfp_stream_set_rate(zfp, rate, type, 3, 0); */
	/* A_precision = zfp_stream_set_precision(zfp, precision, type);*/
	zfp_stream_set_accuracy (zfp, tolerance);


	/* allocate buffer for compressed data */
	bufsize = zfp_stream_maximum_size (zfp, field);
	buffer = malloc (bufsize);
	assert (buffer);
	/* associate bit stream with allocated buffer */
	stream = stream_open (buffer, bufsize);
	zfp_stream_set_bit_stream (zfp, stream);
	zfp_stream_rewind (zfp);

	/* compress array and output compressed stream */
	//zfpsize = zfp_compress (zfp, field);
	zfpsize = zfp_compress(zfp, field);
	if (!zfpsize) {
		fprintf(stderr, "compression failed\n");
	}
	assert (zfpsize);
	zfp_field_free (field);
	zfp_stream_close (zfp);
	stream_close (stream);

	free( buffer);

	return zfpsize;
}

int	
zfp1D_decompress (double * array, void *buffer,size_t size, int nx, double tolerance)
{
	zfp_type type;     /* array scalar type */
	zfp_field* field;  /* array meta data */
	zfp_stream* zfp;   /* compressed stream */
	bitstream * stream; /* bit stream to write to or read from */
	size_t zfpsize;    /* byte size of compressed stream */

//	void* buffer;      /* storage for compressed stream */
	size_t bufsize;    /* byte size of compressed buffer */

	/* allocate meta data for the 3D array a[nz][ny][nx] */
	type = zfp_type_double;
	field = zfp_field_1d (array, type, nx);

	/* allocate meta data for a compressed stream */
	zfp = zfp_stream_open (NULL);
	zfp_stream_set_accuracy (zfp, tolerance);


	//allocate buffer for compressed data 
	bufsize = zfp_stream_maximum_size (zfp, field);
//	buffer = malloc (bufsize);
	assert (buffer);
	stream = stream_open (buffer, bufsize);
	zfp_stream_set_bit_stream (zfp, stream);
	zfp_stream_rewind (zfp);



	if (!zfp_decompress(zfp, field)) {
		fprintf(stderr, "decompression failed\n");
	}

	/* clean up */
	zfp_field_free (field);
	zfp_stream_close (zfp);
	stream_close (stream);
}

void*
zfp1D_compress (double * array, size_t *size,int nx, double tolerance
	      )
{
	zfp_type type;     /* array scalar type */
	zfp_field* field;  /* array meta data */
	zfp_stream* zfp;   /* compressed stream */
	void* buffer;      /* storage for compressed stream */
	size_t bufsize;    /* byte size of compressed buffer */
	bitstream * stream; /* bit stream to write to or read from */
	size_t zfpsize;    /* byte size of compressed stream */

	/* allocate meta data for the 3D array a[nz][ny][nx] */
	type = zfp_type_double;
	field = zfp_field_1d (array, type, nx);

	/* allocate meta data for a compressed stream */
	zfp = zfp_stream_open (NULL);

	/* set compression mode and parameters via one of three functions */
	/*  zfp_stream_set_rate(zfp, rate, type, 3, 0); */
	/* A_precision = zfp_stream_set_precision(zfp, precision, type);*/
	zfp_stream_set_accuracy (zfp, tolerance);


	/* allocate buffer for compressed data */
	bufsize = zfp_stream_maximum_size (zfp, field);
	buffer = malloc (bufsize);
	assert (buffer);
	/* associate bit stream with allocated buffer */
	stream = stream_open (buffer, bufsize);
	zfp_stream_set_bit_stream (zfp, stream);
	zfp_stream_rewind (zfp);

	/* compress array and output compressed stream */
	//zfpsize = zfp_compress (zfp, field);
	zfpsize = zfp_compress(zfp, field);
	if (!zfpsize) {
		fprintf(stderr, "compression failed\n");
	}
	assert (zfpsize);
	zfp_field_free (field);
	zfp_stream_close (zfp);
	stream_close (stream);
        *size=zfpsize;
	return buffer;

}

void *
zfp1D_floatcompress (float * array, int* size,int nx, double tolerance
	      )
{
	zfp_type type;     /* array scalar type */
	zfp_field* field;  /* array meta data */
	zfp_stream* zfp;   /* compressed stream */
	void* buffer;      /* storage for compressed stream */
	size_t bufsize;    /* byte size of compressed buffer */
	bitstream * stream; /* bit stream to write to or read from */
	size_t zfpsize;    /* byte size of compressed stream */

	/* allocate meta data for the 3D array a[nz][ny][nx] */
	type = zfp_type_float;
	field = zfp_field_1d (array, type, nx);

	/* allocate meta data for a compressed stream */
	zfp = zfp_stream_open (NULL);

	/* set compression mode and parameters via one of three functions */
	/*  zfp_stream_set_rate(zfp, rate, type, 3, 0); */
	/* A_precision = zfp_stream_set_precision(zfp, precision, type);*/
	zfp_stream_set_accuracy (zfp, tolerance);


	/* allocate buffer for compressed data */
	bufsize = zfp_stream_maximum_size (zfp, field);
	buffer = malloc (bufsize);
	assert (buffer);
	/* associate bit stream with allocated buffer */
	stream = stream_open (buffer, bufsize);
	zfp_stream_set_bit_stream (zfp, stream);
	zfp_stream_rewind (zfp);

	/* compress array and output compressed stream */
	//zfpsize = zfp_compress (zfp, field);
	zfpsize = zfp_compress(zfp, field);
	if (!zfpsize) {
		fprintf(stderr, "compression failed\n");
	}
	assert (zfpsize);
	zfp_field_free (field);
	zfp_stream_close (zfp);
	stream_close (stream);
*size=zfpsize;
return buffer;

}

double RMSE( double *a, double *b, int N)
{


double rmse=0;
for (int i=0; i < N; ++i) {

    double temp = b[i] - a[i];

    // coefficient-wise multiplication
    double residual = temp*temp;
    rmse += residual;
  }


  // calculate the squared root
  rmse = sqrt(rmse/N);

  // return the result
  return rmse;
}

float RMSEfloat( float *a, float *b, int N)
{


float rmse=0;
for (int i=0; i < N; ++i) {

    float temp = b[i] - a[i];

    // coefficient-wise multiplication
    float residual = temp*temp;
    rmse += residual;
  }


  // calculate the squared root
  rmse = sqrt(rmse/N);

  // return the result
  return rmse;
}
