% Permute(Liste,[Erstes|Element|Rest]) :-
%     append(Liste1,[ErstesElement|Liste2],Liste),
%     append(Liste1,Liste2,Lsite3),
%     permute(Liste1,Rest,Rest1).
%     
% permute([],[]). /* Abbruchbedingung */
% 
% append([],Liste,Liste).
% 
% append([ErstesElement|Rest],Liste,[ErstesElement|Liste1]) :-
%     append(Rest,Liste).

permute([],[]).
permute(Liste, [ErstesElement|Rest]) :-
    append(Liste1, [ErstesElement|Liste2], Liste),
    append(Liste1, Liste2, Liste3),
    permute(Liste3, Rest).

append([], Liste, Liste).
append([ErstesElement|Rest1], Liste, [ErstesElement|Liste1]) :-
    append(Rest1, Liste, Liste1).

% permute([1, 2, 3, 4, 5, 6], L2).