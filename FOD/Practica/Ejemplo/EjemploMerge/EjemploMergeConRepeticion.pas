{
     Los vendedores de cierto comercio asientan las ventas realizadas .....
     Precondiciones
        Similar al anterior
        Cada vendedor puede realizar varias ventas diarias
}

program MergeConRepeticion;
const
    valoralto='9999';

type
    str4=string[4];
    str10=string[10];

    vendedor=record
        cod:str4;
        producto:str10;
        monto:real;
    end;

    ventas = record
        cod:str4;
        total:real;
    end;

    detalle = file of vendedor;
    maestro = file of ventas;



procedure leer(var archivo:detalle; var dato:alumno);
    begin
        if(not eof(archivo)) then
            read(archivo, dato);
        else
            dato.nombre := valoralto;
    end;


procedure minimo(var r1,r2,r3: alumno; var min: alumno);
    begin
        if((r1.nombre < r2. nombre) and (r1.nombre < r3.nombre)) then begin
            min:=r1;
            leer(det1,r1);
        end
        else if (r2.nombre < r1.nombre) and (r2 < r3.nombre) then begin
            min:=r2;
            leer(det2,r2)
            end
            else begin
                min:=r3;
                leer(det3,r3);
            end;
    end;

var
    min,reg1,reg2,reg3: vendedor;
    regm:ventas;
    mae1:maestro;
    det1,det2,det3:detalle;
    aux:str4;
begin
    assing(mae1,'maestro');
    assing(det1,'det1');assing(det2,'det2');assing(det3,'det3');
    reset(det1); reset(det2); reset(det3);
    rewrite(mae1);

    leer(det1,reg1);leer(det2,reg2);leer(det3,reg3);
    minimo(reg1,reg2,reg3,min);
    {---Se procesan los detalles---------------------------------------}
    while(min.cod <> valoralto) do begin
        {---Se asignan los valores para el registro del archivo maestro-------------}
        regm.cod := min.cod;
        regm.total := 0;
        {---Se procesan todos los registros de un minimo vendedor-------------------}
        while(regm.cod = min.cod) do begin
            regm.total:= regm.total + min.monto;
            minimo(reg1,reg2,reg3,min);
        end;
        {---Se guarda el archivo maestro-------------------------------}
        write(mae1,regm);
        close(mae1);
    end;    
end.