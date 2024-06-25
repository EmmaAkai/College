{ Un supermercado tiene 25 cajas que registran diariamente las ventas de productos. De cada venta
se dispone:
numero de ticket, codigo del producto y cantidad de unidades vendidas del producto.

Al finalizar el dia, los archivos correspondientes a las cajas se ordenan por codigo de producto
para luego actualizar  archivo de productos. Los registros del archivo de productos contienen el
codigo del prod, la descripcion, la cant en existencia, el stock minimo y el precio de venta actual.
Implementar un programa que permita:

a) dada la cantidad de cajas, actualizar la existencia de cada producto registrando la cantidad
vendida en la jornada.

Tenga en cuenta que el stock no puedo quedar por debajo de cero-

b) Informar aquellos productos que dispongan unidades en existencia y no hayan sido vendidos.

c) Informar aquellos productos vendidos que quedaron por debajo del stock minimmo.

d) Informar para cada codigo de producto, el nombre y el monto TOTAL(ESE PROD) vendido, 
tambien informar el monto TOTAL(TODOS LOS PROD) facturado en el dia para todos los productos.

NOTA: No debe implementar el ordenamiento de los archivos, los archivos deben recorrerse una
unica vez.
}

program ejercicio25;

const
    valorAlto = 9999;
    n = 25;
type
    venta = record
        numTicket:integer;
        codProducto:integer;
        uniVendidas:integer;
    end;

    producto = record
        codProducto:integer;
        descripcion:string;
        cantExistencia:integer;
        stockMinimo:integer;
        precioActual:real;
    end;

    maestro = file of producto;

    detalle = file of venta;

    vectorDetalle = array[1..n] of detalle;
    vectorVenta = array[1..n] of venta;


procedure leerVenta(var det:detalle; var v:venta);
    begin
        if (not eof(detalle)) then
            read(det, v)
        else
            v.codProducto := valorAlto;
    end;

procedure minimo(var vecDetalle: vectorDetalle; var vecVenta: vectorVenta; var min:venta);
    var
        iMin,i:integer;
    begin
        min.codProducto:=0;
        iMin:=0;
        for i:= 1 to n do begin
            if(vecVenta[i].codProducto <> valorAlto) then begin
                if(vecVenta[i].codProducto < min.codProducto) then begin
                    min:=vecVenta[i];
                    iMin:=i;
                end;
            end;
        end;
        if(iMin<>0) then
            leerVenta(vecDet[iMin],vecVenta[iMin])
    end;

procedure actualizarMaestro(var mae:maestro; var VecDetalle:vectorDetalle; var vecVenta:vectorVenta);
    var
        cantCodVendidas:integer;
        totalFacturado,cantCodFacturado:real;
        v,min:venta;
        aString:string;
        codAct:integer;
    begin
        reset(mae);
        for i:= 1 to n do begin
            str(i,aString);
            assign(vecDetalle[i],'detalle'+aString);
        end;

        TotalCodVendidas:=0;
        minimo(vecDetalle,vecVenta,min);
        while(min.codProducto <> valorAlto) do begin
            CantCodVendidas:=0;
            CantCodFacturado:=0;
            codAct:= min.codProducto;
            while(min.codProducto = codAct) do begin
                cantCodVendidas:= cantCodVendidas + min.uniVendidas;
                
                CantCodFacturado:= CantCodFacturado + (min.uniVendidas * min.precioActual);
                TotalFacturado:= TotalFacturado + (min.uniVendidas * min.precioActual);


                minimo(vecDetalle,vecVenta,min);
            end;

            writeln('Codigo de producto: ',min.codProducto);
            writeln('--- Nombre: ',min.descripcion);
            writeln('--- Monto vendido: $',cantCodFacturado);

            if(min.cantExistencia > 0)
                writeln('------ Posee unidades en existencia');
            if(min.cantExistencia < min.stockMinimo)
                writeln('------ Quedo por debajo del stock minimo');

            read(mae,v);
            while(v.codProducto <> codAct) do
                read(mae,v);

            v.cantExistencia:= v.cantExistencia - cantCodVendidas;
            if(v.cantExistencia < 0) then
                v.cantExistencia:=0;

                seek(mae, filepos(mae)-1);
                write(mae,v);
        end;
        writeln('Monto total facturado en el dia: $', TotalFacturado );
    end;