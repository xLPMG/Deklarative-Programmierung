#lang racket
(define (generate-random-integers n ran)
  (define (generate-random-integers-helper count acc)
    (if (= count 0)
        acc
        (generate-random-integers-helper (- count 1) (cons (random ran) acc))))
    (generate-random-integers-helper n '()))

(define (get-num-integer)
  (string->number (read-line)))

(display "how many random numbers do you want?")
(define num-integers (get-num-integer))
(display "in what range should they be from 0 till x-1, supply x as an integer!")
(define ran-integer (get-num-integer))

(define random-list (reverse (generate-random-integers num-integers ran-integer)))
(displayln random-list)