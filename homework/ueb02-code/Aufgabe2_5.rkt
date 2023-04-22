#lang racket
(define (p x) (p (+ x 1)))
(define (test x y) (if (= x 0) 0 y))
; (test 0 (p 1))
