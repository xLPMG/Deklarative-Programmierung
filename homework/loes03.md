## Aufgabe 1
[[ueb03#Aufgabe 1: Wechselseitige Rekursion]]
```racket
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
```
## Aufgabe 2
a)
```racket
#lang racket
(define (binom n k)
  (cond
    [(and (>= k 1) (<= k n)) (+ (binom (- n 1) (- k 1)) (binom (- n 1) k))]
    [(and (equal? k 0) (>= n 0)) 1]
    [else 0]
   )
)
```
b)
`(binom 4 2)`
```racket
(cond
    [(and (>= 2 1) (<= 2 4)) (+ (binom (- 4 1) (- 2 1)) (binom (- 4 1) 2))]
    [(and (equal? 2 0) (>= 4 0)) 1]
    [else 0]
   )
```

```racket
(cond
    [(and (#t) (#t)) (+ (binom 3 1) (binom 3 2))]
    [(and (#f) (#t)) 1]
    [else 0]
   )
```

## Aufgabe 3
