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
```

## Aufgabe 2
[[ueb03#Aufgabe 2: Binomialkoeffizienten]]
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
Implementierung aus Übung:
```racket
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
```
b)
`(binom 4 2)`
`(cond (zero? 2)...)`
`(cond (>= 4 2 1))`
`(+ (binom (- 4 1) (- 2 1)) (binom (- 4 1) 2)`
c)baumartige Rekursion

## Aufgabe 3
[[ueb03#Aufgabe 3: Gültigkeitsbereiche]]
Übung:
```racket
#lang racket
;Lasst euch nicht von 'viel' Code einschüchtern, lernt ihn verstehen :)
(define small-number 0.00001) ;global
(define pi 3.14) ;global
(define radius 10) ;global
(define umfang-static (* 2 pi radius)) ;global aus globalen variablen berechnet
(define (umfang radius) ;loklaer radius überschattet globalen radius innerhalb der Definition von umfang
  (define pi 3.14159) ; pi lokal für Fuktionsdefinition von umfang definiert
  (* 2 pi radius))
(define (average x y) (define (half-of x) (/ x 2)) (half-of (+ x y)))
(define (square x) (* x x))
; Wie funktioniert diese Funktion? ;) Probiert mal aus es nachzuvollziehen!
(define (sqrt x)  
  (define (good-enough? guess x)
    (define small-number 0.001)
    (< (abs (- (square guess) x)) small-number)) ;small-number nur lokal
  
  (define (improve guess x) (average guess (/ x guess))) ;lokales x und lokales guess für teilfunktion improve
  (define (sqrt-iter guess x) ;noch ein lokales x, ebenso ein lokales guess für die lokale funktion sqrt-iter
        (cond ((good-enough? guess x) guess)
        (else (sqrt-iter (improve guess x) x)))) ;hier wird die oben definierte Funktion 'improve' wieder verwendet
  (cond ((< x 0) "Fehler") ; ab hier wird das lokale von der äußeren funktion definierte x verwendet
      ((zero? x) 0)
      (else (sqrt-iter 1 x)))) ;hier verenden wir die lokale funktion sqrt-iter
```
## Aufgabe 4
## Aufgabe 5
[[ueb03#Aufgabe 5: Primzahlen & Listen]]
a)
```racket
#lang racket
(define (divides? n k)
  (cond
    [(>= n k)(divides? (- n k) k)]
    [(equal? n 0) #t]
    [else #f]))

(define (prime? n)
  (define (helper k)
    (cond
      [(= n 1) #f]
      [(= k 1) #t]
      [(divides? n k) #f]
      [else (helper (- k 1))]))
  (helper (- n 1))
  )
```

## Aufgabe 6
[[ueb03#Aufgabe 6: Fibonaccizahlen]]
a)
```racket
#lang racket
(define (fib n)
  (cond
    [(= n 0) 0]
    [(= n 1) 1]
    [else (+ (fib (- n 1)) (fib (- n 2)))]))
```
Baumartige Rekursion

b)
```racket
#lang racket
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
```
3 Parameter: ein Zähler der Iteration, die aktuelle Fibonacci-Zahl & die vorhergehende