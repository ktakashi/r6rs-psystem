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
