Program parcial1;

type
    sub_dia= 1..31;
    envio=record
        cliente:integer;
        dia:sub_dia;
        codPostal:integer;
        peso:real;
    end;

    lista=^nodoL;
    nodoL=record
        dato:Envio;
        sig:lista;
    end;

    arbol=^nodoA;
    nodoA=record
        codPostal:integer;
        dato:lista;
        HI:arbol;
        HD:arbol;
    end;    


procedure leerEnvio(var e:envio);
    begin
        WriteLn('Peso: ');
        ReadLn(e.peso);
        if (e.peso <> 0) then begin
            e.cliente := random(100) + 1;
            e.codPostal := random(7500) + 1;
            e.dia :=random(31) + 1;
        end;
    end;

procedure agregarAdelante(var l:lista; e:envio);        
    var
        nue:lista;
    begin
        new(nue);    
        nue^.dato:= e;
        nue^.sig:= L;
        L:=nue;
    end;

procedure insertarEnArbol(var a:arbol; e:envio);
    var
        L:lista;
    begin
        if(a=nil) then begin
            //Inicializo en el arbol
            new(a); a^.dato^.dato:= e; a^.HI:=nil; a^.HD:=nil;
            //Agrego el primer nodo en la lista
            new(L); L^.dato:= e; L^.sig:=nil; a^.dato:=L;
        end
            else if (e.codPostal < a^.codPostal)  then insertarEnArbol(a^.HI,e)
                    else if (e.codPostal > a^.codPostal) then insertarEnArbol(a^.HD,e)
                        else agregarAdelante(a^.L,e);
    end;
    
procedure cargarArbol (var a:arbol);
    var
        e:envio;
    begin
        leerEnvio(e);
        while (e.peso <> 0) do begin
            insertarEnArbol(a,e);
            leerEnvio(e);
        end;
    end;



var
    a:arbol;

begin
    a:=nil;
    cargarArbol(a);
end.