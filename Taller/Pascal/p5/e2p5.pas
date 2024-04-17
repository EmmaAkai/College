{Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.}
program e2p5;

type
    fab=2010..2018;

    auto=record
        patente:integer;
        fabricacion:fab;
        marca:string;
        modelo:string;
    end;

    arbol= ^nodo;
    nodo=record
        data:auto;
        HI:arbol;
        HD:arbol;
    end;


procedure LeerAuto(var a:auto);
    begin
        writeln('Patente:');
        readln(a.patente);
        if (a.patente <> -1) then begin
            writeln('Fabricacion:');
            readln(a.fabricacion);
            writeln('Marca: ');
            readln(a.marca);
            writeln('Modelo:');
            readln(a.modelo);
        end;
    end;

procedure CrearArbol (var a:arbol; at:auto);
    begin
        if (a=nil) then begin
            new(a); a^.data:=at; a^.HI:=nil; a^.HD:=nil;
        end
        else if (at.patente < a^.data.patente) then CrearArbol(a^.HI,at)
                else CrearArbol(a^.HD,at); 
    end;

procedure cargarArbol (var a:arbol);
    var
        at:auto;
    begin
        LeerAuto(at);
        while (at.patente <> -1) do begin
            CrearArbol(a,at);
            LeerAuto(at);
        end;
    end;

procedure imprimirArbol(a:arbol);
    begin 
        if (a<>nil) then begin
            writeln(a^.data.patente);
            imprimirArbol(a^.HI);
            imprimirArbol(a^.HD);
        end;
    end;


var
    a:arbol;
begin
    a:=nil;
    cargarArbol(a);
    imprimirArbol(a);
end.