## Aufgabe 1: Wechselseitige Rekursion
[[loes03#Aufgabe 1]]
Entwerfen Sie Funktionen `(gerade? n)` und `(ungerade? n)` zur Berechnung der entsprechenden Prädikate für natürliche Zahlen. Verwenden Sie dabei neben `gerade?` und `ungerade?` selbst sowie den Wahrheitswerten `#t` und `#f` ausschließlich die Subtraktion und das Prädikat `zero?` (Vergleich mit 0) sowie die Spezialformen `define` und `cond`.

Funktionieren Ihre Funktionen auch für negative ganze Zahlen? Wenn nein, wie müssten Sie diese anpassen?

## Aufgabe 2: Binomialkoeffizienten
[[loes03#Aufgabe 2]]
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
[[loes03#Aufgabe 3]]
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

## Aufgabe 4: Rekursion außerhalb des Wertverlaufs
[[loes03#Aufgabe 4]]
a) Welche Funktion berechnet das folgende rekursive Definitionsschema?

```
(define (m n)     
	(if (> n 100)     
      (- n 10)     
      (m (m (+ n 11)))))
```

b) Obwohl es sich hier um keine Wertverlaufsrekursion handelt, terminiert die Berechnung. mit diesem Schema für beliebig vorgegebene natürliche Zahlen. Warum?

c) Finden Sie eine einfache endrekursive (iterative) Definition dieser Funktion?

_Anmerkung: Was ist eine Werteverlaufsrekursion?_

## Aufgabe 5: Primzahlen & Listen
[[loes03#Aufgabe 5]]
**Primzahlen** sind natürliche Zahlen, welche nur durch 1 und sich selbst teilbar sind.  
a.) Schreiben Sie ein Prädikat `prime?`, das für eine vorgegebene natürliche Zahl entscheidet, ob sie eine Primzahl ist. Verwenden Sie dabei ein geeignet definiertes Prädikat `divides?`, welches auf Teilbarkeit testet!

b.) Informieren Sie sich über die [Listen in DrRacket](https://docs.racket-lang.org/reference/pairs.html) und entwerfen Sie eine Funktion `(first-primes n)`, welche eine Liste mit den ersten `n` Primzahlen zurückgibt. Nutzen Sie dazu Ihr Prädikat `prime?`.

c.) Finden Sie eine Optimierung, in der Sie die Zwischenergebnisse ihrer Funktion `(first-primes n)` nutzen können, um die Generierung zu beschleunigen!

## Aufgabe 6:  Fibonaccizahlen
Die Fibonacci-Zahlenreihe ist eine Sequenz von Zahlen, bei der jede Zahl die Summe der beiden vorhergehenden Zahlen ist. Die ersten beiden Zahlen der Sequenz sind 0 und 1. Mathematisch kann die n-te Fibonacci-Zahl (F(n)) wie folgt definiert werden:
$$F(n) = F(n-1) + F(n-2)$$
wobei F(0) = 0 und F(1) = 1.

**Aufgabe:**
a) Schreiben Sie eine rekursive Funktion `(fib n)` in DrRacket, die die n-te Fibonacci-Zahl berechnet. Um welche Art von Rekursion handelt es sich hierbei?

b) Schreiben Sie eine iterative Variante mit einer Hilfsfunktion in DrRacket, die die n-te Fibonacci-Zahl berechnet. Wie viele Parameter braucht Ihre Hilfsfunktion mindestens?

c) Der Goldene Schnitt ist ein besonderes Verhältnis, das in der Natur, Kunst und Architektur häufig vorkommt. Er kann mithilfe von Fibonacci-Zahlen approximiert werden, indem man aufeinanderfolgende Fibonacci-Zahlen teilt:
$$\phi \approx \frac{F(n)}{F(n-1)}$$
wenn `n` groß ist.

Entwickeln Sie eine Funktion `(phi precision)` in DrRacket, die den Goldenen Schnitt mithilfe der zuvor erstellten iterativen Funktion zur Berechnung der Fibonacci-Zahlen auf `precision` Nachkommastellen im Dezimalsystem approximiert. Überlegen Sie sich dabei eine clevere Möglichkeit die Genauigkeit ihrer Approximation zu prüfen. Was fällt ihnen bei der Ausgabe ihrer Ergebnisse auf?
