%LICENCIATURA EM ENGENHARIA INFORMATICA
%MESTRADO integrado EM ENGENHARIA INFORMATICA

%Inteligencia Artificial
%2024/25

%Draft Ficha 8 Exercicio 1

%auxiliares para listas
concatenar([], L, L).
concatenar([H|T], L, [H|R]) :- concatenar(T, L, R).

somaL([], 0).
somaL([H|T], Soma) :- somaL(T, Soma1), Soma is Soma1 + H.

size([], 0).
size([H|T], N) :- size(T, N1), N is N1 + 1.

mediaL(L, Media) :- somaL(L, Soma), size(L, N), Media is Soma / N.

aluno(1,joao,m).
aluno(2,antonio,m).
aluno(3,carlos,m).
aluno(4,luisa,f).
aluno(5,maria,f).
aluno(6,isabel,f).

curso(1,lei).
curso(2,miei).
curso(3,lcc).

%disciplina(cod,sigla,ano,curso)
disciplina(1,ed,2,1).
disciplina(2,ia,3,1).
disciplina(3,fp,1,2).

%inscrito(aluno,disciplina)
inscrito(1,1).
inscrito(1,2).
inscrito(5,3).
inscrito(5,5).
inscrito(2,5).

%nota(aluno,disciplina,nota)
nota(1,1,15).
nota(1,2,16).
nota(1,5,20).
nota(2,5,10).
nota(3,5,8).

%copia
copia(1,2).
copia(2,3).
copia(3,4).

%1 alunos que não estão inscritos a nenhuma disciplina
alunoNaoInscrito(Aluno) :- aluno(Num, Aluno,_), not(inscrito(Num,_)).
naoInscritos(L) :- findall(Aluno, alunoNaoInscrito(Aluno), L).

%2 Quais os alunos que não estão inscritos em qualquer disciplina, assumindo que
%um aluno inscrito numa disciplina que não existe não está inscrito;

alunoComDisciplinaInexistente(Aluno) :- aluno(Num, Aluno, _), inscrito(Num, Disc), not(disciplina(Disc, _, _, _)).
naoInscritos2(L) :- naoInscritos(L1), findall(Aluno, alunoComDisciplinaInexistente(Aluno), L2), concatenar(L1, L2, L).

%3 Qual a média de um determinado aluno;
mediaAluno(Aluno, Media) :- aluno(Num, Aluno, _), nota(Num, _, _), findall(Nota, nota(Num, _, Nota), Notas), mediaL(Notas, Media).

%4 Quais os alunos cuja média é acima da média (considere todas as notas de todas as disciplinas);

lista_acima_media(M, R) :- findall(Aluno, (mediaAluno(Aluno, MediaA), MediaA > M), R).
acimamedia(Aluno) :- findall(N, nota(_,_,N), L), mediaL(L,M), lista_acima_media(M, Aluno).

mediaGeral(Media) :- findall(Nota, nota(_, _, Nota), Notas), mediaL(Notas, Media).
mediaAcimaDaMedia(L) :- mediaGeral(Media), findall(Aluno, (mediaAluno(Aluno, MediaAluno), MediaAluno > Media), L).

%5 Quais os nomes dos alunos que copiaram
copiaram(L) :- findall(NomeAluno, (copia(_, NumAluno), aluno(NumAluno, NomeAluno, _)), L).

%6 Quais os alunos que copiaram (diretamente ou indiretamente) por um dado aluno;
copiou(X, Y) :- copia(X, Y).
copiou(X, Y) :- copia(Y, X), copiou(X, A).

copiaIndireta(Aluno, Copiou) :- copiou(Aluno, Copiou).