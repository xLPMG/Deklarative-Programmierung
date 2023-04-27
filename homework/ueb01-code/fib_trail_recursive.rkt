#lang racket
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 1)
        a
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))