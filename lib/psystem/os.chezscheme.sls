;;; -*- mode:scheme; coding:utf-8 -*-
;;;
;;; psystem/os.chezscheme.sls - Chez specific OS detection
;;;
;;;   Copyright (c) 2018  Takashi Kato  <ktakashi@ymail.com>
;;;
;;;   Redistribution and use in source and binary forms, with or without
;;;   modification, are permitted provided that the following conditions
;;;   are met:
;;;
;;;   1. Redistributions of source code must retain the above copyright
;;;      notice, this list of conditions and the following disclaimer.
;;;
;;;   2. Redistributions in binary form must reproduce the above copyright
;;;      notice, this list of conditions and the following disclaimer in the
;;;      documentation and/or other materials provided with the distribution.
;;;
;;;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;;;   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;;;   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;;;   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
;;;   OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
;;;   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
;;;   TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
;;;   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
;;;   LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;;   NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;;   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;;;

#!r6rs
(library (psystem os)
    (export *psystem:os-name*)
    (import (rnrs)
	    (only (chezscheme) machine-type))

(define *psystem:os-name*
  (case (machine-type)
    ((i3le ti3le a6le ta6le) 'Linux)
    ((i3osx ti3osx a6osx ta6osx) 'Darwin)
    ((i3nt ti3nt a6nt ta6nt) 'Windows)
    ((i3fb a6fb ti3fb ta6fb) 'FreeBSD)
    ((i3ob a6ob ti3ob ta6ob) 'OpenBSD)
    ((i3nb a6nb ti3nb ta6nb) 'NetBSD)
    ((i3s2 a6s2 ti3s2 ta6s2) 'SunOS)
    ;; FIXME
    (else 'Unknown)))
)
