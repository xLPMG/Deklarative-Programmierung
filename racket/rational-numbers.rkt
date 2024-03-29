#lang racket
; constructor
(define (make-rat n d)
  (if (integer? n)
      (if (and (integer? d) (not (zero? d)))
          (let ((g (gcd (abs n) (abs d))))
            (if (negative? d)
                (cons (- (/ n g)) (- (/ d g)))
                (cons (/ n g) (/ d g))))
          (error "make-rat: Denominator wrong type:" d))
      (error "make-rat: Numerator wrong type:" n)))
; reference functions (get)
(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (car x) g) ))
(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (cdr x) g) ))
; predicate
(define (rational? r)
  (and (pair? r)
       (integer? (car r))
       (integer? (cdr r))
       (positive? (cdr r))))

; arithmetic
(define (+rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (denom x) (numer y)))
            (* (denom x) (denom y))))
(define (-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (denom x) (numer y)))
            (* (denom x) (denom y))))
(define (*rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (/rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (=rat x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))

; examples
(define rat1 (make-rat 15 3))
rat1 ; '(5 . 1)
(define rat2 (make-rat 24 13))
rat2 ; '(24 . 13)
(define rat3 (make-rat 39 25))
rat3 ; '(39 . 25)
(define rat4 (make-rat 100 12))
rat4 ; '(25 . 3)

(*rat rat2 rat3) ;'(72 . 25)
(/rat rat1 rat4) ;'(3 . 5)
(+rat rat1 rat4) ;'(40 . 3)
(-rat rat4 rat3) ;'(508 . 75)
(=rat (*rat rat1 rat1) (*rat rat4 (make-rat 12 4))) ; #t

