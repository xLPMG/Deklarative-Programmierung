# Aufgabe 1
(1) p(X,X)
(2) p(X,Z) wenn q(X,Z) und p(Y,Z) gilt
(3) q(a,b)

# Aufgabe 2
b)
```prolog
erreichbar(X,Y):- nachbar(X,Y);
	nachbar(X,Z),erreichbar(Z,Y)
```
c)
```prolog
ist_loesung(n6).
loesung(X):- knoten(X),ist_loesung(X).
loesungen(X,Y):- start(X),erreichbar(X,Y),loesung(Y).
```

# Aufgabe 3
a) nein, da der Tail keine Liste ist
b) ```[[[[[1,2],[3]]],[4,5]]```
c) .(X, Y) ist veraltet. `[H|T]` neu
`[[1|[2|[3|[]]]]|[4|[5|[]]]

# Aufgabe 4
a)
restrekursiv:
```prolog
count([], 0).
count([0|Rest],N) :- count(Rest,N1), N is N1 + 1.
count([X|T],N) :- X =\= 0, count(T,N).  
```
nicht restrekursiv:

b)
```prolog
sca([], [], 0).
sca([X|Rest1], [Y|Rest2], Result) :- 
  Prod is X * Y,
  sca(Rest1, Rest2, Remaining),
  Result is Prod + Remaining.
```

d)
```prolog
divisible(X,Y) :- X mod Y =:= 0, !.
divisible(X,Y) :- 
    X > Y+1, 
    divisible(X, Y+1).
prime(2) :- true,!.
prime(X) :- X < 2,!,false.
prime(X) :- not(divisible(X, 2)).
```

# Aufgabe 5
```prolog
permute([],[]).
permute(Liste,[ErstesElement|Rest]) :-
    append(Liste1,[ErstesElement|Liste2],Liste),
    append(Liste1,Liste2,Liste3),
    permute(Liste3,Rest).

append([],Liste,Liste).
append([ErstesElement|Rest1],Liste,[ErstesElement|Liste1]) :-
    append(Rest1,Liste,Liste1).
```