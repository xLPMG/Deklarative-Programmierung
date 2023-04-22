## Aufgabe 1
[[ueb02#Aufgabe 1: SCHEME-Syntax]]
 a)
 i. (10 - (8 - (6 - 4)))
 ii. (0.1 * 20) + (4 / -3)
 iii. 40 / (5 * 20)
 iv. ((5 - (2 - 100) - 3) - 10) - 5
 b)
 i. (- (* 4 7) (+ 13 5))
 ii. (+ (* 5 (* 537 (+ 98.3 (- 37.5 (* 2.5 153))))) 255)
 
## Aufgabe 2
[[ueb02#Aufgabe 2: Substitutionsmodell: formale/aktuale Parameter]]
-formale Parameter in Zeile 5 & 6
-nach dem Einsetzen -> aktual
-applikative Auswertung: erst Parameter auswerten, dann Funktionen

1. `(string-sort "b" "a")`
2. `(cond ((string=? "b" "a") "b")...)`
3. `(cond (#f "b")...)`
4. `(else ...)`$\rightarrow$`#t`
5. `(string-append "a" ", " "b")`
6. `"a, b"`

## Aufgabe 3
[[ueb02#Aufgabe 3: Arithmetik-freie Prozedurdefinitionen]]
```racket
#lang racket
(define (cut string x y)
  (define result "")
  (string-append result (substring string 0 x) (substring string (+ y 1) (string-length string)))
  )
```
Example usage:
```
> (cut "hallo" 0 1)
"llo"
> (cut "hallo" 1 3)
"ho"
> (cut "hallo" 4 8)
substring: starting index is out of range
  starting index: 9
  valid range: [0, 5]
  string: "hallo"
```

## Aufgabe 4
[[ueb02#Aufgabe 4: Substitutionsmodell: Rekursive und iterative Prozesse]]
a)
```racket
(define (1+ x) (+ x 1))
(define (1- x) (- x 1))
```
b)
`>(a-plus 4 5)`
`(if #f 5 (1+ (a-plus (1- 4) 5))))`
`(1+ (a-plus 3 5))`
`(1+ (if (zero? 3)...`$\rightarrow$`#f`
`(1+(1+(a-plus 1- 3) 5))`
`(1+(1+(1+(a-plus 1- 1) 5))`
`(1+(1+(1+(1+(a-plus 0 5)))))`
`----------(if (zero? 0))`
`(1+(1+(1+(1+ 5))))`
`(1+(1+(1+ 6))`
`9`

`>(b-plus 4 5`
`(b-plus (1- 4) (1+ 5))`$\rightarrow$`(b-plus 3 6)`
`(b-plus 2 7)`
`(b-plus 1 8)`
`(b-plus 0 9)`
`Bedingung #f`
`9`
c) 
a-plus: rekursiv
b-plus: iterativ, bzw. rest-rekursiv

## Aufgabe 5
[[ueb02#Aufgabe 5: Auswertungsordnung]]
Applikativ:
```
(test 0 (p 1))
(test 0 (p 2))
(test 0 (p 3))
...
```
Normal:
```
(test 0 (p 1))
(if (= 0 0)) -> #t
0
```
