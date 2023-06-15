% Wir wollen die Liste der ersten n Zahlen
n_list(0, []).
n_list(N, [N|T]) :- N > 0, N1 is N - 1, n_list(N1, T).
% n_list(6, L).
% N1 is N - 1 bedeutet is(N-1,Erg), N1 = Erg, 


n_list2(0, []).
n_list2(N, List) :- N > 0, n_list2(1, List, N).
n_list2(Max, [Max], Max). % Abbruchbedingung, fügt die Einelementige Liste mit N zurück
n_list2(It, [It|T], Max) :- It < Max, It1 is It+1, n_list2(It1, T, Max).