#lang racket
(define (divides? n k)
  (cond
    [(>= n k)(divides? (- n k) k)]
    [(equal? n 0) #t]
    [else #f]))

(define (prime? n)
  (define (helper k)
    (cond
      [(= n 1) #f]
      [(= k 1) #t]
      [(divides? n k) #f]
      [else (helper (- k 1))]))
  (helper (- n 1))
  )
