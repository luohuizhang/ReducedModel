GFORTRAN    = gfortran -Wall
CC          = gcc -Wall
MPI_FORTRAN = mpif90 -Wall
MPI_CC      = mpicc 
LD = -lm

.SUFFIXES : .o .c

all:  explicitPar explicitPar_reduced base_heat3d

base_heat3d : base_heat3d.o explUtilPar.o updateBound.o readParam.o
	$(MPI_CC)  -o $@ base_heat3d.o explUtilPar.o updateBound.o readParam.o $(LD)
		
explicitPar : explicitPar.o explUtilPar.o updateBound.o readParam.o
	$(MPI_CC)  -o $@ explicitPar.o explUtilPar.o updateBound.o readParam.o $(LD)

explicitPar_reduced : explicitPar_reduced.o explUtilPar.o updateBound.o readParam.o
	$(MPI_CC)  -o $@ explicitPar_reduced.o explUtilPar.o updateBound.o readParam.o $(LD)
.c.o :
	$(MPI_CC) -c $(*F).c

clean : 
	/bin/rm -f *.o explicitSeq explicitPar
