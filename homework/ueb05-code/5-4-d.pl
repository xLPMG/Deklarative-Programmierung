prim(N) :- not(divides(N, 2)).
divides(N,M) :- 
    M * M =< N,
    N mod M =:= 0;
    M * M =< N,
    M1 is M+1,
    divides(N,M1).
    
    
    