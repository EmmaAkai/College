{La facultad de informatica organizara el congreso WICC, en donde se expondran trabajos de investigacion. 
Realizar un programa que lea la informacion de cada publicacion: titulo, autor, dni y tipo de 
publicacion(1..12). La lectura de publicaciones finaliza al ingresar el dni 0(No debe procesarse), La
informacion se lee ordenada por dni, y el autor puede tener varias obras.
    Se pide escribir un programa que:
        a. Informe el tipo de publicacion con mayor cantidad de publicaciones.
        b. informar para cada autor la cantidad de publicaciones presentadas }
program
type
    informacion=record
        titulo:string; 
        autor:string;
        dni:longint;
        tipo:1..12;
    end;

    lista= ^nodo;
    nodo= record
        dato:informacion;
        sig:lista;
    end;

    CantidadPubli=array [1..12] of integer;

procedure LeerRegistro(var i:informacion);
    begin
        writeln('ingrese dni');
        readln(i.dni);
        if(i.dni<>0)  then begin
            writeln('titulo');
            readln(i.titulo);
            writeln('autor');
            readln(i.autor);
            writeln('tipo');
            readln(i.tipo);
        end;
    end;

procedure AgregarAdelante(var L:lista; i:informacion);
    var
        nue:lista;
    begin
        new(nue);
        nue^.data:=i;
        nue^.sig:=L;
        L:=nue;
    end;

procedure CargarLista(var L:lista);
    var
        i:informacion;
    begin
        LeerRegistro(i);
        While(i.dni<>0) do begin
            AgregarAdelante(L,i);
            LeerRegistro(i);
        end;
    end;

procedure ProcesarInfo(L: lista);
    var
        cp:CantidadPubli;
        i,max,tipoMax,PubTotales:integer;
        dniact:longint;
    begin
        max:=0; PubTotales:=0;
        for i:=1 to 12 do 
                cp[i]:=0
        while (L <> nil) do begin
            dniact:=l^.dato.dni;
            while(L<>nil) and (dniact=l^.dato.dni) do begin
                cp[L^.Dato.Tipo]:=cp[L^.Dato.Tipo]+1;
                PubTotales:=PubTotales+1;
                l:=l-sig;
            end;
            writeln('Cant de pub por autor: ',PubTotales);
        end;

        for i:=1 to 12 do begin
            if(max > cp[i]) then begin
                    max:=cp[i];
                    tipoMax:=i;
            end;
        end;
        
        writeln('El tipo de obra con mas titulos vendidos es: ', tipoMax);
    end;


{PROGRAMA PRINCIPAL}
var
    L:lista;
begin
    L:=nil;
    CargarLista(L);
    ProcesarInfo(L);

end.