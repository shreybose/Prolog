%yours
%Q1
mother(M,C):- child(C,M), female(M).

grand_parent(GP,GC):- parent(GP,Y), parent(Y,GC).

great_grand_mother(GGM,GGC):- parent(GGM,GP), female(GGM), parent(GP,Y), parent(Y,GGC).

%Q2
sibling(A,B):- child(A,Y), child(B,Y), A \= B.
brother(B,Sib):- child(B,Y), child(Sib,Y), B \= Sib, male(B).
sister(S,Sib):- child(S,Y), child(Sib,Y), S \= Sib, female(S).

%Q3 --
%You have to know both parents for both siblings for half_sibling
half_sibling(S1,S2):- sibling(S1,S2), mother(X1,S1), mother(X2,S2), father(Y1,S1), father(Y2,S2), (X1 \= X2; Y1 \= Y2).

full_sibling(S1,S2):- father(Y, S1), father(Y, S2), parent(X, S1), parent(X, S2), female(X),  S1 \= S2.

%Q4
first_cousin(C1,C2):- parent(X, Y1), parent(X, Y2), parent(Y1, C1), parent(Y2,C2), Y1 \= Y2, C1 \= C2.

second_cousin(C1,C2):- parent(Y,C1), parent(X, C2), first_cousin(Y,X).

%Q5
half_first_cousin(C1,C2):- parent(X,C1), parent(Y, C2), half_sibling(X,Y).

double_first_cousin(C1,C2):- child(Y2, GP), parent(GP,Y1), mother(Y1,C1), father(Y2, C2), C1 \= C2.

%Q6
first_cousin_twice_removed(C1,C2):- first_cousin(Y,C1), grand_parent(Y,C2); first_cousin(Y,C2), grand_parent(Y,C1).

%Q7
descendant(D,A):- child(D,A).
descendant(D,A):- child(D,X), descendant(X,A).

ancestor(A,D):- parent(A,D).
ancestor(A,D):- parent(A,X), ancestor(X,D).

%Q8
%this version of "cousin" does not handle "____ removed",
%read description carefully
cousin(X, Y):- parent(S,X), parent(P,Y), sibling(S,P).
cousin(X, Y):- parent(S,X), parent(P,Y), cousin(S,P).

%Q9
%do not return anything for closest_common_ancestor(X,X,A).
closest_common_ancestor(R1,R2,A):- ancestor(A,R1), ancestor(A,R2), \+ (child(C,A), ancestor(C,R1), ancestor(C,R2)), R1 \= R2.

% Q10 -- not scored, but will do
%   write_descendant_chain(jim,anna) and
%   write_descendant_chain(louise,gina) and
%   write_descendant_chain(emma,lily) <-this one shold print nothing
%   (make sure this does not fail (read the instructions carefully)).

write_child(X,Y):-
	write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X,Y):- parent(Y,X), write_child(X,Y).
write_descendant_chain(X,Y):- parent(A,X), descendant(A,Y), write_child(X,A), write_descendant_chain(A,Y).
