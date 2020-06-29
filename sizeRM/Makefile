GFORTRAN    = gfortran -Wall
CC          = gcc -O3
#CC          = gcc -g
MPI_FORTRAN = mpif90 -Wall
MPI_CC      = mpicc
LD = -lm

.SUFFIXES : .o .c
#Target:=ZFP SZ pcaZFP pcaSZ svdZFP svdSZ waveletZFP waveletSZ
Target:= pcaSZ pcaSZfloat svdSZ svdSZfloat waveletSZ waveletSZfloat 

all: $(Target)


$(Target): %:%.o
	$(CC) $(LD) $< -o $@  -L /home/luo/ZFP/zfp/lib/ -lzfp  -lSZ  -lzstd -lzlib -lm -lgsl -lgslcblas -L /home/luo/TOB/wavelib/Bin/ -lwavelib
%.o : %.c
	$(CC) -c $(*F).c -I /home/luo/ZFP/zfp/include -I /home/luo/TOB/wavelib/header/

clean :
	/bin/rm -f *.o $(Target) 

