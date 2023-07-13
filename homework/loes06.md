# Aufgabe 1
```prolog
zaehle_elemente(_,[],0).
zaehle_elemente(E,[E|Rest],N) :- 
    zaehle_elemente(E,Rest,N1), 
    N is N1 + 1.
zaehle_elemente(E,[X1|Rest],N) :- 
    dif(X1, E), 
    zaehle_elemente(E,Rest,N).
```

# Aufgabe 2
```prolog
fac(0,1).
fac(N,F) :-
    nonvar(N),
    N > 0,
    N1 is N-1,
    fac(N1, F1),
    F is N*F1.

fac(N,F) :-
    var(N),var(F),
    fac(N1, F1),
    N is N1 + 1,
    F is F1 * N.

fac(N,F) :-
    var(N),nonvar(F),
    fac(N1, F1),
    N is N1 + 1,
    (   F1 > F, !, false;
    F is F1 * N).
```

# Aufgabe 3
```prolog
collatz(1, []).

collatz(N, [H|T]) :-
    0 is N mod 2,
    H is N // 2, 
    collatz(H, T). 

collatz(N, [H|T]) :-
    H is 3 * N + 1, 
    collatz(H, T). 
```

# reverse
```prolog
myreverse([],[]). 
myreverse([H|T], Out) :- myreverse(T, T1), append(T1, [H], Out). 

myreverse2(In, Our) :- myreverse2(In, [], Our). 
myreverse2([], Out, Out). 
myreverse2([H|T], L, Our) :- 
myreverse2(T, [H|L], Our).
```