{Una editorial vende libros de apoyo escolar para varias materias, codificadas de la siguiente forma: 
1)Historia; 2)Geografia; 3)Matematica; 4)Biologia; 5)Fisica; 6)Quimica y 7)Lengua. 
El catalogo de la editorial consta de 5000 libros con la siguiente informacion: codigo de 
libro (entre 1 y 5000), codigo de materia (entre 1 y 7), titulo, año de edicion, precio de la venta y
apellido del autor.
La editorial dispone de una estructura de datos con informacion de las ventas realizadas. 
De cada venta se conoce el codigo del libro, el DNI del cliente y el mes y el año de la venta.
Realizar un programa que:
1. Lea y almacene la informacion de todos los libros del catalogo de la editorial. Los libros son ingresados 
sin ningun orden particular.
2. Una vez leido y almacenado el catalogo de libros, procese la informacion de las ventas (que dispone la
editorial), calcule e informe:
A) Las dos materias con mayor cantidad de libros vendidos
B) Para las ventas a clientes con DNI sin digitos pares, en las cuales el libro vendido fue editado entre
los años 2011 y 2017, informar el año de la venta y el titulo del libro vendido.}
program chewsdayInnit;
const
    dimF=5000;
type
    catalogo=record;
        codigo:1..dimF;
        codMateria:1..7;
        titulo:string;
        edicion=integer;
        precio:real;
        autor:string;
    end;

    vectorCatalogo=array[1..dimF] of catalogo;
    vectorMaterias=array[1..7] of integer;

    ventas=record
        codigo:1..dimF;
        dniCli:longint;
        mes:1..12;
        anio:integer;
    end;

    lista=^nodo;
    nodo=record
        data:ventas;
        sig:lista;
    end;

{----------------MODULOS 1-----------------}
procedure leerCatalogo(var c:catalogo);
    begin
            readln(c.codigo);
            readln(c.codMateria);
            readln(c.titulo);
            readln(c.edicion);
            readln(c.precio);
            readln(c.autor);
    end;

procedure cargarVectorCatalogo(var vc:vectorCatalogo);
    var
        i:integer;
        c:catalogo;
    begin
        for i := 1 to dimF do begin
            leerCatalogo(c);
            vc[i]:=c;
        end;
    end;

{----------------MODULOS 2-----------------}
procedure leerCatalogo()    //se dispone
procedure agregarAdelante() //se dispone
procedure cargarLista()     //se dispone
{----------------MODULO A-----------------}
procedure procesarMaterias(L:lista; var vm:vectorMaterias);
    var
        i,max1,max2:integer;
        maxMat1,maxMat2:string;
    begin
        while (L <> nil) do begin
            vm[codmat]
            L:=L^.sig;
        end;
        max1:=0;
        for i:=1 to 7 do begin
            
        end;
    end;


{-----------PROGRAMA PRINCIPAL-------------}
var
    L:lista;
    vc:vectorCatalogo;
    vm:vectorMaterias;
begin
    l:=nil;
    cargarVectorCatalogo(vc);
    procesarMaterias(L,vm)
end.