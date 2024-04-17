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

procedure agregarAdelante(var L:lista; c:compra);
    var
        nuevo:lista;
    begin
        new(nuevo);
        nuevo^.dato:=c;
        nuevo^.sig:=L;
        L:=nuevo;
    end;

procedure insertarEnArbol(var a:arbol; c:compra);
    begin
        if(a=nil) then begin
            new(a);
            a^.HI:=nil;
            a^.HD:=nil;

            a^.dato.L:=nil;
            agregarAdelante(a^.dato.L,c)
        end
        else if (c.cliente < a^.dato.info.cliente) then insertarEnArbol(a^.HI,c)
            else if (c.cliente > a^.dato.info.cliente) then insertarEnArbol(a^.HD,c)
                else agregarAdelante(a^.dato.L,c);
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


procedure imprimirLista(L:lista);
    begin
        while(L <> nil) do begin
            writeLn('Codigo de juego: ',L^.dato.juego);
            writeLn('Compra realizada el ', L^.dato.dia,'/',L^.dato.mes);
            l:=l^.sig;
        end;
    end;

procedure imprimir (a:arbol; cli:integer;var ok:boolean);
    begin
        if (a <> nil) then begin
            if (a^.dato.info.cliente = cli) then begin
                imprimirLista(a^.dato.L);
                ok:=true
            end;
            imprimir(a^.HI,cli,ok);
            imprimir(a^.HD,cli,ok);
        end;
    end;

procedure imprimirCompras(a:arbol);    
    var
        cli:integer;
        ok:boolean;
    begin
        ok:=false;
        writeLn('Ingrese codigo de cliente a buscar:');
        ReadLn(cli);
        writeLn('---------Compras del cliente ',cli,'------');
        imprimir(a,cli,ok);
        if ok=false then writeLn('No se encontro el cliente: ',cli);
            
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
    imprimirCompras(a);
end.