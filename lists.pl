%consider pattern matching and head-tail notation for these

list([],0). %handling empty list with no elements
list([H|T],Y):- list(T,K), Y is K+1.
exactly3(L):- lists(L), L=[A,B,C].

at_least_3(L):- list(L,A), A >= 3.

at_most_3(L):- list(L,A), A =< 3.


intersect(L1,L2):- member(A,L1), member(A,L2).