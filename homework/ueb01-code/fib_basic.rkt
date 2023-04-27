#lang racket
(define (fib n) ;Zeilenumbruch ist wie Leerzeichen
  (if (or (= n 1) (= n 2))
      1
      (+ (fib (- n 1)) (fib (- n 2)))))

(display (fib 10))