#lang racket
(define (gerade? n)
  (cond
    [(zero? n) (display "ja")]
    [(equal? n 1) (display "nein")]
    [(equal? n -1) (display "nein")]
    [(positive? n) (gerade? (- n 2))]
    [(negative? n) (gerade? (+ n 2))]
  )
)
(define (ungerade? n)
  (cond
    [(zero? n) (display "nein")]
    [(equal? n 1) (display "ja")]
    [(equal? n -1) (display "ja")]
    [(positive? n) (ungerade? (- n 2))]
    [(negative? n) (ungerade? (+ n 2))]
  )
)

(define (beides? n)
  (cond
    [(zero? n) (display "n ist gerade")]
    [(equal? n 1) (display "n ist ungerade")]
    [(equal? n -1) (display "n ist ungerade")]
    [(positive? n) (beides? (- n 2))]
    [(negative? n) (beides? (+ n 2))]
  )
)