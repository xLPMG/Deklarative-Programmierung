#lang racket
; Formale Parameter
(define (string-sort a b)
        (cond ((string=? a b) a)
              ((string<? a b) (string-append a ", " b))
              (else (string-append b ", " a))))

; Aktuale Parameter
(define a "b")
(define b "a")

; alternative definitionen:
(define (string-sort-2 a b)
        (cond ((string=? a b) a)
              ((string<? a b) (string-sort-2 a b))
              (else (string-append b ", " a))))


(define (string-sort-3 a b)
        (cond ((string=? a b) a)
              ((string<? (string-sort-3 a b) b) (string-append a ", " b))
              (else (string-append b ", " a))))