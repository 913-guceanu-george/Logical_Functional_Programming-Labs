% nrOcc ( L - list, E - elem we want to remove, C - collector, R - result )
%flow model (i, i, i, o) (i, i, o, o)
nrOcc([],_,C,C).
nrOcc([H|T], E, C, R):-
    H=:=E,
    C1 is C+1,
    nrOcc(T, E, C1, R).

nrOcc([H|T], E, C, R):-
    nrOcc(T, E, C, R).

nrOccMain(L, E, C):-
    nrOcc(L,E,0,C).

% removeDuplicates ( L- list, LB - backup list, LL - output list (collector), R - result )
% flow model (i, i, o, o) (i, i, i, 0)
removeDuplicates([], _, []).
removeDuplicates([H|T], LB,R):-
    nrOccMain(LB, H, S),
    S =:= 1,
    removeDuplicates(T, LB, R1),
    R = [H|R1].

removeDuplicates([H|T], LB, R):-
    nrOccMain(LB, H, S),
    S =:= 1,
    removeDuplicates(T, LB,R).

removeMain(L, R):-
	removeDuplicates(L, L, R).