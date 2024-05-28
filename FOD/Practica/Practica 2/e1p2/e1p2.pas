{Una empresa posee un archivo con información de los ingresos percibidos por diferentes
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
nombre y monto de la comisión. La información del archivo se encuentra ordenada por
código de empleado y cada empleado puede aparecer más de una vez en el archivo de
comisiones.
Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
única vez con el valor total de sus comisiones.
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez.}
program e1p2;
const
    valorAlto=999;

type
    Empleado = Record
        cod:integer;
        nombre:string[18];
        monto:real;
    end;

    EmpleadoNuevo = Record
        cod:integer;
        nombre:string[18];
        montoTot:real;
    end;

    EmpleadoFile = file of Empleado;
    NuevoFile = file of EmpleadoNuevo;

procedure leer(var archivo: EmpleadoFile; var e: Empleado);
    begin
        if(not eof(archivo)) then
            read(archivo, e);
        else
            e.cod:=valorAlto;
    end;

procedure crear(var nFile:NuevoFile; var eFile:EmpleadoFile);
    var
        e:Empleado;
        n:EmpleadoNuevo;
        codAct:integer;
        tot:integer;
    begin
        rewrite(nFile);
        reset(eFile);
        leer(eFile,e)
        while(e.cod <> ValorAlto) do begin
            codAct:=e.cod;
            tot:=0;
            while(codAct:=e.cod) do begin
                tot:=tot+e.monto;
                leer(eFile,e);
            end;
            n.cod:=e.cod;
            n.nombre:=e.nombre;
            n.montoTot:=tot;
            write(nFile,n);
        end;
        close(nFile);
        close(eFile);
    end;

var
    eFile: EmpleadoFile;
    nFile: NuevoFile;
begin
    assign(eFile,'Empleados'); //se dispone
    assign(nFile,'NuevosEmp');
    crear(nFile,eFile);
end.