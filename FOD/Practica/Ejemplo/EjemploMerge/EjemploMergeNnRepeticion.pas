{
     Los vendedores de cierto comercio asientan las ventas realizadas.....
     Precondiciones
        Similar al anterior
        Cada vendedor puede realizar varias ventas diarias
        Idem anterior con N archivos....
}
program MergeConNnRepeticion;
const
    valoralto='9999';

type
    vendedor = record
        cod:string[4];
        producto:string[10];
        monto:real;
    end;

    ventas = record
        cod: string[4]
        total:real;
    end;

    maestro = file of ventas;

    arcDetalle = array [1..100] of file of vendedor;
    regDetalle = array [1..100] of vendedor;

procedure leer(var archivo:detalle; var dato:vendedor);
    begin
        if(not eof(archivo)) then
            read(archivo, dato);
        else
            dato.nombre := valoralto;
    end;

procedure minimo(var regDet:regDetalle; var min: vendedor; var det: arcDetalle);
    var
        i:integer;
    begin
        {---Busco el minimo elemento del vector regDet en el campo cod, supongamos
        que es el indice i.-------------------------------------------------------}
        min := regDet[i];
        leer(det[i],regDet[i]);
    end;

var
    min:vendedor;
    det: arcDetalle;
    regDet: regDetalle;
    mae1:maestro;
    regm:ventas;
    i,n: integer;
    aux:string[10];   
begin
    read(n);
    for i:=1 to n do begin
        writeln('Nombre del nuevo archivo: ');
        readln(aux);
        assing(det[i],aux);
        reset(det[i]);
        leer(det[i],regDet[i]);
    end;
    assing(mae1,'maestro'); rewrite(mae1);
    minimo(regDet,min,det);

    {---Se procesan los archivos detalles}
    while (min.cod <> valoralto) do begin
        {---Se asignan los valores para el registro del archivo maestro---}
        regm.cod:=min.cod;
        regm.total:=0;

        {---Se procesan todos los registros de un mismo vendendor---}
        while(regm.cod = min.cod) do begin
            regm.total := regm.total + min.monto;
            minimo(regDet,min,det);
        end;

        write(mae1);
    end;
end.