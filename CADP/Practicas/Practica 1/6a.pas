{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).
}
program ejercicio6;
type
    alumno=record
        legajo:integer;
        promedio:real; 
    end;
procedure leerAlumno(var a:alumno);
begin
    with a do begin
        writeln('Introduce el legajo del alumno');
        readln(a.legajo);
        if (a.legajo<>-1)then begin
            writeln('Introduce el promedio del alumno');
            readln(a.promedio);
            end;  
    end;      
end;

var
    alu:alumno;
    cantAlu,cantAluProm6,cantAluProm8:integer;
    porcentajeAlu8:real;
begin
    leerAlumno(alu);
    cantAlu:=0;
    cantAluProm6:=0;
    cantAluProm8:=0;
    while(alu.legajo<>-1)do begin    
        if(alu.promedio>6.5)then
            CantAluProm6:=CantAluProm6+1;
        if(alu.promedio>8.5) and (alu.legajo<2500)then
            cantAluProm8:=cantAluProm8+1;      
        cantAlu:=cantAlu+1;
        leerAlumno(alu);
    end;
    writeln('Cantidad de alumnos: ',cantAlu);
    writeln('Cantidad de alumnos con nota mayor a 6.5: ',CantAluProm6);
    writeln('Porcentaje de alumnos con promedio mayor a 8.5: %',(cantAluProm8*100)/cantAlu:2:2);
end.
