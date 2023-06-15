# Sortieralgorithmen in Prolog
## InsertionSort
```prolog
insert(X, [], [X]):- !.
insert(X, [H|T], [X,H|T]):- X =< H, !.
insert(X, [H|T], [H|Sorted]):- X > H, insert(X, T, Sorted).
insertionsort([], []):- !.
insertionsort([H|T], Sorted):- insertionsort(T, Sorted2), insert(H, Sorted2, Sorted).
```
Test mit `insertionsort([1,5,4,27,9,4,3],X).`

## QuickSort
```prolog
quicksort([], []).
quicksort([HEAD | TAIL], SORTED) :- 
    partition(HEAD, TAIL, LEFT, RIGHT),
	quicksort(LEFT, SORTEDL),
	quicksort(RIGHT, SORTEDR),
	append(SORTEDL, [HEAD | SORTEDR], SORTED).

partition(PIVOT, [], [], []).
partition(PIVOT, [HEAD | TAIL], [HEAD | LEFT], RIGHT) :- 
    HEAD @=< PIVOT, partition(PIVOT, TAIL, LEFT, RIGHT).
partition(PIVOT, [HEAD | TAIL], LEFT, [HEAD | RIGHT]) :- 
    HEAD @> PIVOT, partition(PIVOT, TAIL, LEFT, RIGHT).

append([], LIST, LIST).
append([HEAD | LIST1], LIST2, [HEAD | LIST3]) :- 
    append(LIST1, LIST2, LIST3).
```
Test mit `quicksort([1,4,7,3,6,8],X).`

# MergeSort
```prolog
split(L, Left, Right) :-
	length(L, Length),
	Mid is Length//2,
	length(Left, Mid),
	append(Left, Right, L).

% merge(LinkeListe,RechteListe,Merged)
merge([],L,L).
merge(L,[],L).
merge([H1|T1],[H2|T2],[H1|L]) :-
    H1 =< H2,
    merge(T1, [H2|T2], L).
merge([H1|T1],[H2|T2],[H2|L]) :-
    H1 > H2,
    merge([H1|T1],T2,L).

mergesort([],[]).
% ein-elementige Liste damit split nicht auf [X] aufgerufen wird
mergesort([X],[X]).
mergesort(Liste, Sorted) :-
    split(Liste,Left,Right),
    mergesort(Left, LeftSorted),
    mergesort(Right, RightSorted),
    merge(LeftSorted, RightSorted, Sorted).
```
Test mit `mergesort([1,2,7,2,4,7,3,3,4],X).`
# Permute
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
Rückwärts-Durchlauf:
```prolog
?- permute(L, [0, 1, 3]).
```
	L = Liste
	ErstesElement=0
	Rest=[1,3]
```prolog
?-append(Liste1,[0|Liste2],L),
append(Liste1,Liste2,Liste3),
permute(Liste3, [1,3]).
```
	Liste1=[]
	Liste=Liste'=(0|Liste2)=L
```prolog
?-append([],Liste2,Liste3),
permute(Liste3,[1,3]).
```
	Liste2=Liste3
```prolog
?-permute(Liste2, [1,3])
```
	Liste2=[1|Rest]
	Rest=[3]
```prolog
?-permute(Liste3,[3])
```
	ErstesElement=3
	Rest=[]
```prolog
?-append([],[3|[]],Liste3),
append(,[],[]),
permute([],[]).
```
