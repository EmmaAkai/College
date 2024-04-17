{Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:
a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.
i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). = array
De cada final rendido se lee el código del alumno, el
código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
nota -1.
 La estructura debe ser eficiente para buscar por código de alumno.
ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).
b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.
c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.}

program e2p4;
const 
    materias=30;
type

DatosAlumno=record
    codigoAlumno=integer;
    Materias=VecMaterias;
end;

final=record
    Alumno:DatosAlumno;
    codigoMateria:integer;
    nota:materias;
end

    VecMaterias = array [1..materias] of real; // codigo de la materia = pos en v

procedure leerFinal(var f:final);
begin
    writeln('Ingrese la nota del alumno');
    readln(f.nota);
    if (f.nota<> -1) then begin
        writeln('Ingrese el codigo de alumno');
        readln(f.Alumno.codigoAlumno);
        writeln('Ingrese el codigo de la materia');
        readln(f.codigoMateria); 
    end;
end;


procedure crearArbol (var a:arbol; f:final);
begin
    if(a=nil) then begin
        new(a);
        a^.dato:=f;
        a^.HI:=nil;
        a^.HD:=nil;
    end;
    else
        if(f.codigoAlumno<a^.dato.codigoAlumno) then crearArbol(a^.HI,f)
        else crearArbol(a^.HD,f);
    end;  
end;

procedure cargarArbol (var a:arbol)
var
    f:final;
begin
    leerFinal(f);
    while(f.nota<>-1) do begin
        crearArbol(a,f);
        leerFinal(f);

    end;
end;

procedure EnOrden(a:arbol);
begin
    if(a<>nil)then begin
      EnOrden(a);
      if (a)
      EnOrden(a);
    end;  
end;


var

begin
    
end.