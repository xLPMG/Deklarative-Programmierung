% Wollen die 0 en in einer Liste zählen
count_zeros([],0).
count_zeros([0|T], N) :- count_zeros(T, N1), N is N1 + 1.
count_zeros([H|T], N) :- H =\= 0, count_zeros(T, N).
% count_zeros([0, 2, 3, 1, 0, 0, 9, 8, -3, 0, 1], N).

count_zeros_it(List,N) :- count_zeros_it(List,0,N).
count_zeros_it([],X,X).
count_zeros_it([0|T],X,N) :- X1 is X + 1, count_zeros_it(T, X1, N).
count_zeros_it([H|T],X,N) :- H \= 0, count_zeros_it(T, X, N).

% count_zeros_it([0, 2, 3, 1, 0, 0, 9, 8, -3, 0, 1], N).