{
1. Implementar un programa modularizado para una librería que:
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados la cantidad total de
unidades vendidas y el monto total.

 De cada venta se lee código de venta, código del
producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
ventas finaliza cuando se lee el código de venta -1.


b. Imprima el contenido del árbol ordenado por código de producto.
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).
}

program ejer1Prac4;
type
    producto=record
		codigoProducto:integer;
		UnidadesVendidas:integer;
		montoTotal:real;
		l:lista;
    end;
    
	venta=record
	    codigoVenta:integer;
	    cantUnidadesVendidas:integer;
	    precioUnitario:integer;
	end;
	
	lista=^nodo;
	
	nodo=record
	    dato:venta;
	    sig:lista;
	end;
	
	arbol=^nodo;
	nodo=record
	    dato:producto;
	    HI:arbol;
	    HD:arbol;
	end;

procedure leerProducto(var p:producto);
    begin
        writeln('Codigo: ');
        readln(p.codigoProducto);
        writeln('Unidades Vendidas:');
        readln(p.UnidadesVendidas);
        writeln('Monto total:');
        readln(p.montoTotal);
    end;

procedure CrearArbol(var a:arbol; p:producto);
    begin
        if (a:=nil) then begin
            new(a); a^.dato:=p; a^.HI:=nil; a^.HD:=nil;
        end;

        if(a^.HI < p.codigoProducto) then begin
            BuscarEnArbol()
                if(existe)
                    L
                else
                    crearArbol(a^.HI,p);
        end;
            else 
                if (existe)
                    L
                else
                    CrearArbol(a^.HD,p)
    end;


procedure leerVenta(var v:venta)
begin
  writeln('Ingrese el codigo de venta');
  readln(v.codigoVenta);
  writeln('Ingrese cantidad de unidades vendidas');
  readln(v.cantUnidadesVendidas);
  writeln('Ingrese cantidad de precio unitarios');
  readln(v.precioUnitario);
end;

procedure BuscarEnArbol (a:arbol; p:producto);
    begin
        if (a^.dato.codigoProducto<p.codigoProducto) then begin
            if a^.dato.codigoProducto>p.codigoProducto then begin
        end;
    end;

procedure cargarArbol(var a:arbol);
var
  p:producto;
  v:venta;
begin
  leerProducto(p);
  leerVenta(v);
  while(v.codigoVent<>-1)do begin
    crearArbol(a,v);

    leerProducto(p);
	leerVenta;
  end;	
end;
var	
	a:arbol;
	l:lista;
begin
	a:=nil;
	l:=lista;
    crearArbol(a);
end.