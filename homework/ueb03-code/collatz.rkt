#lang racket
(define (collatz n)
  (define (chelp lst n)
        (cond
          [(member n lst) lst]
          [(even? n)(chelp (append lst (list n)) (/ n 2))]
          [else (chelp (append lst (list n)) (+ (* 3 n) 1))])
    )
  (chelp '() n))

(define (b_collatz n)
  (define (bchelp n lst)
    (cond
      [(<= n 0) lst]
      [(<= (length (collatz n)) (length lst)) (bchelp (- n 1) lst)]
      [(> (length (collatz n)) (length lst)) (bchelp (- n 1) (collatz n))]
      )
    )
  (bchelp n '())
  )