#lang racket
(define (gerade? n)
  (cond ((zero? n) #t)
        (else (ungerade? (- n 1)))))

(define (ungerade? n)
  (cond ((zero? n) #f)
        (else (gerade? (- n 1)))))

;inklusive der negativen Zahlen:
(define (gerade_fabian? n)
  (define (gerade_iter? n k)
    (cond ((zero? (- n k)) #t)
          ((zero? (- n (- 0 k))) #t)
          ((zero? (- n k 1)) #f)
          ((zero? (- n (- 0 1 k))) #f)
          (else (gerade_iter? n (- k -2)))
          )
    )
  (gerade_iter? n 0))
           
(define (ungerade_fabian? n)
  (cond ((gerade_fabian? n) #f)
        (else #t)))