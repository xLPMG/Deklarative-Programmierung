#lang racket
(define str "thisisatest")
(string-length str)
(string-append "thisis" "a" "test")
(substring str 0 6) ; dies ist ein Kommentar

; cuts out a substring, and returns the rest
(define (cut string x y)
        (cond ((not (string? string))
               (raise-argument-error 'cut "please provide a string as a first argument" string))
              ((>= (string-length string) y x)
               (string-append (substring string 0 x) (substring string y (string-length string))))
              (else string)))
