isPrime(N,D):-
    D>N/2,!.
isPrime(N,D):-
    N mod D =\= 0,!,
    D1 is D+1,
    isPrime(N, D1).
isPrime(N):-
    N>1,
    isPrime(N,2).


sumPrime(S, S, [S]):-
    isPrime(S).
sumPrime(S, P, [P|R]):-
    S>P,
    isPrime(P),
    S1 is S-P,
    P1 is P+1,
    sumPrime(S1, P1, R).

sumPrime(S, P, R):-
    S>P,
    isPrime(P),
    P1 is P+1,
    sumPrime(S, P1, R).

sumPrime(S,P,R):-
    S>P,
    not(isPrime(P)),
    P1 is P+1,
    sumPrime(S, P1, R).

sumPrime(S,R):-
    sumPrime(S,2,R).