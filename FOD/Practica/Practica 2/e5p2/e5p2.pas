{Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados.
De cada producto se almacena: 
código del producto, nombre, descripción, stock disponible,stock mínimo y precio del producto.

Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena.
 
Se debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo
maestro. La información que se recibe en los detalles es: 
código de producto y cantidad vendida.
 
Además, se deberá informar en un archivo de texto: nombre de producto,
descripción, stock disponible y precio de aquellos productos que tengan stock disponible por
debajo del stock mínimo.

 Pensar alternativas sobre realizar el informe en el mismo procedimiento de actualización,
o realizarlo en un procedimiento separado (analizar ventajas/desventajas en cada caso).

Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle
puede venir 0 o N registros de un determinado producto.
}

program e5p2;
const
    valoralto=9999;
    s = 30;
type

    producto = record
        cod:intgeer;
        nombre:string;
        descri:string;
        stockDis:integer;
        stockMin:integer;
        precio:real;
    end;

    venta = record
        cod:integer;
        cantVendida:integer;
    end;

    maestro = file of producto; 

    detalle = file of venta;
    vDetalle = array [1..s] of detalle;
    vVentas = array [1..s] of venta; 


procedure leer(var det:detalle; var v:venta);
    begin
        if(not eof(det)) then
            read(det,v)
        else
            v.cod := valoralto;
    end;


procedure minimo (var vVen:vVentas; var min:venta; var vDet:vDetalle);
    var
        i,iMin:integer;
    begin
        iMin:=0;
        min.cod:=valoralto;
        for i:= 1 to s do begin
            if (vVen[i].cod <> valoralto) then
                if (vVen[i].cod < min.cod) then begin
                    min:=v[i];
                    iMin:= i;
                end;
        end;
        if (iMin <> 0) then begin
            leer(vDet[iMin],v[iMin]);
        end;
    end;

procedure actualizar(var mae:maestro; var vDet:vDetalle; var vVen: vVentas);
    var
        min:venta;
        aString:string;
        p:producto;
        i,cantVendida,codAct:integer;
    begin
        reset(mae);
        for i:=1 to s do begin //Asigno y posiciono el puntero en todos los detalles.
            str(i,aString);
            Assign(vDet[i],'detalle '+aString);
            reset(vDet[i]);
            leer(vDet[i],vVen[i]);
            writeln(vVen[i].cod);
        end;

        minimo(vVen,min,vDet);

        while(min.cod <> valoralto) do begin
            codAct:=min.cod;
            cantVendida:=0;

            while(min.cod = codAct) do begin
                cantVendida:= cantVendida + min.cantVendida;
                minimo(vVen,min,vDet);
            end;

            read(mae,p);
            while(p.cod <> codAct) do
                read(mae.p);

            p.stockDis:= p.stockDis - cantVendida;

            seek(mae,filepos(mae)-1);
            write(mae,p);
        end;

        for i:= 1 to s do
            close(vDet[i]);
        close(mae);
    end;

procedure pasarAaTexto(var mae:maestro; var txt:texto)
    var
        p:producto;
    begin
        reset(mae);
        rewrite(txt);
        while(not eof(mae)) do begin
            read(mae,p);
            if(p.stockMin < p.stockDis) then
                writeln(txt,p.cod,': ', p.nombre,', ', p.descri,'. Disponible: ',p.stockDis,'. Minimo: ', p.stockMin,'. $',p.precio);
        end;
        close(mae);
        close(txt);  
    end;
var
    mae:maestro;
    txt:text;
    vDet:vDetalle;
    vVen:vVentas;
begin
    Assing(mae,'Maestro');
    Assign(txt,'Texto');
    actualizar(mae,vDet,vVen);
    pasarAaTexto(mae,txt);
end.