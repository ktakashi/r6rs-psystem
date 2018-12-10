#!r6rs
(import (rnrs)
	(psystem libc)
	(pffi))

(let ((p (psystem:malloc 1)))
  (display "Test malloc ...")
  (display (pointer? p)) (newline)
  (unless (pointer? p) (exit 1))
  (display "Test free...")
  (psystem:free p)
  (display #t) (newline)
  (exit 0))
