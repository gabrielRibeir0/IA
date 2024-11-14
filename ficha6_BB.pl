
%LICENCIATURA EM ENGENHARIA INFORMÁTICA
%MESTRADO integrado EM ENGENHARIA INFORMÁTICA

%Inteligência Artificial
%2024/25

%Draft Ficha 6


% Extens    ao do predicado filho: Filho,Pai -> {V,F}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

pai(paulo, filipe).
pai(paulo, maria).

avo(antonio, nadia).
avo(ana, nuno).

sexo(joao, masculino).
sexo(jose, masculino).
sexo(maria, feminino).
sexo(joana, feminino).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :- filho( F,P ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}

avo( A,N ) :- pai( A,X ), filho(N,X).

avo(A,N) :- descendente(N,A,2).


% Extensao do predicado neto: Neto,Avo -> {V,F}
neto(N,A) :- avo(A,N).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}

bisavo(BA, BN) :- pai( BA,X ), pai( X,Y ), pai( Y,BN ).
bisavo(BA, BN) :- descendente(BN,BA,3).


trisavo(TA, TN) :- descendente(TN,TA,4).

tetraneto(TN, TA) :- descendente(TN,TA,5).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente( D, A ) :- filho( D,A ).
descendente( D,A ) :- filho( D,X ), descendente( X,A ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}
descendente( D,A,1 ) :- filho( D,A ).
descendente( D,A,G ) :- filho( D,X ), descendente( X,A,N ), G is N+1.