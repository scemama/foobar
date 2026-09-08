module bar_module
  use trexio
  use foo_module
contains
  subroutine test_bar()
    implicit none
    integer(trexio_t) :: f
    integer(trexio_exit_code) :: rc
    integer :: mo_num
    character*(16) :: cls(2)

    print *, 'FOO'

    call test_foo()

    print *, 'BAR'

    f = trexio_open('foo.hdf5', 'r', TREXIO_HDF5, rc)
    call trexio_assert(rc, TREXIO_SUCCESS, 'open OK')

    rc = trexio_read_mo_num(f,mo_num)
    call trexio_assert(rc, TREXIO_SUCCESS, 'write mo_num OK')

    rc = trexio_read_mo_class(f,cls,16)
    call trexio_assert(rc, TREXIO_SUCCESS, 'read_class OK!')

    print *, cls(:)
  end subroutine
end module bar_module
