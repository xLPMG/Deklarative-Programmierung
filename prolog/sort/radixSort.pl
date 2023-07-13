digit_at(Pos, X, Y) :-
	Num is X mod (10**Pos),
    Y is (Num - (X mod (10**(Pos-1))))//(10**(Pos-1)).

sort_by_pos(Input, Pos, Output):-
    map_list_to_pairs(digit_at(Pos), Input, Zwischen),
    keysort(Zwischen, Sorted),
    pairs_values(Sorted, Output).

radixsort_loop(Input, D, D, Output) :-
    sort_by_pos(Input, D, Output).
radixsort_loop(Input, I, D, Output) :-
    I < D,
    sort_by_pos(Input, I, Zwischen),
    I1 is I + 1,
    radixsort_loop(Zwischen, I1, D, Output).

digits(0,0).
digits(Zahl, D) :-
    Zahl1 is Zahl // 10,
    digits(Zahl1, D1),
    D is D1 + 1.

digits_list([],D,D).
digits_list([H|Rest], D, DNeu) :-
    digits(H, D1),
    (D1 > D -> DNeu1 = D1 ; D1 =< D -> DNeu1 = D),
    digits_list(Rest, DNeu1, DNeu).
    

radixsort(Input, Output) :-
    digits_list(Input, 0, D),
    radixsort_loop(Input, 1, D, Output).
