:- use_module(library(clpfd)).

% the base case for factorial
factorial(0, 1).

% the recursive rule for factorial
factorial(N, F) :-
    N #> 0,         % ensure N is greater than 0
    N1 #= N - 1,    % decrement N
    F #= N * F1,    % calculate F
    factorial(N1, F1).