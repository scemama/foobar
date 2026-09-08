```bash
make
```
This compiles `foo/foo` and `bar/bar`.

- foo depends on trexio
- bar depends on trexio, and on `foo_module` that depends on trexio
