#lang racket/base
; mystery m zu bestimmen
(define (m n)
   (if (> n 100)
       (- n 10)
       (m (m (+ n 11)))))
; Rekursionsschritt 'quasi' +1
; Beispielaufrufe: 
(m 100)
(m 102)
(m 113)
(m 99)
(m 90)
(m 89)
(m 0)
(m -1000)
(m 1000)

; alternative Definitionen
(define (m_iter n)
  (if (> n 100)
      (- n 10)
      (m_iter (+ n 1))))

(define (m_fast n)
  (if (> n 100)
      (- n 10)
      91))

; Werteverlaufsrekursion wird im Rahmen der Vorlesung synonym mit Iteration verwendet.
