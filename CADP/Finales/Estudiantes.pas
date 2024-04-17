{Un instituto inaugurado en el año 2013, debe almacenar informacion de sus 100 estudiantes que
actualmente se encuentran cursando. Para ello se ingresa: DNI, Apellido y nombres, localidad, 
telefono, año de ingreso (2013..2017) y fecha de la ultima cuota paga (mes y año).
Ademas el instituto dispone de una estructura con informacion de sus 7 cursos, de cada uno de
ellos se conoce: nombre del curso, nombre del docente y un listado de DNI de los alumnos inscriptos
(a lo sumo 20). 
Se solicita:
A) Leer y almacenar la informacion de los estudiantes
B) Generar una lista que contenga Apellido, nombres y telefono de los alumnos cuya ultima cuota paga
    es anterior a Abril de 2017
B.1) Calcular e informar la cantidad de alumnos que ingresaron por año
C) Desarrolle e implemente un modulo que reciba DNI de alumno e informe los nombres de los cursos
    a los que se encuentra inscripto}
program sCHEWdentsOfTheSilver;
Const
    dimF = 100;
    dimF2 = 7;
    dimF3 = 20;
{-----------------Ejercicio A--------------------------}
type
    estudiantes=record
        dni:longint;
        apellido:string;
        nombre:string;
        localidad:string;
        telefono:integer;
        YearIngreso:2013..2017;
        fechaCmonth:1..12;
        fechaCYear:2013..2017;
    end;

    vector =array[1..dimF] of estudiantes;   
    vector2=array[1..dimF2] of cursos;
    vector3=array[1..dimF3] of longint;

    vector4=array[2013..2017] of integer;

    cursos=record
        nombre:string;
        nombreDocente:string;
        aluCurso: vector3;
        end;

    registroLista=record;
        apellido:string;
        nombre:string;
        telefono:integer;
    end;

    lista=^nodo;
    nodo=record
        data:registroLista;
        sig:lista;
    end;

procedure leerEstudiantes(var e:estudiantes);
    begin
        writeln('Ingrese el DNI del estudiante: '); readln(e.dni);
        writeln('Ingrese el apellido: '); readln(e.apellido);
        writeln('Ingrese el nombre: '); readln(e.nombre);
        writeln('Ingrese la localidad: '); readln(e.localidad);
        writeln('Ingrese el telefono: '); readln(e.telefono);
        writeln('Año en el que ingreso: '); readln(e.anioIngreso);
        writeln('Mes de la ultima cuota paga: '); readln(e.fechaCmonth);
        writeln('Año de la ultima cuota paga: '); readln(e.fechaCYear);
    end;

procedure cargarVector(var v1:vector1);
    var
        i:integer;
        e: estudiantes;
    begin
        for i:= 1 to dimF do begin
            leerEstudiantes(e);
            v[i]:= e;
        end;
    end;

//procedure cargarVector2  //se dispone
//procedure leerCursos     //se dispone

{-----------------Ejercicio B--------------------------}
procedure agregarAdelante (var l:lista; e:estudiantes);
    var 
        nue:lista;
    begin
        new(nue); 
        nue^.data.apellido:=e.apellido;
        nue^.data.nombre:=e.nombre;
        nue^.data.telefono:=e.telefono;
        nue^.sig:=l;
        l:=nue;
    end;

procedure cargarLista(var l:lista;v1: vector1);
    var
        i:integer;
    begin
        for i:=1 to dimF do begin
            if (v1[i].fechaCmonth <= 4) and (v1[i].fechaCYear <= 2017) do begin
                agregarAdelante(l,v1)
            end;
        end;
    end;

{-----------------Ejercicio B.1------------------------}
procedure cargarV4(v1:vector1);
    var
        i:integer;
        v4:vector4;
    begin
        for i:=1 to dimF do begin
            v4[v1[i].YearIngreso]:=v4[v1[i].YearIngreso]+1
        end;
        for i:= 2013 to 2017 do begin
            writeln('En el año ',i,' hubo ',v4[i],' inscriptos.')
        end;
    end;

{-----------------Ejercicio C--------------------------}
//C) Desarrolle e implemente un modulo que reciba DNI de alumno e informe los nombres de los cursos
  //  a los que se encuentra inscripto
procedure BuscarDNI (v2:vector2);
    var
        i,z,dni:integer;
    begin
        writeln('Ingrese Dni de alumno a buscar: ');
        readln(dni);
        for i:= 1 to dimF2 do begin
            for z:= 1 to DimL do begin
                if (dni = v2[i].aluCurso[z]) then
                    writeln('El alumno con DNI ',dni,' esta inscripto a la clase ',v2[i].curso[z].nombre)
            end;
        end;
    end;

{-------------Programa Principal-----------------------}
var
    L:lista;
    v1:vector1;
    v2:vector2;
begin
    L:=nil;
    cargarVector(v1);
    //cargarVector2(v2) SE DISPONE
    cargarLista(L,v1);
    cargarVector(v1);
    cargarV4(v1);
    BuscarDNI(v2)
end.