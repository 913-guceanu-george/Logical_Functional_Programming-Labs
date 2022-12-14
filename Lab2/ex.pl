
% This file consists of a few self contained examples which can be
% extracted and run in separate files if needed

% ----------------------------------------------------------------

% Create a predicate that calculates
% the sum of digits of an integer number

% Mathematical model:
%                 0                           , if N == 0
% sumDigits(N) = (N % 10) + sumDigits(N // 10), otherwise
% (N // 10 represents integer division)
%
% We will use an extra parameter to retain the result:
% sumDigits(N, Result)
% N - input parameter, the integer whose digits will be summed
% Result - output parameter, where the sum will be stored

sumDigits(N, Result) :- N =:= 0,
    Result is 0.
% equivalent and simplified expression for the above is
% sumDigits(0, 0).
% in the case of an input parameter, such as N for our problem, N should
% be bound to a value when the predicate is called, thus the first
% parameter of the call sumDigits(0, 0) will be matched if N is bound to
% the value 0, effectively acting as a condition check (if N == 0)
%
% in the case of an output parameter, like Result in our case, Result
% will be bound to a value when a base case is reached (the stop
% condition of the recursive model has been met), thus the second
% parameter of the call sumDigits(0, 0) will not act as a condition
% check, but rather as an assignment (Result = 0), since R would not be
% bound to another value at the time

sumDigits(N, Result) :- N =\= 0,
    N1 is N // 10,
    sumDigits(N1, Result1),
    Result is Result1 + N mod 10.


%-------------------------------------------------------------------

% Create a redicate that counts the number of occurences of a given
% element X in a list L

% Mathematical model:
%                       0                   , if n = 0
% count(L1,...,Ln, X) = 1 + count(L2,...,Ln), if L1 == X
%                       count(L2,...,Ln)    , otherwise
% We will use an extra parameter to retain the result:
% count(L, X, Result)
% L - input parameter, the list in which we will count the number of
% occurrences
% X - input parameter, the element whose occurrences will be counted
% Result - output parameter, where the count will be stored
%

% this predicate should be equivalent to the base case of the recursion
count([], _, 0).

% the syntax [H|T] is splitting a list such that
% H = L1, and T = L2, L3, ..., Ln
count([H|T], X, Result) :-
    H =:= X,
    count(T, X, Result1),
    Result is Result1 + 1. % after the solution for the smaller case has been found, we can update the solution to the current case; effectively equivalent to the 1 + count(L2,...,Ln) call from the mathematical model

count([H|T], X, Result) :-
    H =\= X,
    count(T, X, Result).

%-------------------------------------------------------------------

% Create a predicate that merges two sorted lists in ascending order.
% Check if the provided lists are correctly sorted.
%
% Mathematical model:
%                           true, n = 0 or n = 1
% checkSort(L1,L2,...,Ln) = false, L1 > L2
%                           checkSort(L2,...,Ln), otherwise
% checksort(L)
% L - input parameter, a list for which we will test if its elements are
% in ascending order

checkSort([]). %this matches an empty list []
checkSort([_]). % the _ character means that an element must be present, however we do not intend to use that element so we do not need to bind a variable to it
checkSort([H1,H2|_]):- H1 > H2, false.
checkSort([H1,H2|T]):- H1 =< H2, checkSort([H2|T]).

% we will use a simple wrapper predicate that will check if the lists
% are sorted before calling the predicate that will do the merge
%
% mathematical model
% mergeLists(L1, L2, Result) = mergeListsAux(L1, L2, Result) if
% checkSort(L1) and checkSort(L2)
% L1, L2 are both input parameters, the lists to be merged
% Result is an output parameter that will hold the merged list
mergeLists(L1, L2, Result) :- checkSort(L1), checkSort(L2), mergeListsAux(L1, L2, Result).

% mathematical model
%                                           L2, if n = 0
% mergeListsAux(L11,...,L1n, L21,...,L2m) = L1, if m = 0
%                                           [L11] +
%                                           mergeListsAux(L12...,L1n,
%                                           L21,...,L2m), if L11 < L21
%                                           [L21] +
%                                           mergeListsAux(L11...,L1n,
%                                           L22,...,L2m), otherwise
%
% mergeListsAux(L1, L2, Result)
% L1, L2 are both input parameters, the lists to be merged
% Result is an output parameter that will hold the merged list


mergeListsAux([], L2, L2).
mergeListsAux(L1, [], L1).
mergeListsAux([H1|T1], [H2|T2], [H1|T3]) :- H1 < H2, mergeListsAux(T1, [H2|T2], T3).
mergeListsAux([H1|T1], [H2|T2], [H2|T3]) :- H1 >= H2, mergeListsAux([H1|T1], T2, T3).
