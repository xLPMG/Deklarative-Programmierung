#lang racket
(define (binom n k) ; Definition, Annahme: Wir bekommen korrekte Eingaben für n und k
  (cond ((zero? k) 1) ; Abbruchbedingung
        ((>= n k 1) (+ (binom (- n 1) (- k 1)) (binom (- n 1) k))) ;Rekursiven Aufruf
        (else 0))) ; 2. Abbruchbedingung


(define (binom_iter n k)
  (define (binom_helper prod k_iter)
    (cond ((= k_iter k) prod)
          (else (binom_helper (* prod
                                     (/ (- n k_iter)
                                        (- k k_iter))
                                  )
                              (+ 1 k_iter))
          )
    )
  )
  (binom_helper 1 0)
)