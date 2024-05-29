{   El encargado de ventas de un negocio de productos de limpieza desea administrar el stock 
        de los productos que vende. 
    Para ello, genera un archivo maestro donde figuran todos los productos que comercializa.
        De cada producto se maneja la siguiente información:
            código de producto, nombre comercial, precio de venta, stock actual y stock mínimo.
        
    Diariamente se genera un archivo detalle donde se registran todas las ventas de productos realizadas.
        De cada venta se registran:
            código de producto y cantidad de unidades vendidas. 

    Se pide realizar un programa con opciones para:

a. Actualizar el archivo maestro con el archivo detalle, sabiendo que:
    ● Ambos archivos están ordenados por código de producto.
    ● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del
        archivo detalle.
    ● El archivo detalle sólo contiene registros que están en el archivo maestro.
b. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo
    stock actual esté por debajo del stock mínimo permitido}

program e3p2;
const
    fin=9999;
type
    str18=string[18];

    producto = Record
        cod= integer;
        nombre: str18;
        precio: real;
        stockAct: integer;
        stockMin: integer;
    end;

    venta = Record
        cod:integer; //---Codigo del producto vendido
        uniVendidas: integer;
    end;

    maestro = file of producto;
    detalle = file of venta;

procedure leer(var archivo:detalle; var v:venta);
    begin
        if (not eof(archivo)) then
            read(archivo,v);
        else
            v.cod:= fin;
    end;

procedure actualizar(var mae:maestro; var det:detalle);
    var
        p:producto;
        v:venta;
        codAct:integer;
        cantVendida:integer;
    begin
        reset(mae); reset(det);

        leer(det,v);
        while(v.cod<> fin) do begin
            codAct:=v.cod;
            cantVendida:= 0;
            while(codAct = v.cod) do begin
                cantVendida:= cantVendida + 1;

                leer(det,v);
            end;

            read(mae,p);
            while(p.cod <> codAct) do
                read(mae,p);

            p.stockAct:= p.stockAct-cantVendida;

            seek(mae,filepos(mae)-1);
            write(mae,p);
        end;
        close(mae); close(det);
    end;

procedure PasarAaTxt(var mae:maestro; var txt:text);
    var
        p:producto;
    begin
        reset(mae);
        rewrite(txt);
        writeln(txt,'Lista de productos con Stock Actual menor que Stock Minimo: ');
        while(not eof(mae)) do begin
            read(mae,p);
            if(p.stockAct < p.stockMin) then
                writeln(txt,'Codigo: ',p.codigo,'. Producto: ', p.nombre,'.')
        end;
        close(mae); close(txt);
    end;
var
    mae:maestro;
    det:detalle;
    stock_minimo:text;
begin
    Assign(mae,'Productos'); Assign(det,'Ventas');

    actualizar(mae,det);
    PasarAaTxt(mae,txt);
end.