#lang racket
;; variables
(define x 2)
(+ x 3)
;; (if test-expr then-expr else-expr)
(define (pos y)
  (if (positive? y) "yes" "no"))