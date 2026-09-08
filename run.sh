#!/bin/bash
set -x
set -euo pipefail

# Foo
cd foo
./build_foo.sh
./build_foo/foo

# Expected output:
# 
# open OK
# write mo_num OK
# write_class OK!
# read_class OK!
# Core            Active     

rm foo.hdf5

# Bar
cd ../bar
./build_bar.sh
./build_bar/bar

# Expected output:
# 
# FOO
# open OK
# write mo_num OK
# write_class OK!
# read_class OK!
# Core            Active          
# BAR
# open OK
# write mo_num OK
# read_class OK!
# Core            Active       

rm foo.hdf5
