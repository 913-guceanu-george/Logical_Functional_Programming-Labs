% isPrime(N - number, D - divisor)
% flow model(i, i) -> o
% Math:
%   isPrime(N, D) = {
%   1. true, if D>N/2
%   2. false otherwise.
% }
isPrime(N,D):-
    D>N/2,!.
isPrime(N,D):-
    N mod D =\= 0,!,
    D1 is D+1,
    isPrime(N, D1).
isPrime(N):-
    N>1,
    isPrime(N,2).

extractPrimes([], []).

extractPrimes([H|T], [H1|T1], R):-
    isPrime(H),
    extractPrimes(T, [H,H1| T1],R).

extractPrimes([H|T], [H1|T1],R):-
    not(isPrime(H)),
    extractPrimes(T, [H1|T1],R).

extract([H|T], R):-
    extractPrimes([H|T], [], R).