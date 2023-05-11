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
a) verschachtelte Rekursion $\rightarrow$ ein Rekusionsauffruf muss erst auf einen anderen warten

Andere Rekursionsarten:
f(x) = f(x-1) + f(x-2) $\rightarrow$ Baumrekursion
f(x) = 1 + f(x-1) $\rightarrow$ Lineare Rekursion
f(x, y) = f(x-1, y+1) $\rightarrow$ Werteverlaufsrekursion / Iteration / Endrekursion / Restrekursion
```
(m 101)
(if (> 101 100)...) -> #t
(- 101 10)
91
```

```
(m 100)
if (> 100 100) -> #f
(m (m (+ 100 11)))
(m (m 111))
if (> 111 100) -> #t
(m 101)
if (> 101 100) -> #t
91
```
(m 200) $\rightarrow$ 190
(m 1000) $\rightarrow$ 990

b) Ein m addiert immer 1, da wir 11 addieren aber nur 10 abziehen.
c)
```racket
  (define (m_iter n)
  (if (> n 100)
      (- n 10)
      (m_iter (+ n 1))))

(define (m_fast n)
  (if (> n 100)
      (- n 10)
      91))
```
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

Implementierung aus Übung:
```racket
(define (prime? n)  
  (define (divides? m)
    (cond [(> m (sqrt n)) #t]
          [(zero? (modulo n m))#f]
          [else (divides? (+ m 1))]))
  (if (<= n 1) #f (divides? 2)))
```
b)
Hinweise zu Listen: 
- (list x y z) Erzeugt die Liste '(x y z), die leere Liste wäre '()
- (cons x y) erzeugt das geordnete Paar (x . y), Listen sind über geordnete Paare implementiert, die Liste '(x y z) ist in Wahrheit die Verkettung der Paare (x . (y . (z . '())))
- (append lst1 lst2) fügt die elemente der Listen lst1 und lst2 in eine neue Liste zusammen 
- (car lst) gibt das erste Element der Liste lst zurück, (cdr lst) die Restliste nach dem ersten Element
- (length lst) gibt die Länge der Liste lst zurück

```racket
(define (first-primes n)
  (define (firstph lst k)
    (cond ((= (length lst) n) lst)
          ((prime? k) (firstph (append lst (list k)) (+ 1 k)))
          (else (firstph lst (+ 1 k))))
    )
  (firstph '() 2)) ; null ist auch als leere Liste möglich
```
c) 
Optimierungen:
- Nutzen der Liste der bereits erzeugten Primzahlen um die Teilbarkeit nur durch Primzahlen zu prüfen
-   nur ungerade Zahlen überprüfen
- Hinweis: Beginn mit nicht leerer Liste, da sonst (car lst) einen Zugriffsfehler erzeugt
```racket
(define (first-primes-fast n)
  (define (prime? n lst) 
    (define (divides? lst)
      (define m (car lst))
      (cond [(> m (sqrt n)) #t]
            [(zero? (modulo n m))#f]
            [else (divides? (cdr lst))]))
    (if (<= n 1) #f (divides? lst)))
  (define (firstph lst k)
    (cond ((= (length lst) n) lst)
          ((prime? k lst) (firstph (append lst (list k)) (+ 2 k)))
          (else (firstph lst (+ 2 k))))
    )
  (if (<= n 0)
      '()
      (firstph '(2) 3)))
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

Implementierung aus Übung:
```racket
(define (fibi n)
  (define (fib-iter a b count)
    (if (= count 1)
        a
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))
```
c)
Um nach beliebiger Präzision zu berechnen, brauchen wir eine Approximation. Das Verhältnis der Fibonaccizahlen nährt sich alternierend an den Grenzwert an, weswegen wir die Differenz zweier Folgeglieder nehmen können um eine obere Schranke für die Präzision zu bestimmen.
```racket
(define (phi precision)
  (define (fibi n)
    (define (fib-iter a b count)
      (if (= count 1)
          a
          (fib-iter (+ a b) a (- count 1))))
    (fib-iter 1 0 n))
  (define (phi-approx n)
    (/ (fibi (+ n 1)) (fibi n)))
  (define (phi-approx-iter n old-approx)
    (define new-approx (phi-approx n))
      (if (< (abs (- new-approx old-approx)) (expt 10 (- precision)))
          new-approx
          (phi-approx-iter (+ n 1) new-approx)))
  (/ (round (* (phi-approx-iter 1 0)
               (expt 10 precision)))
     (expt 10 precision)))
```
- erst Phi approximieren
- dann über die differenzen der Approximationen iterativ den Error bestimmen, bis unterhalb der gefragten Präzision
## Aufgabe 7
![[3-7.jpg]]

b)
```racket
#lang racket
(define lst '(define (abs x) (cond ((>= x 0) x) (else (- x)))))
```

`(car (cdr (car (cdr lst))))
Output: 'x
`(car(cdr(car(cdr(car(cdr(cdr(car(cdr(cdr lst))))))))))
Output: 'x

## Aufgabe 8
a) Umwandlung einer Dezimalzahl in eine Binärzahl
```
mystery 13
13 / 2 -> Rest 1 -> else -> Liste: 1 (mystery 6)
mystery 6: b !0 -> Rest 0 -> Liste: 1 0 (mystery 3)
mystery 3: b !0 -> Rest 1 -> else -> Liste 1 0 1 (mystery 1)
mystery 1: b !0 -> Rest 1 -> else -> Liste 1 0 1 1 (mystery 0)
-> b = 0 : 1 0 1 1
```
-> normale Rekursion, nicht end-rekursiv
b) Multiplikation von a und b
c) a wird binär interpretiert. Für jede Stelle von a wird b schrittweise mit 2 multipliziert. Bei 0 wird das aktuelle b links an die Liste angehangen, bei einer 1 rechts.
d)xw
## Aufgabe 9
[[ueb03#Aufgabe 9: Collatz-Folge]]
```racket
#lang racket
(define (collatz n)
  (define (chelp lst n)
        (cond
          [(member n lst) lst]
          [(even? n)(chelp (append lst (list n)) (/ n 2))]
          [else (chelp (append lst (list n)) (+ (* 3 n) 1))])
    )
  (chelp '() n))
```

```racket
(define (b_collatz n)
  (define (bchelp n lst)
    (cond
      [(<= n 0) lst]
      [(<= (length (collatz n)) (length lst)) (bchelp (- n 1) lst)]
      [(> (length (collatz n)) (length lst)) (bchelp (- n 1) (collatz n))]
      )
    )
  (bchelp n '())
  )
```