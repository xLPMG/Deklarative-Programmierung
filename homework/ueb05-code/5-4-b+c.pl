% Skalarprodukt
scalar_product([], [], 0).
scalar_product([H1|T1], [H2|T2], Res) :- 
    scalar_product(T1, T2, Res1),
    Res is Res1 + H1 * H2.

% Mit 0en auffüllen:
scalar_product(_V1, [], 0).
scalar_product([], _V2, 0).

% Skalarprodukt unausgewertet c), das 'is' ersetzt durch '='
scalar_product2([], [], 0).
scalar_product2([H1|T1], [H2|T2], Res) :- 
    scalar_product2(T1, T2, Res1),
    Res = Res1 + H1 * H2.

% Mit 0en auffüllen:
scalar_product2(_V1, [], 0).
scalar_product2([], _V2, 0).

test_sp2(V1, V2, P) :- scalar_product2(V1, V2, P1), P is P1.