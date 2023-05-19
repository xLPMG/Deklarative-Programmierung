#lang racket
; #### simple point ####
(define-struct simple-point (x y))
; example:
(define p-s (make-simple-point 4 3))
p-s
(simple-point-x p-s)
(simple-point-y p-s)
(simple-point? p-s)


; #### advanced point ####
(struct point (x y)
  #:property prop:custom-write ;prints its properties as defined
  (lambda (p out mode)
    (fprintf out "<point: x=~a, y=~a>"
            (point-x p) 
            (point-y p))))
(define first point-x)
(define rest point-y)
; example:
(define p (point 3 5))
p
(first p)
(rest p)
(point? p)
(simple-point? p)
(point? p-s)


; #### even more advanced point ####
(struct complex-point (x y z) #:transparent)
(define (make-complex-point-from-point p z) ; can't overload the standard constructor
  (complex-point (point-x p) (point-y p) z))

; convert complex point to normal point, projection to x y
(define (complex-point->point cp) (point (complex-point-x cp) (complex-point-y cp)))

(define (make-complex-point x y . maybe-z) ; but we could work with optional aruments
  (if (null? maybe-z) ; z is a list that is either empty or has one argument
      (complex-point (point-x x) (point-y x) y)
      (complex-point x y (car maybe-z))))

;example:
(define p1 (point 3 4))
(define cp1 (make-complex-point-from-point p1 5))
(define cp2 (complex-point 3 4 5))

cp1 ; (complex-point 3 4 5)
cp2 ; (complex-point 3 4 5)

(define cp3 (make-complex-point p 7))
(define cp4 (make-complex-point 3 5 7))

cp3 ; (complex-point 3 5 7)
cp4 ; (complex-point 3 5 7)

(define p2 (complex-point->point cp2)) 
p2 
