% Insertionsort
% ein Elelemnt in Liste zu sortieren
insert(X, [], [X]).
insert(X, [H|T], [X,H|T]) :- 
    nonvar(X), nonvar(H), X =< H.
insert(X, [H|T], [H|Tsorted]) :-
    nonvar(X), nonvar(H),
    X > H,
    insert(X,T,Tsorted).

% Liste wird zur sortierten Liste
insort([],[]).
insort([H|T], Sorted) :- 
    insort(T, Sorted2),
    insert(H, Sorted2, Sorted).