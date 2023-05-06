#lang racket
; a) naive definition
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

"it takes some time to calculate the 37th fibonacci number:"
(time (fib 37))
; die Baumrekursion

; b)
(define (fibi n)
  (define (fib-iter a b count)
    (if (= count 1)
        a
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

"iterative its almost instant:"
(time (fibi 37))
"We could even calculate large (1000th) fibonacci numbers quickly:"
(time (fibi 1000))

; c) Um nach beliebiger Präzision zu berechnen, brauchen wir eine Approximation
; Das Verhältnis der Fibonaccizahlen nährt sich alternierend an den Grenzwert an, weswegen
; wir die Differenz zweier Folgeglieder nehmen können um eine obere Schranke für die Präzision zu bestimmen
(define (phi precision)
  (define (fibi n) ; Um die AUfgabe self-contained zu halten hier die Definition nochmal als Unterfunktion
    (define (fib-iter a b count)
      (if (= count 1)
          a
          (fib-iter (+ a b) a (- count 1))))
    (fib-iter 1 0 n))
  (define (phi-approx n) ; Erstmal Phi approximieren
    (/ (fibi (+ n 1)) (fibi n)))
  (define (phi-approx-iter n old-approx) ; Jetzt über die differenzen der Approximationen iterativ den Error bestimmen, bis unterhalb der gefragten Präzision
    (define new-approx (phi-approx n))
      (if (< (abs (- new-approx old-approx)) (expt 10 (- precision)))
          new-approx
          (phi-approx-iter (+ n 1) new-approx)))
  (/ (round (* (phi-approx-iter 1 0)
               (expt 10 precision)))
     (expt 10 precision)))
           
; Die Ergebnisse werden autoamtisch gekürzt, da es sich um rationale Zahlen handelt, mit denen DrRacket beliebige Präzision erreicht
; Die Nachkommastellen stehen dann über dem Bruchstrich
(phi 4)
(phi 10)
(phi 50)
(phi 150)