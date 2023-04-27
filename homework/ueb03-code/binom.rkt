#lang racket
(define (binom n k)
  (cond
    [(and (>= k 1) (<= k n)) (+ (binom (- n 1) (- k 1)) (binom (- n 1) k))]
    [(and (equal? k 0) (>= n 0)) 1]
    [else 0]
   )
)