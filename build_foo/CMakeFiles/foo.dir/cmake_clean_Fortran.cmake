# Remove fortran modules provided by this target.
FILE(REMOVE
  "mod/foo_module.mod"
  "mod/FOO_MODULE.mod"
  "CMakeFiles/foo.dir/foo_module.mod.stamp"

  "mod/trexio.mod"
  "mod/TREXIO.mod"
  "CMakeFiles/foo.dir/trexio.mod.stamp"
  )
