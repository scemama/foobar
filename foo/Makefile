FC=gfortran
OBJ=foo_module.o main_foo.o trexio_module.o

foo: $(OBJ)
	$(FC) -o foo $(OBJ)  -ltrexio


%.o: %.F90
	$(FC) -c $*.F90 -o $*.o

foo_module.o: trexio_module.o
main_foo.o: foo_module.o

clean:
	$(RM) foo *.o *.mod *.hdf5
