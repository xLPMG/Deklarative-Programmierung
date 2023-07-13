
# Aufgabe 2
a)
Ergebnis = 5
Da in jedem Schritt abwechseln von a und b 1 abgezogen wird bis 0 erreicht ist. Sind also die Eingaben >=0 so wird dieser Punkt auf jeden Fall erreicht. Dann endet die Rekursion und es wird rückwärts für jeden Rekursionsschritt 1 hochgezählt -> endlich
b)
c)
```racket
(define (myst a b)
(define (myst-iter a b count)
(if (zero? b) count
(myst-iter (- b 1) a (+ 1 count)))
(myst-iter a b 0)))
```

# Aufgabe 4
a)
```racket
(define (scale lst s)
  (if (empty? lst) lst
  (cons (* s (car lst)) (scale (cdr lst) s))))
```

b)
```racket
(define (lstadd lst1 lst2)
  (cond
    [(and (empty? lst1) (empty? lst2) '())]
    [(empty? lst1) lst2]
    [(empty? lst2) lst1]
    [else (cons (+ (car lst1) (car lst2)) (lstadd (cdr lst1) (cdr lst2)))]))
```
c)
```prolog
(define (polymulti pol1 pol2)
    (cond
        ((empty? pol1) pol1)
        (else (lstadd (scale pol2 (car pol1)) (cons 0 (polymulti (cdr pol1) pol2))))))
```

# Aufgabe 7
a)
```prolog
delete_all(_, [], []).
delete_all(X, [X|T], L) :-
    delete_all(X, T, L).
delete_all(X, [H|T], [H|L]) :-
    X =\= H,
    delete_all(X, T, L).
```
b)
```prolog
list2set([],[]).
list2set([X|T], [X|Res]) :-
    delete_all(X, T, L),
    list2set(L, Res).
```
c)
```prolog
set_diff(Lst1, [], Lst1).
set_diff(Lst1, [X|T], Res) :-
    delete_all(X, Lst1, L),
    set_diff(L, T, Res).
```
