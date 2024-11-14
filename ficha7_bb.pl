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
maior(X, Y, R) :- (X > Y, R is X) ; (Y > X, R is Y).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: Lista, M, Resultado -> {V,}
maiorL([H], M, H) :- H is M.
maiorL([H|T], M, R) :- (H > M, maiorL(T, H, R)) ; (M > H, maiorL(T, M, R)).


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
mediaL(L, N, Soma, Media) :- somaL(L, Soma), size(L, N), Media is Soma / N.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% verificar se um numero é par
par(X) :- 0 is X mod 2.




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado impar: N -> {V,F}
impar(X) :- not(par(X)).

% Parte II--------------------------------------------------------- - - - - -



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: Elemento,Lista -> {V,F}

pertence( X,[X|L] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).

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

          
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagatudo: Elemento,Lista,Resultado -> {V,F}




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado adicionar: Elemento,Lista,Resultado -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concatenar: Lista1,Lista2,Resultado -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado inverter: Lista,Resultado -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sublista: SubLista,Lista -> {V,F}
