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
1. `(define (string-sort "b" "a")...)`
2. 
```racket
(cond ((string=? "b" "a") "b") 
    ((string<? "b" "a") (string-append "b" ", " "a"))
    (else (string-append "a" ", " "b"))))
```
3. 
```racket
(cond (#f "b")
    (#f (string-append "b" ", " "a"))
    (else (string-append "a" ", " "b"))))
```
4. `(string-append "a" ", " "b")`
5. `"a, b"`

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
