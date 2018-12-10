#!r6rs
(import (rnrs)
	(psystem os))

(let ((name (cadr (command-line))))
  (display "Testing OS name ... ")
  (let ((result (eq? *psystem:os-name* (string->symbol name))))
    (display result) (newline)
    (exit (if result 0 1))))
