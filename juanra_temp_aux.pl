%:- include('juanra_temp.pl').
%
%horario([Asignatura,(Aula,Numero),Dia,Hora,Semestre,CedulaProfesor]).
:-dynamic horario/1.


reset():-
    (   retractall(clase(_,_,_,_,_,_))
    ->
    consult(juanra_temp)
    ;
    consult(juanra_temp)).
%reset3():-unload_file(juanra_temp).

%reset2():-[juanra_temp].
/*
verificaSemestreLsita([Curso|Resto]):-
    asignatura(),
    verificaSemestreLista(Resto).
*/

creaClaseAUX(Curso):-
    creaClase(Curso),
    clase(Curso,(_,_),_,_,Semestre,Profesor),
    creaClase(Curso,(_,_),_,_,Semestre,Profesor),
    creaClase(Curso,(_,_),_,_,Semestre,Profesor),
    creaClase(Curso,(_,_),_,_,Semestre,Profesor),
    creaClase(Curso,(_,_),_,_,Semestre,Profesor).

creaHorario(ListaCursos):-
    reset(),
    creaHorario2(ListaCursos).

creaHorario2([]):-
    (   (findall((Curso,(Dia,Hora),Aula,Numero,Semestre,Profesor),clase(Curso,(Dia,Hora),Aula,Numero,Semestre,Profesor),HorarioFinal),
    not(horario(HorarioFinal)))->
    asserta(horario(HorarioFinal))
    ;reset(),fail).

creaHorario2([Curso|RestoCursos]):-
    (   creaClaseAUX(Curso)
    ->  creaHorario2(RestoCursos)
    ;   reset(),fail).

