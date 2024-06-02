{Una empresa de productos de limpieza posee un archivo conteniendo informacion sobre los productos
que tiene a la venta al público. 

De cada procucto se registra: código de producto, precio, stock actual y stock mínimo.

Diaramente se efectuan envios a cada uno de las 2 sucursales que posee. 

Para esto, cada sucursal envía un archivo con los pedidos de los procutos que necesita cada sucursal.

Cada pedido contiene código de producto, fecha y cantidad pedida. 

Se pide realizar el proceso de actualización del archivo maestro con los dos archivos detalle, 
obteniendo un informe en pantalla de aquellos productos que quedaron debajo del stock 
mínimo y de aquellos pedidos que no pudieron satisfacerse totalmente, informando:
    la sucursal, el producto y la cantidad que no pudo ser enviada
        (diferencia entre lo que pidió y lo que se tiene en stock)}

program Parcial2!;
const
    valoralto:999 ;
type
    //maestro
    producto = record
        cod: integer;
        precio: real;
        stockAct: integer;
        stockMin: integer;
    end;
    //detalle
    pedido = record
        cod:integer;
        fecha:string;
        cantPedida:integer;
    end;

    maestro = file of producto;
    detalle = file of pedido;

procedure leer(var det:detalle, var p:pedido);
    begin
        if(not eof(det)) then
            read(det,p)
        else
            p.cod:=valorAlto;
    end;

procedure minimo(var det1,det2:detalle; var p1,p2,min: pedido; var suc:integer;);
    begin
        if(p1.cod < p2.cod) then begin
            min:=p1;
            suc:=1;
            leer(det1,p1);
        end
        else
        begin
            min:=p2;
            suc:=2;
            leer(det2,p2);
        end;
    end;

procedure actualizar(var mae:maestro; var det1,det2:detalle);
    var
        prod:producto;
        p1,p2,min:pedido;
        suc:integer;
        totPedido:=integer; //aunque no pida que lo muestre en pantalla tengo que actualizar el stock igual
    begin
        reset(mae);reset(det1);reset(det2);
        leer(det1,p1);leer(det2,p2);
        minimo(det1,det2,p1,p2,min,suc);

        while(min.cod <> valoralto) do begin
            codAct:=min.cod;
            stock:=0;
            while(min.cod = codAct) do begin
                totPedido:=totPedido + min.cantPedida;
                minimo(det1,det2,p1,p2,min,suc);
            end;

            read(mae,prod);
            while(prod.cod <> cod.act) do
                read(mae,prod);
            
            prod.stockAct:= prod.stockAct - totPedido;
            if(prod.stockAct < 0) then
                writeln('El pedido de la sucursal ', suc,'. Producto cod: ',prod.cod,'. No han podido enviarse ', prod.stockAct,' productos.');

            seek(mae,filepos(mae)-1);
            write(mae,prod);
        end;
        close(mae);
        close(det1);
        close(det2);
    end;
var
    mae:maestro;
    det1,det2:detalle;
begin
    assign(mae,'Maestro');
    assign(det1,'Detalle1');
    assign(det2,'Detalle2');
    actualizar(mae,det1,det2);
end;