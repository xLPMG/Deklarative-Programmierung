%Sortieren

%Min-sort:
%Minimum finden
minimum([X], X).
minimum([X | Rest], Min) :-
    minimum(Rest, MinRest),
    X =< MinRest,
    Min is X.
minimum([X | Rest], Min) :-
    minimum(Rest, MinRest),
    X > MinRest,
    Min is MinRest.

%sortieren
min_sort([], []).
min_sort(Liste, [Min | SortierteRest]) :-
    minimum(Liste, Min),
    select(Min, Liste, Rest),
    min_sort(Rest, SortierteRest).

% ? - sortiere([1,4,2,7,8,9,3,2],L)

%Bogosort
use_module(library(random)).

is_sorted([]).
is_sorted([_]).
is_sorted([X, Y | Rest]) :-
    X =< Y,
    is_sorted([Y | Rest]).

%?-is_sorted([1,3,5,9,11])
%?-is_sorted([1, 7,  5, 13, 4]).

bogosort(List, Sorted) :-
    nonvar(List),
    random_permutation(List, Shuffled),
    (is_sorted(Shuffled) -> Sorted = Shuffled ; 
    bogosort(List, Sorted)).
bogosort(List, Sorted) :-
    nonvar(Sorted),
    is_sorted(Sorted),
    random_permutation(Sorted, List);
    nonvar(Sorted),
    is_sorted(Sorted),    
    bogosort(List, Sorted).
