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

    ComprasxMesVector = array [sub_mes] of compra;


{---------------------------------------------------}

procedure leerCompra(var c:compra);
    begin
        writeLn('Cliente: ');
        ReadLn(c.cliente);
        if (c.cliente <> 0) then begin
            writeLn('Juego: ');
            ReadLn(c.Juego);
            writeLn('Dia:');
            ReadLn(c.dia);
            writeLn('Mes: ');
            ReadLn(c.mes);
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

procedure cargarArbol(var a:arbol;);
    var
        c:compra;
    begin    
        leerCompra(c);
        while(c.cliente <> 0) do begin
            insertarEnArbol(a,c);
            leerCompra(c);
        end;
    end;

var
    a:arbol;

begin
    a:=nil;
    cargarArbol(a);
end.