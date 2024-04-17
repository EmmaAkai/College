program Parcial2;

type 

    datosCompra = record
        codCliente=integer;
        mes:1..12;
        montoGastado:real;
    end;

    montoMensualVec = array [1..12] of real;

    infoCompra = record
        compra:datosCompra;
        montoMensual: montoMensualVec;
    end;    

    arbol = ^nodoA;
    nodoA = record;
        dato:infoCompra;
        HI:arbol;
        HD:arbol;
    end;    


procedure leerCompra(var c:datosCompra);
    begin
        writeLn('Cliente: ');
        ReadLn(c.cliente);
        if(c.cliente <> 0) then begin
            writeLn('Mes: ');
            ReadLn(c.mes);
            writeLn('Monto: ');
            ReadLn(c.monto);
        end;
    end;

procedure insertarEnArbol(var a:arbol; c:datosCompra);
    begin
        if(a=nil) then begin
            new(a)
            a^.dato.compra := c;
            a^.dato.montoMensual[c.mes] := a^.dato.montoMensual[c.mes] + c.monto;
            a^.HI:=nil;
            a^.HD:=nil;
        end
            else if(c.codCliente < a^.dato.compra.codCliente) then insertarEnArbol(a^.hi,c)
                    else insertarEnArbol(a^.hd,c);
    end;    

procedure crearArbol(var a:arbol);
    var
        c:datosCompra;
    begin
        leerCompra(c);
        while (c.codCliente<>0) do begin
            insertarEnArbol(a,c);
            leerCompra(c);
        end;
    end;    

var
    a:arbol;
begin
    a:=nil;
    crearArbol(a);
end.