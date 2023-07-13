% Mergesort Prädikate
% Teile in der Mitte
my_length([], 0).
my_length([_H|T], Length) :-
    my_length(T, L1),
    Length is L1 + 1.

% Splittet L in Left und Right
split(L, Left, Right) :-
    my_length(L, Length),
    !,
    Mid is Length//2,
    my_length(Left, Mid),
    !,
    append(Left, Right, L).

% merge(LinkeListe, RechteListe, Zusammengemerged)
merge([], L, L) :- !.
merge(L, [], L) :- !.
merge([H1|T1], [H2|T2], [H1|L]) :-
    H1 =< H2,
    merge(T1, [H2|T2], L).
merge([H1|T1], [H2|T2], [H2|L]) :-
    H1 > H2,
    merge([H1|T1], T2, L).

% mergesort(Unsortierte Liste, Sortierte Liste).
mergesort([],[]) :- !.
mergesort([X],[X]) :- !.
mergesort(Liste, Sorted) :-
    split(Liste, Left, Right),
    mergesort(Left, LeftSorted),
    mergesort(Right, RightSorted),
    merge(LeftSorted, RightSorted, Sorted).