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


var
    a:arbol;

begin
    a:=nil;

end.