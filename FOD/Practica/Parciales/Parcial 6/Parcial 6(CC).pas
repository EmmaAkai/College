program Parcial6;
const
    valoralto = 9999;
type

    partido = record
        codEquipo:integer;
        NombreEquipo:string;
        anio:integer;
        codTorneo:integer;
        codRival:integer;
        golesFavor:integer;
        golesContra:integer;
        puntos:integer;
    end;

    maestro = file of partido;

//ordenado por año, codigo de torneo y  codigo de equipo
procedure leer(var mae:maestro; var dato:partido);
    begin
        if (not eof(mae)) then
            read(mae,dato)
        else
            dato.anio:=valoralto;
    end;

procedure maximo(var max:integer; var nombreMax:string; puntos:integer; nombreActual: string);
    begin
        if(puntos > max) then begin
            max:= puntos;
            nombreMax:=nombreActual;
        end;
    end;

//ordenado por año, codigo de torneo y  codigo de equipo
procedure informe_cc(var mae:maestro);
    var
        p:partido
        anioActual, codTorneoActual, codEquipoActual: integer;
        cantGolesFavor,cantGolesContra:integer;
        ganados,empatador,perdidos:integer;
        nombreMax:string;
        max:integer;
    begin
        reset(mae);
        leer(mae,p);
        while(p.anio <> valoralto) do begin
            anioActual:=p.anio;
            writeln('Año: ',anioActual);
            while(p.anio = anioActual) do begin
                codTorneoActual:=p.codTorneo;
                max:=-1; //Para guardar el max
                nombreMax:='';// y saber cual fue el campeon
                writeln('cod_torneo: ',codTorneoActual);
                while(p.anio = anioActual) and (p.codTorneo = codTorneoActual) do begin
                    codEquipoActual:=p.codEquipo;
                    writeln('cod_equipo: ',codEquipoActual,' nombre: ',p.NombreEquipo);
                    cantGolesFavor:=0;
                    cantGolesContra:=0;
                    nombreActual:= p.NombreEquipo;
                    while(p.anio = anioActual) and (p.codTorneo = codTorneoActual) and (p.codEquipo = codEquipoActual) do begin
                        cantGolesFavor:=cantGolesFavor + p.golesFavor;
                        cantGolesContra:=cantGolesContra + p.golesContra;
                        case p.puntos of
                            3: ganados:=ganados + 1;
                            1: empatador:=empatador + 1;
                            0: perdidos:=perdidos + 1;
                        end;
                        leer(mae,p);
                    end;
                    //INFORMAR CONTADORES
                    writeln('Goles a favor del equipo ', nombreActual,': ', cantGolesFavor);
                    writeln('Goles en contra del equipo ', nombreActual,': ' cantGolesContra);
                    writeln('Diferencia de goles del equipo ',nombreActual,': ',cantGolesFavor - cantGolesContra);
                    writeln('Cantidad de partidos ganados equipo ', nombreActual,': ',ganados);
                    writeln('Cantidad de partidos empatados equipo ', nombreActual,': ',empatados);
                    writeln('Cantidad de partidos perdidos equipo ', nombreActual,': ',perdidos);
                    writeln('Cantidad total de puntos en el torneo ',nombreActual,' del equipo  ',codEquipoActual,': ',(ganados*3) + empatados);
                    writeln('------------------------------------------------------------------------');
                    maximo(max,nombreMax,((ganados*3) + empatados),nombreActual);
                end;
                writeln('El equipo ',nombreMax,' fue el campeon del torneo ',codTorneoActual,' del año ',anioActual)
                
            end;
        end;
        close(mae);
    end;