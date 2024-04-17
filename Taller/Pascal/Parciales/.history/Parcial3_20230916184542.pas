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

    arbol = ^nodoA;
    nodoA = record
        dato: compra;
        HI:arbol;  
        HD:arbol;
    end;
    
    
    lista = ^nodoL;
    nodoL = record
        dato:compra;
        sig:lista;
    end;

    comprasVector = array [sub_mes] of compra;


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
            a^.dato:=c;
            a^.HI:=nil;
            a^.HD:=nil;
        end
        else if (c.cliente <= a^.dato.cliente) then insertarEnArbol(a^.HI,c)
            else insertarEnArbol(a^.HD,c);
    end;

procedure cargarEstructuras(var a:arbol; var v:comprasVector);
    var
        c:compra;
    begin    
        leerCompra(c);
        while(c.cliente <> 0) do begin
            insertarEnArbol(a,c);
            insertarEnVector(v,c);
            leerCompra(c);
        end;
    end;

procedure cargarVector(var v:comprasVector);

begin
    
end;


procedure imprimirCompra(c:compra);
    begin
        writeLn('Codigo de juego: ',c.juego);
        writeLn('Compra realizada el ', c.dia,'/',c.mes);

    end;


procedure buscarCliente(a:arbol; cli:integer);
    begin
        if(a<>nil) then begin
            if(cli=a^.dato.cliente) then begin
                writeLn('---------------------------');
                imprimirCompra(a^.dato);
                
            end;
            buscarCliente(a^.HI,cli);
            buscarCliente(a^.HD,cli);
        end;
    end;


procedure imprimirCliente(a:arbol);
    var
        cli:integer;
    begin
        writeLn('Ingrese codigo de cliente a buscar:');
        ReadLn(cli);
        writeLn('Compras del cliente: ', cli);
        buscarCliente(a,cli);
    end;


var
    a:arbol;
    v:comprasVector;
begin
    a:=nil;
    //cargarEstructuras(a,v);
    //imprimirCliente(a);
end.