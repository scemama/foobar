FC=gfortran
FOO_DIR=../foo

OBJ=bar_module.o main_bar.o trexio_module.o $(FOO_DIR)/foo_module.o

bar: $(OBJ)
	$(FC) -o bar $(OBJ)  -ltrexio


%.o: %.F90
	$(FC) -I$(FOO_DIR) -c $*.F90 -o $*.o

bar_module.o: trexio_module.o
main_bar.o: bar_module.o

clean:
	$(RM) bar *.o *.mod *.hdf5
