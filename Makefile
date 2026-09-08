.PHONY: default clean

default:
	make -C foo
	make -C bar

clean:

	make -C foo clean
	make -C bar clean
