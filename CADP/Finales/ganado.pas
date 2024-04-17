{Se desea procesar la informacion de estancia del pais. De cada estancia se lee: codigo, localidad,
Codigo de provincia (1..23) y cantidad de cabeza de ganado. La lectura finaliza al ingresarse el codigo 0
que no debe procesarse.
Se pide:
..1) Realizar un modulo para almacenar en una estructura la info leida.
..2) Realizar un modulo que reciba la estructura generada en 1) y retorne si se encuentra o no almacenada la 
    estancia con el codigo 234.
..3) Realizar un modulo que reciba la estructura generada en 1) y calcule los codigos de las 2 provincias con
    mayor cabeza de ganado.
}
Program messi;

{-----------------Ejercicio 1--------------------------}
type 
    estancia=Record
        codigo:integer;
        localidad:string;
        codProv:1..23;
        cantCab:integer;
    end;

    provincia=array[1..23] of integer;

    lista=^nodo;
    nodo=record 
        data:estancia;
        sig:lista;
    end;

procedure leerEstancias(var e:estancia);
    begin
        writeln('Ingrese el codigo de la estancia: ');
        readln(e.codigo);
        if (e.codigo <> 0) then begin 
            writeln('Ingrese la localidad de la estancia: ');
            readln(e.localidad);
            writeln('Ingrese el codigo de provincia: ');
            readln(e.codProv);
            writeln('Ingrese la cantidad de cabezas de ganado: ');
            readln(e.cantCab); 
        end;   
    end;
    
procedure AgregarAdelante (var l:lista; e:estancia);
    var
        nue:lista;
    begin
        while (e.codigo <> 0) then begin
            new(nue);
            nue^.data:=e;
            nue^.sig:=l;
            l:=nue;
        end;
    end;


procedure cargarLista(var l:lista);
    var
        e:estancia;
    begin
        leerEstancias(e)
        while (e.codigo <> 0) do begin
            AgregarAdelante(l,e);
            leerEstancias(e);
        end;
    end;

{-----------------Ejercicio 2--------------------------}
function find234 (l:lista):boolean;
    var
        aux:boolean;
    begin
        while (l <> nil) do begin
            if(l^.data.codigo = 234) then begin
                aux:=true;
                l:=nil;
            end
            else begin
                aux:=false;
                l:=l^.sig;
            end;
        end;
        find234:=aux;
    end;
//siiisi el negro debuto con un pibe y le pegaba a la jermu

{-----------------Ejercicio 3--------------------------}
procedure inicializarVector (var p:provincia);
    var
        i:integer;
    begin
        for i:= 1 to 23 do  
            p[i]:=0;
    end;

procedure procesarInfo (var vp: provincia; l:lista);
    var
        i:integer;
        max1,max2,codMax1,codMax2:integer;
    begin
        max1:=-1;
        while (l <> nil) do begin
            vp[l^.data.codProv]:= vp[l^.data.codProv]+l^.dato.cantCab;
            l:=l^.sig;
        end;
        for i:= 1 to 23 do begin
            if (vp[i]>max1) then begin
                max2:=max1;
                max1:=vp[i];
                codMax2:=codMax1;
                codMax1:=i;
            end
            else begin
                if (vp[i]>max2) then begin
                    max2:=vp[i];
                    codMax2:=i;
                end;
            end;
        end;
    end;
        

{-----------------Programa principal-------------------}
var
    L:lista;
    VP:provincia;
begin
{-----------------Ejercicio 1--------------------------}
    cargarLista(L);
{-----------------Ejercicio 2--------------------------}
    if find234(L) begin
        writeln('Se encontro el codigo 234!!! u//w//u');
    else 
        writeln('No se encontro el codigo 234 T^T')
{-----------------Ejercicio 3--------------------------}
    procesarInfo(VP,L)
end;