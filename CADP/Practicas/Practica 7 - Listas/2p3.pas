{2p3
    Implementar un programa que contenga:
xa. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a
    aquellos alumnos que posean año de ingreso posterior al 2010. De cada alumno se lee legajo, DNI y año de ingreso.
    La estructura generada debe ser eficiente para la búsqueda por número de legajo. 
xb. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo
    legajo sea inferior a un valor ingresado como parámetro. 
c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo
    legajo esté comprendido entre dos valores que se reciben como parámetro. 
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.}
program Dospractica3;

type
    
    informacion=record
        legajo:integer;
        dni:longint;
        ingreso:integer;
    end;

    arbol=^nodo;

    nodo=record
        dato:informacion;
        hi:arbol;
        hd:arbol;
    end;
{Procedures-----------------------------------------------}


procedure GenerarArbol (var a: arbol);
    
    Procedure LeerInfo (var i:informacion);
        begin
            writeln('fecha de ingreso:');
            readln(i.ingreso);
            if (i.ingreso > 2010) then begin
                writeln('Ingrese Legajo:');
                readln(i.legajo);
                writeln('Ingrese dni:');
                readln(i.dni);
            end;
    end;

    Procedure InsertarElemento (var a: arbol; i: informacion);
        Begin
            if (a = nil)then begin
                new(a);
                a^.dato:= i; 
                a^.HI:= nil; 
                a^.HD:= nil;
            end
            else if (i.legajo < a^.dato.legajo)then 
                    InsertarElemento(a^.HI, i)
                else InsertarElemento(a^.HD, i); 
    End;

//supongamos que lee hasta que encuentre a un alumno del 2010
var 
    i: informacion;  
Begin
    a:= nil;
    LeerInfo(i);
    while (i.ingreso > 2010)do begin
        InsertarElemento (a, i);
        LeerInfo(i);
    end;
end;
{-------------------------------------------------------------------
Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo
    legajo sea inferior a un valor ingresado como parámetro.}
procedure Legajo1(var leg:integer);
    begin
        writeln('Ingrese legajo');
        readln(leg);
    end;
procedure LegajoInferior (a:arbol; leg:integer);
    begin
        if (a <> nil) then begin
            LegajoInferior(a,leg);
            LegajoInferior(a,leg);
            if(a^.dato.legajo < leg) then 
                    writeln('Dni :',a^.dato.dni,'. Legajo: ', a^.dato.ingreso);
        end;
    end;

{c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo
    legajo esté comprendido entre dos valores que se reciben como parámetro.}
proceduro legajo2
procedure LegajoComprendido (a:arbol; leg1,leg2:integer);
{Programa principal---------------------------------------}
var
    a:arbol;
    leg1:integer;
begin
    GenerarArbol(a);
    writeln();
    //Legajo1(leg1);
    //LegajoInferior(a,leg1);
    Legajo2(leg1,leg2);
end.