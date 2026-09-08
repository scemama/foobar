- foo (lib) depends on trexio
- foo2 (lib) depends on trexio
- bar (lib) depends on foo and foo2, but does not use trexio directly
- bar\_exe (binary) links with bar.
- bar\_trexio (lib) depends on foo and foo2 and includes trexio for trexio calls in bar\_trexio\_exe
- bar\_trexio\_exe (binary) links with bar\_trexio.

`run.sh` compiles and runs bar\_exe.

Everything works
