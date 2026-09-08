module foo_module
  use trexio
contains
  subroutine test_foo()
    implicit none
    integer(trexio_t) :: f
    integer(trexio_exit_code) :: rc
    character*(16) :: cls(2)

    f = trexio_open('foo.hdf5', 'w', TREXIO_HDF5, rc)
    call trexio_assert(rc, TREXIO_SUCCESS, 'open OK')

    rc = trexio_write_mo_num(f,2)
    call trexio_assert(rc, TREXIO_SUCCESS, 'write mo_num OK')

    cls(1) = 'Core'
    cls(2) = 'Active'
    rc = trexio_write_mo_class(f,cls,16)
    call trexio_assert(rc, TREXIO_SUCCESS, 'write_class OK!')

    cls(1) = 'KJHKJHDKHDK'
    cls(2) = 'KJHKJHDKHDK'
    rc = trexio_read_mo_class(f,cls,16)
    call trexio_assert(rc, TREXIO_SUCCESS, 'read_class OK!')

    print *, cls(:)
  end subroutine
end module foo_module
