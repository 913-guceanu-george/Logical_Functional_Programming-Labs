%sumaC(L - list, C - col number, S - result number)
%flow model (i, i, 0) (i, i, i)
sumaC([], C, C).
sumaC([H|T], C, R):-
    C1 is C+H,
    sumaC(T, C1, R).
sumaC([1,2,3], 0, 0).