program parcial3;

type
    sub_dia = 1..31;
    sub_mes = 1..12;
    compra = record
        juego:integer;
        cliente:integer;
        dia:sub_dia;
        mes:sub_mes;
    end;    

    lista = ^nodoL;
    nodoL = record
        dato:compra;
        sig:lista;
    end;
    

    infoCompra=record
        info:compra;
        L:lista;
    end;    


    arbol = ^nodoA;
    nodoA = record
        dato: infoCompra;
        HI:arbol;  
        HD:arbol;
    end;
    
    
    

    comprasVector = array [sub_mes] of integer;


{---------------------------------------------------}

procedure leerCompra(var c:compra);
    begin
        writeLn('Cliente: ');
        ReadLn(c.cliente);
        if (c.cliente <> 0) then begin
            writeLn('Juego: ');
            c.juego:=random(1000) +1;
            writeLn(c.juego);
            writeLn('Dia:');
            c.dia:=random(31) +1;
            writeLn(c.dia);
            writeLn('Mes: ');
            c.mes:=random(12) +1;
            writeLn(c.mes);
        end;
    end;

procedure insertarEnArbol(var a:arbol; c:compra);
    begin
        if(a=nil) then begin
            new(a);
            a^.dato.info:=c;
            a^.HI:=nil;
            a^.HD:=nil;
        end
        else if (c.cliente <= a^.dato.info.cliente) then insertarEnArbol(a^.HI,c)
            else insertarEnArbol(a^.HD,c);
    end;


procedure cargarArbol(var a:arbol);
    var
        c:compra;
    begin    
        leerCompra(c);
        while(c.cliente <> 0) do begin
            insertarEnArbol(a,c);
            leerCompra(c);
        end;
    end;


procedure imprimirCompra(c:compra);
    begin
        writeLn('Codigo de juego: ',c.juego);
        writeLn('Compra realizada el ', c.dia,'/',c.mes);

    end;


procedure inicializarVector(var v:comprasVector);
    var
        i:integer;
    begin
        for i:= 1 to 12 do begin
            v[i]:=0;
        end;
    end;    


var
    a:arbol;
    v:comprasVector;
begin
    a:=nil;
    inicializarVector(v);
    cargarArbol(a);
    //imprimirCliente(a);
end.