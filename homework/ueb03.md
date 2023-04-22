## Aufgabe 1: Wechselseitige Rekursion
Entwerfen Sie Funktionen `(gerade? n)` und `(ungerade? n)` zur Berechnung der entsprechenden Prädikate für natürliche Zahlen. Verwenden Sie dabei neben `gerade?` und `ungerade?` selbst sowie den Wahrheitswerten `#t` und `#f` ausschließlich die Subtraktion und das Prädikat `zero?` (Vergleich mit 0) sowie die Spezialformen `define` und `cond`.

Funktionieren Ihre Funktionen auch für negative ganze Zahlen? Wenn nein, wie müssten Sie diese anpassen?

## Aufgabe 2: Binomialkoeffizienten
Für die Binomialkoeffizienten $\binom{n}{k}$ gilt für natürliche Zahlen $n$ und $k$ die folgende Beziehung:
$$\binom{n}{k} = 
\begin{cases}
\binom{n-1}{k-1} + \binom{n-1}{k} & \text{für } 1 \leq k \leq n \\  
1 & \text{für } k = 0 \text{ und } n \geq 0 \\  
0 & \text{sonst}
\end{cases}$$
**a)** Implementieren Sie eine Funktion `binom`, die für zwei natürliche Zahlen $n$ und $k$ deren Binomialkoeffizenten  $\binom{n}{k}$ berechnet!

**b)** Veranschaulichen Sie mit dem Substitutionsmodell die Auswertung von `(binom 4 2)`.

**c)** Was für eine Art von Prozess erzeugt die von Ihnen implementierte Funktion `binom`?

## Aufgabe 3: Gültigkeitsbereiche
Skizzieren Sie die Gültigkeitsbereiche für folgende Scheme-Ausdrücke:
```racket
(define small-number 0.00001)
(define pi 3.14)
(define radius 10)
(define umfang-static (* 2 pi radius))
(define (umfang radius) (define pi 3.14159) (* 2 pi radius))
(define (average x y) (define (half-of x) (/ x 2)) (half-of (+ x y)))
(define square x) (* x x))
(define (sqrt x)
(define (good-enough? guess x)
(define small-number 0.001)
(< (abs (- (square guess) x)) small-number))
(define (improve guess x) (average guess (/ x guess)))
(define (sqrt-iter guess x)
        (cond ((good-enough? guess x) guess)
        (else (sqrt-iter (improve guess x) x))))
(cond ((< x 0) "Fehler")
      ((zero? x) 0)
      (else (sqrt-iter 1 x))))
```

Dabei soll Programmierquelltext als `code` dargestellt werden.