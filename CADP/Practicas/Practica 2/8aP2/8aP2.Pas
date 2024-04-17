{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
--● Código de los dos productos más baratos.
--● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}
Program Ejercicio8;
type
    Producto=record
        precio: real;
        codigo: integer;
        tipo:   string;
    end;

procedure 2ProductosMin(prod:producto; var min1,min2:integer);
    begin
        if(prod.codigo < min1) then begin
            min2:=min1;
            min1:=prod.codigo;
        end
        else begin
            if(prod.codigo < min2) then min2:=prod.codigo;
        end;
    end;

procedure PantalonMax(prod:producto; var max:integer);
    begin  
        if(prod.tipo = 'pantalon')  then begin
            if (prod.precio > max) then max:=prod.precio;
        end;
    end;
procedure LeerProductos(var min1,min2,max:integer;var total:real);
    var
        i:integer;
        prod:producto;
    begin
        for i:= 1 to 5 do begin
            writeln('Ingrese el codigo: ');
                readln(prod.codigo);
            writeln('Ingrese el precio: ');
                readln(prod.precio);
            writeln('Ingrese el tipo de producto: ');
                readln(prod.tipo);
            2ProductosMin(prod,min1,min2);
            PantalonMax(prod,max);
            total:=total+prod.precio;
        end;
    end;

procedure informar(min1,min2,max:integer; total:real);
    begin
        writeln('El codigo de los 2 productos mas baratos es ',min1,min2);
        writeln('El codigo del pantalon mas caro es ',max);
        writeln('El precio promedio de los productos es ', total/100);
    end;

var
    min1,min2,max:integer;
    total:real;
begin
    min1:=9999; min2:=9999; max:=-1; total:=0;
    LeerProductos(min1,min2,max,total);
    informar(min1,min2,max,total)
end;