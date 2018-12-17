R6RS portable environment access
================================

`(psystem *)` provides system APIs such as `libc` access.


Prerequisite
============

This library requires [`(pffi)`](https://github.com/ktakashi/r6rs-pffi/).
For convenience, it's also a submodule located on `deps/pffi` of this 
repository.

`(psystem os)`: OS name
=======================

This library provides the name of the OS.

- `*psystem:os-name*`: 
  Symbol of the operating system's name. The name shall be the same per
  implementations if they are running on the same platform.

`(psystem libc)`: C API
=======================

This library provides access to `libc` so that users don't have to write
the following common code:

```!scheme
(define *psystem:libc*
  (open-shared-object
   (case *psystem:os-name*
     ((Linux) "libc.so.6")
     ((Darwin) "libc.dylib")
     ((Windows) "msvcrt.dll")
	 ;; something else
     (else "libc.so"))))
```

It also provides commonly used C function bindings.

- `*psystem:libc*`: A PFFI shared object of libc.
- `(psystem:malloc size)`: 
  A binding for `malloc`. The returning value is a pointer.
- `(psystem:free pointer)`: 
  A binding for `free`. The given argument must be a pointer
  which is allocated by the `psystem:malloc` or other `malloc` on the
  same libc.

Supported implementations
=========================

Currently the following implemnetations are supported.

- Sagittarius Scheme (0.9.4 or later)
- Chez Scheme (v9.5)
- Larceny (1.3)

If the implemnetation supports [SRFI 112](https://srfi.schemers.org/srfi-112/),
then it would work without modification.

How to add implementations
==========================

Currently, the only implementation dependent part is `(psystem os)` library.
If your implementation doesn't support SRFI 112, then add a file under the
`lib/psystem/` with name of `os.${implementation}.sls` which is de-fact
standard to dispatch library of R6RS implementations, and impelemnt the
variable described above section.

For example, if you want to add `SuperScheme` which can only be run on
Linux machine then the file would look like this:

The file name: `os.superscheme.sls`
The content:
```scheme
(library (psystem os)
    (export *psystem:os-name*)
	(import (rnrs))
(define *psystem:os-name* 'Linux)
)
```
