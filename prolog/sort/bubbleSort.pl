% Bubblesort
% swap: swapped durch alle Elemente durch

% false, falls kein swap mehr passiert, sonst 
% sortiert es 2 Elemente
swap([X],[X]).
swap([X,Y|Rest], [Y,X|Rest]) :-
    X > Y.
swap([X,Y|Rest], [X|Rest2]) :-
    X =< Y,
    swap([Y|Rest], Rest2).

is_sorted([]).
is_sorted([_]).
is_sorted([X, Y | Rest]) :-
    X =< Y,
    is_sorted([Y | Rest]).

bubble_sort(Liste, Liste) :-
    is_sorted(Liste).
bubble_sort(Liste, Sorted) :-
    not(is_sorted(Liste)),
    swap(Liste, Liste1),
    bubble_sort(Liste1, Sorted).