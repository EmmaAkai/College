{Una panaderia artesanal del centro de La Plata vende productos de elaboracion propia. La panaderia agrupa
sus productos en 20 categorias
(Por ej: 1.Pan ; 2.Medialunas dulces; 3.Medialunas saladas; etc.). De cada categoria se conoce:nombre y
precio por kilo del producto. La panaderia dispone de la informacion de las categorias.
a) Realizar un modulo que retorne, en una estructura de datos adecuada, la informacion de todas las compras
afectuadas en el ultimo año.
Dicha informacion se lee desde teclado, ordenada por DNI del cliente. De cada compra se lee: DNI del cliente,
categoria del producto (entre 1 y 20) y cantidad de kilos comprados.
La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
b) Realizar un modulo que reciba la informacion de las categorias y la de todas las compras, y retorne:
1. DNI del cliente que menos ha gastado.
2. Cantidad de compras por categoria.
3. Cantidad total de compras de clientes con DNI compuesto por, a lo sumo, 5 digitos impares.}
program panes;
type
    productos=record;
        Nombre:string;
        PrecioKG:real;
    end;

    VectorProductos=array[1..20] of productos; //se dispone


    Ventas=record;
        DNI:longint;
        Categoria:1..20;
        CantidadKG:real;
    end;

    lista:^nodo;
    nodo=record;
        data:Ventas;
        sig:lista;
    end;
{---------MODULOS A-------------------------------------------}
procedure leerVentas(var V:ventas);
begin
    readln(V.DNI);
    if dni <> -1 then begin
        readln(V.Categoria);
        readln(V.CantidadKG);
    end;
end;

procedure InsertarOrdenado(var L:lista; v:ventas);
    var
        nue,ant,act:lista;
    begin
        new(nue);
        nue^.data:=v;
        act:=L;
        ant:=L;
        While (act <> nil) and (v.dni < act^.data.dni) do begin
            ant:=act;
            act:=act^.sig;
        end;
        if(act = ant) then
            L:=nue;
        else
            ant^.sig:=nue;
        nue^.sig:=act;
    end;

procedure cargarLista(var L:lista):
    var
        v:ventas;
    begin
        leerVentas(v);
        while(dni<>-1) do begin
            insertarOrdenado(L,V);
            leerVentas(v);
        end;
    end;

{----------MODULOS B---------------------------------------}
procedure procesarLista(L:lista; VP:VectorProductos);
    var
        dniActual:longint;
        dniGasto,min:real;
    begin
        min:=9999;
        while(l<>nil) do begin
            dniGasto:=0;
            dniActual:=l^.data.dni;
            while(dniActual = dni:=l^.data.dni) and (l<>nil) do begin
                

            end;

        end;
    end;
{-----------------programa principal-----------------------}
var
    L:lista;
    dniMenorGasto:longint;
begin
    L:=nil;
    cargarLista(L);


    writeln('El dni con menor gasto fue ',dniMenorGasto)
end.