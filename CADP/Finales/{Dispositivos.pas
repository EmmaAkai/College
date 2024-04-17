{Un local de venta de dispositivos de almacenamiento esta analizando las ventas realizadas durante la navidad
del 2020. El local organiza los dispositivos que vende en 5 categorias: 1. Discos magneticos externos, 
2. Discos solidos externos, 3. Pendrives, 4. Tarjetas de memoria, 5. Otros.
Ademas, el local dispone de una estructura de datos con informacion de los 650 dispositivos que tiene
a la venta. De cada dispositivo conoce su categoria (1 al 5), cantidad de gigabytes(GB) de almacenamiento,
marca,precio y codigo (entre 1 y 650)..
..a)Realice un modulo que retorne una estructura de datos con la informacion de las ventas leidas por teclado.
De cada venta se conoce el codigo del dispositivo vendido, la cantidad vendida y el DNI del cliente.
La lectura finaliza al ingresar el DNI -1.
  b)Realice un modulo que reciba la informacion de las ventas y la informacion de los dispositivos y retorne:
El total de dinero obtenido por la venta de dispositivos de marca Sandisk de mas de veinte GB de cualquier 
categoria, y la categoria de dispositivos con mayor cantidad de ventas.}
program anashi;
Const
    Disp=650;
type
    dispositivos=record
        categoria:1..5;
        cantGB:integer;
        marca:string;
        precio:real;
        codigo:1..Disp;
    end;
    VectorDispositivos = array[1..Disp] of dispositivos; //se dispone

    VectorCategorias = array[1..5] of integer;

    ventas=record
        codigo:1..Disp;
        cantVen:integer;
        dni:longint;
    end;

    lista=^nodo;
    nodo=record
        data:ventas;
        sig:lista;
    end;

{---------------MODULOS A------------------}
procedure LeerVentas(var v:ventas);
    begin
        writeln('Ingrese dni');
        readln(v.dni);
        if (dni <> -1) then begin
            writeln('Ingrese codigo');
            readln(codigo);
            writeln('Ingrese cantidad vendidos');
            readln(v.cantVen);
        end; 
    end;

procedure agregarAdelante(var L:lista; v:ventas);
    var
        nue:lista;
    begin
        new(nue);
        nue^.data:= v;
        nue^.sig:= L;
        L:= nue;
    end;

procedure cargarLista(var L:lista);
    var
        v:ventas;
    begin
        LeerVentas(v);
        while(v.dni <> -1) do begin
            agregarAdelante(L,v);
            LeerVentas(v);
        end;
    end;

{---------------MODULOS B------------------}
{El total de dinero obtenido por la venta de dispositivos de marca Sandisk de mas de veinte GB de cualquier 
categoria, y la categoria de dispositivos con mayor cantidad de ventas.}

procedure procesarInfo (L:lista; vd:VectorDispositivos;var vc:VectorCategorias);
    var
        DinTot:real;
        i,max,maxCat:integer;
    begin
        while (L <> nil) do begin
            vc[vd[l.data.codigo].categoria]:= vc[vd[l.data.codigo].categoria] + l.data.cantVen;
            if (vd[l.data.codigo].marca = 'Sandisk') and (vd[l.data.codigo].cantGB > 20) then
                    Dintot:= DinTot + vd[l.data.codigo].dinero;
            l:=l^.sig;
        end;
        max:=0;
        for i:= 1 to 5 do begin
            if(vc[i]>max) then
                max:=vc[i];
                maxCat:=i;
        end;
    end;
{-----------PROGRAMA PRINCIPAL-------------}
var
    L:lista;
    vd:VectorDispositivos;
    vc:VectorCategorias;
begin
    L:=nil;
    cargarLista(L);
    cargarVector(vd);//se dispone
    cargarVectorB(vd,vc);
    procesarInfo(L,vd,vc);
end.