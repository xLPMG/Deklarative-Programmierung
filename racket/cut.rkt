#lang racket
(define (cut string x y)
  (define result "")
  (string-append result (substring string 0 x) (substring string (+ y 1) (string-length string)))
  )