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
            WriteLn('Cliente: ',e.cliente);
            e.codPostal := random(7500) + 1;
            WriteLn('Codigo postal: ',e.codPostal);
            e.dia :=random(31) + 1;
            WriteLn('Dia: ',e.dia);
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
    begin
        if(a=nil) then begin
            //Inicializo en el arbol
            
            new(a);
            a^.codPostal:= e.codPostal; //ERROR ACA LPMM
            a^.HI:=nil;
            a^.HD:=nil;
            
            
            a^.dato:=nil;
            agregarAdelante(a^.dato,e);

        end
            else if (e.codPostal < a^.codPostal)  then insertarEnArbol(a^.HI,e)
                    else if (e.codPostal > a^.codPostal) then insertarEnArbol(a^.HD,e)
                        else agregarAdelante(a^.dato,e);
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


procedure imprimirLista(L:lista);
    var
        aux:integer;
    begin
        writeLn('Ingrese codigo postal a buscar: ');
        ReadLn(aux);
        
        while (L <> nil) do begin
            if(aux = L^.dato.codPostal) then begin
                writeLn('------Codigo Postal: ',L^.dato.codPostal,'--------------------------------');
                writeLn('Cliente: ', L^.dato.cliente);
                writeLn('Dia: ', L^.dato.dia);
                writeLn('Peso: ', L^.dato.peso:2:2);
            end;    
            L := L^.sig;

        end;
    end;
    

procedure imprimirArbol(a:arbol);
    begin
        if (a<>nil) then begin
            imprimirLista(a^.dato);
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