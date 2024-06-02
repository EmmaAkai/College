{Una empresa dedidacada a la venta de golosinas posee un archivo que contiene informacion
sobre los productos que tiene a la venta.
    De cada producto se sabe:
        codigo, nombre, precio, stock actual y stock minimo

La empresa cuenta con 20 sucursales. Diariamente se recibe un archivo detalle de cada una,
que indica las ventas efectuadas.
    De cada venta se sabe:
        codigo y cantidad vendida.

Se debe realizar un procedumiento que actualice el stock en el archivo maestro con la informacion
disponible en los archivos detalles. Y que ademas informe en un archivo de texto aquellos productos
cuyo monto total vendido en el dia supere los $10.000.
En el archivo de texto a exportar por cada producto incluido, se deben informar todos sus datos.
Los datos de un producto se deben organizar en el archivo de texto para facilitar el uso eventual
del mismo como un archivo de carga.
♦ todos los archivos se encuentran ordenados por codigo de producto
}
program parcial3!;
const
    valoralto= 9999;
    n=20;
type
    producto = Record
        codigo:integer;
        nombre:string;
        precio:real;
        stockAct:integer;
        stockMin:integer;
    end;

    venta = record
        codigo:integer;
        cantVendida:integer;
    end;

    maestro = file of producto;
    detalle = file of venta;

    vectorVenta = array [1..n] of venta;
    vectorDetalle = array [1..n] of detalle;

procedure leer(var det:detalle;var v:venta);
    begin
        if(not eof(det)) then
            read(det,v);
        else
            v.cod:=valoralto;
    end;

procedure minimo(var vecDetalle:vectorDetalle;var vecVenta:vectorVenta; var min:venta);
    var
        i,iMin:integer;
    begin
        iMin:=0;
        min.cod:=valorAlto;
        for i:=1 to n do begin
            if(vecVenta[i].cod <> valorAlto) then begin
                if(vecVenta[i].cod < min.cod) then begin
                    iMin:=i;
                    min:=vecVenta[i];
                end;
            end;
        end;
        if(iMin <> 0) then
            read(vecDetalle[iMin],vecVenta[iMin]);
    end;

procedure actualizar(var mae:maestro; var vecDetalle; var txt:text);
    var
        prod:producto;
        min:venta;
        aString:string;
        vecVenta:vectorVenta;
        i,codAct:integer;
        cantVendida:integer;
        totPrecio:real;
    begin
        reset(mae); reset(txt);
        for i:= 1 to n do begin
            str(i,aString);
            assing(vecDetalle[i],'Detalle '+aString);
            reset(vecDetalle[i]);
            leer(vecDetalle[i],vecVenta[i]);
        end;

        minimo(vecDetalle,vecVenta,min);
        while(min.cod <> valoralto) do begin
            codAct:=min.cod;
            totCantVendida:=0;
            totPrecio:=0;
            
            while(min.cod = codAct) do begin
                totCantVendida:=totCantVendida + min.cantVendida;
                minimo(vecDetalle,,vecVenta,min);
            end;

            read(mae,prod);
            while(prod.cod <> codAct) do
                read(mae,prod)

            if ((totCantVendida * prod.precio) > 10000) then
                writeln(txt,prod.cod, ' ', prod.nombre,' ', prod.precio, ' ', prod.stockAct, ' ', prod.stockMin);
        
            prod.stockAct:= prod.stockAct - totCantVendida
            
            seek(mae,filepos(mae)-1);
            write(mae,prod)
        end;

        for i:= 1 to n do 
            close(vecDetalle[i]);
        close(txt);
        close(mae);    
    end;

// if totCantVendida * prod.Precio > 10.000 then
var
    mae:maestro;
    vecDetalle:vectorDetalle;
    txt:text;
begin
    assign(mae,'Maestro');
    assing(txt,'Texto');
    actualizar(mae,vecDetalle,txt);
end;