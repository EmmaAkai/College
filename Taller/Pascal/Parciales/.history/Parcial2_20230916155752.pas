program Parcial2;

type 

    datosCompra = record
        codCliente:integer;
        mes:1..12;
        monto:real;
    end;

    montoMensualVec = array [1..12] of real;

    infoCompra = record
        compra:datosCompra;
        montoMensual: montoMensualVec;
    end;    

    arbol = ^nodoA;
    nodoA = record
        dato:infoCompra;
        HI:arbol;
        HD:arbol;
    end;    


{A-------------------------------------------------}

procedure inicializarVector(var v:montoMensualVec);
    var
        i:integer;
    begin
        for i:= 1 to 12 do begin
            v[i]:=0;
        end;
    end;    

procedure leerCompra(var c:datosCompra);
    begin
        writeLn('Cliente: ');
        ReadLn(c.codCliente);
        if(c.codCliente <> 0) then begin
            writeLn('Mes: ');
            ReadLn(c.mes);
            writeLn('Monto: ');
            ReadLn(c.monto);
        end;
    end;

procedure insertarEnArbol(var a:arbol; c:datosCompra);
    begin
        if(a=nil) then begin
            new(a);
            a^.dato.compra := c;
            inicializarVector(a^.dato.montoMensual);
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
        while (c.codCliente <> 0) do begin
            insertarEnArbol(a,c);
            leerCompra(c);
        end;
    end;
        
{B-------------------------------------------------}        
   

procedure imprimirMes(a:arbol;cli:integer; var ok:boolean);
    var
        i:integer;
        monto:real;
        mes:integer;
    begin
        monto:=0;
        if (a <> nil) and (ok=false) then begin
            if(a^.dato.compra.codCliente = cli) then begin
                for i:= 1 to 12 do begin
                    if(a^.dato.montoMensual[i] > monto) then begin
                        mes:=i;
                        monto:=a^.dato.montoMensual[i];
                    end;
                end;
                writeLn('El mes con mayor gasto fue el nro ',mes,' con ',monto:3:1,' gastados');
            end;
            imprimirmes(a^.hi,cli,ok);
            imprimirmes(a^.hd,cli,ok);
        end;
    end;

procedure imprimir(a:arbol);
    var
        aux:integer;
        ok:boolean;
    begin
        ok:=false;
        writeLn('Cliente a buscar:');
        ReadLn(aux);
        imprimirMes(a,aux,ok);
        writeLn('Mes a buscar: ');
        ReadLn(aux);
    end;    


{B-------------------------------------------------}        

var
    a:arbol;
begin
    a:=nil;
    crearArbol(a);
    imprimir(a);
end.