# Frage 1
(list (+ 1 2) (* 3 4))
Output: '(3 12)

# Frage 2
```racket
(define func (lambda x
  (* x x))
(func 5)
```
Output: error, ")" fehlt
```
(define func (lambda (x)
  (* x x)))
(func 5)
```
# Frage 3
```racket
(define (fac n)
  (cond
    [(= n 1) 1]
    [else (* n (fac (- n 1)))]))
```
mit if:
```racket
(define (fac n)
  (if (= n 1) 
	  1
    (* n (fac (- n 1)))))
```

# Frage 4
```racket
(define (evens lst)
  (cond
    [(empty? lst) lst]
    [(even? (car lst)) (cons (car lst)(evens (cdr lst)))]
    [else (evens (cdr lst))]))
```

