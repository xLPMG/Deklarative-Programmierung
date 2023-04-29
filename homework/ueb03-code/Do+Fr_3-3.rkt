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