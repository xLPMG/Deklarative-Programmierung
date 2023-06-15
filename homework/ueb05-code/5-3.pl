% .(X, []) veraltet, daher nutzen wir Head + taail darstellung
% [X|[]] ist die einelementige Liste [X]
% equivalent zu (cons X '())

list(L, X) :- L = [X|[]].
list_pruefen([]).
list_pruefen([_H|T]) :- list_pruefen(T).
% L = [1,[2,3]|[4,5],6]
% korrigiert: [1,[2,3]|[[4,5],6]]
% Begründung, Rest muss immer liste sein!

% b)
% [[1,2|[3]]|[4,5]]
list2(L) :- L = [[1,2|[3]]|[4,5]].
% [[1,2,3], 4, 5]

% c)
list3(L) :- L = [[1|[2|[3|[]]]]|[4|[5|[]]]].