%For all of these, especially the first two, see the examples in the book
%Ignore the Singleton variable warning, that goes away when you 
% define the rules. 

%europe map coloring problem -- use these colors as the domain
europe_color(Fr,Sw,It,Be,Ho,Ge,Au):- color(Fr), color(Sw), color(It), color(Be), color(Ho), color(Ge), color(Au), \+ Fr=Sw, \+ Fr=Be, \+ Fr=Ge, \+ Fr=It, \+ Be=Ge, \+ Be=Ho, \+ Ho=Ge, \+ It=Sw, \+ It=Au, \+ Sw=Au, \+ Sw=Ge, \+ Ge=Au. 



cryptarithmetic(C,R,O,S,A,D,N,G,E):-
    dig(S), dig(S),
    R is (S+S) mod 10, C1 is (S+S) // 10,
    dig(S), dig(D),
    E is (S+D+C1) mod 10, C10 is (S+D+C1) // 10,
    dig(O), dig(A),
    G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,
    dig(R), dig(O),
    N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,
    dig(C), C > 0, dig(R), R > 0,
    A is (C+R+C1000) mod 10, D is (C+R+C1000) // 10,
    uniq_digits(C,R,O,S,A,D,N,G,E).

uniq_digits(C,R,O,S,A,D,N,G,E):- 
    dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
    \+ C=R, \+ C=O, \+ C=S, \+ C=A, \+ C=D, \+ C=N, \+ C=G, \+ C=E,
            \+ R=O, \+ R=S, \+ R=A, \+ R=D, \+ R=N, \+ R=G, \+ R=E,
	            \+ O=S, \+ O=A, \+ O=D, \+ O=N, \+ O=G, \+ O=E,
		            \+ S=A, \+ S=D, \+ S=N, \+ S=G, \+ S=E,
			            \+ A=D, \+ A=N, \+ A=G, \+ A=E,
				            \+ D=N, \+ D=G, \+ D=E,
					            \+ N=G, \+ N=E,
						            \+ G=E.



%Persons are just their names, lower case
who_ordered_pizza(PizzaPerson):- uniq(Donna,Danny,Doreen,David),uniq(Steak,Lasagna,Chicken,Pizza),
				 uniq(Water,Coffee,Coke,Milk),across(Donna,Doreen),  %females sit across
				 across(Danny,David),  %males sit across
				 beside(Doreen,Steak), %doreen sits besides the male who ordered steak
				 across(Lasagna,Milk), %lasagna is always across milk
				 Donna=Water,           %dona only drinks water
				 Chicken=Coke,         %chicken comes with coke
				 \+ David=Coffee,    %david dont like coffee
				 \+ Danny=Steak,     %danny cant afford steak

                                 whichperson(Danny,Donna,David,Doreen,Pizza,PizzaPerson).

whichperson(Danny,Donna,David,Doreen,Pizza,PizzaPerson):- ordered(Pizza,Danny,'danny'),ordered(Pizza,Donna,'donna'),
                                                          ordered(Pizza,David,'david'),ordered(Pizza,Doreen,'doreen').

ordered(A,B,_):- \+ A=B.
ordered(B,B,PizzaPerson):- nl.


uniq(W,X,Y,Z):- people(W), people(X), people(Y), people(Z),
                      \+ W=X, \+ W=Y, \+ W=Z,
                              \+ X=Y, \+ X=Z,
                                      \+ Y=Z.

beside(A,B):- people(A), B is (A+1).
across(A,B):- people(A), B is (A+2).

people(1). people(2). people(3). people(4).