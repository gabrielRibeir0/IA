%LICENCIATURA EM ENGENHARIA INFORMATICA
%MESTRADO integrado EM ENGENHARIA INFORMATICA

%Inteligencia Artificial
%2024/25

%Draft Ficha 7


% Parte I
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes aritmeticas

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Z,Soma -> {V,F}

soma( X,Y,Z,Soma ) :-
    Soma is X+Y+Z.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado somaL: L ,Soma -> {V,F}
somaL([], 0).
somaL([H|T], Soma) :- somaL(T, Soma1), Soma is Soma1 + H.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: X,Y,R -> {V,F}
maior(X, Y, R) :- (X >= Y, R is X) ; (Y > X, R is Y).

%ou
maior(X, Y, X) :- X >= Y.
maior(X, Y, Y).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: Lista, M, Resultado -> {V,}
maiorAux([H|T], M, R) :- H > M, maiorAux(T, H, R).
maiorAux([H|T], M, R) :- H =< M, maiorAux(T, M, R).
maiorAux([], M, M).

maiorL([H|T], R) :- maiorAux(T, H, R).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Quantidade de elementos de uma lista.
size([], 0).
size([H|T], N) :- size(T, N1), N is N1 + 1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Tamanho de uma Lista
%size([], 0).
%size([H|T], N) :- size(T, N1), N is N1 + 1.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Média aritmética de uma lista : Lista, N_Elementos, Soma -> {V,F}
mediaL(L, Media) :- somaL(L, Soma), size(L, N), Media is Soma / N.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% verificar se um numero é par
par(X) :- 0 is X mod 2.

%ou
par(0).
par(X) :- N is X - 2, N >= 0, par(N).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado impar: N -> {V,F}
impar(X) :- \+ par(X).

%ou
impar(1).
impar(X) :- N is X - 2, N >= 1, impar(N).

%ou
impar(X) :- 1 is X mod 2.

%ou
impar(X) :- par(X+1).
% Parte II--------------------------------------------------------- - - - - -



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: Elemento,Lista -> {V,F}

pertence( X,[X|L] ).
pertence( X,[Y|L] ) :- pertence( X,L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: Lista,Comprimento -> {V,F}
comprimento([], 0).
comprimento([H|L], S) :-
    comprimento(L, N),
    S is N+1.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado diferentes: Lista,Comprimento -> {V,F}
diferentes([], 0).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagar: Elemento,Lista,Resultado -> {V,F}
apagar(X, [X|T], T).
apagar(X, [Y|T], [Y|L]) :- X \= Y, apagar(X, T, L).

          
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagatudo: Elemento,Lista,Resultado -> {V,F}
apagatudo(X, [], []).
apagatudo(X, [X|T], L) :- apagatudo(X, T, L).
apagatudo(X, [Y|T], [Y|L]) :- X \= Y, apagatudo(X, T, L).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado adicionar: Elemento,Lista,Resultado -> {V,F}
adicionar(X, L, L) :- pertence(X, L).
adicionar(X, L, [X|L]) :- \+ pertence(X, L).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concatenar: Lista1,Lista2,Resultado -> {V,F}
concatenar([], L, L).
concatenar([H|T], L, [H|R]) :- concatenar(T, L, R).

%lista2 + lista1
%concatenar([], [], R).
%concatenar(L, [H|T], [H|R]) :- concatenar(L, T, R).
%concatenar([H|T], [], [H|R]) :- concatenar(T, [], R).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado inverter: Lista,Resultado -> {V,F}
inverter([], []).
inverter([X|R], NL) :- inverter(R, L), concatenar(L, [X], NL).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sublista: SubLista,Lista -> {V,F}
sublista(S, L) :- concatenar(L1, L3, L), concatenar(S, L2, L3).
