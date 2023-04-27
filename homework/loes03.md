## Aufgabe 1
[[ueb03#Aufgabe 1: Wechselseitige Rekursion]]
```racket
#lang racket
(define (gerade? n)
  (cond
    [(zero? n) #t]
    [(equal? n 1) #f]
    [(equal? n -1) #f]
    [(positive? n) (gerade? (- n 2))]
    [(negative? n) (gerade? (+ n 2))]
  )
)
(define (ungerade? n)
  (cond
    [(zero? n) #f]
    [(equal? n 1) #t]
    [(equal? n -1) #t]
    [(positive? n) (ungerade? (- n 2))]
    [(negative? n) (ungerade? (+ n 2))]
  )
)
```
Implementierung aus Übung:
```racket

```

## Aufgabe 2
a)
```racket
#lang racket
(define (binom n k)
  (cond
    [(>= n k 1) (+ (binom (- n 1) (- k 1)) (binom (- n 1) k))]
    [(and (equal? k 0) (>= n 0)) 1]
    [else 0]
   )
)
```
b)
`(binom 4 2)`
`(cond (zero? 2)...)`
`(cond (>= 4 2 1))`
`(+ (binom (- 4 1) (- 2 1)) (binom (- 4 1) 2)`
c)baumartige Rekursion

## Aufgabe 3
