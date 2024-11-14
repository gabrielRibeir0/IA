a1(X, Y) :- b(X), c(Y).
a2(X, Y) :- b(X), !, c(Y).
a3(X, Y) :- b(X), c(Y), !.
b(1).
b(2).
b(3).
c(1).
c(2).
c(3).

a.
b.
c:-fail. /* origina uma falha */
d.

factorial(0,1):-!.
factorial(N,F):-N1 is N-1,factorial(N1,F1),F is N*F1.

f(a,1).
f(a,2).
f(a,2).
f(z,6).
f(z,5).
f(x,4).
f(x,3).