{Consideraciones del proceso (precondiciones)
• Ambos archivos (maestro y detalle) están ordenados por el mismo criterio
• En el archivo detalle solo aparecen empleados que existen en el archivo maestro
• Cada empleado del archivo maestro a lo sumo puede aparecer una vez en el
archivo detalle}

program MaestroDetalle;
type
    persona = Record
        nombre:string[18];
        edad:integer;
        codigo:integer;
    end;

    datos = Record
        nombre:string[18];
        codigo:integer;
    end;

    detalle = file of datos;
    maestro = file of persona;

var
    per:persona;
    dat:datos;
    detF:detalle;
    maeF:maestro;
begin
    assing(maeF, 'maestro');
    assing(detF, 'detalle');
    {Proceso principal-------------------}
    reset(maeF); reset(detF);
    while(not eof(detF)) do begin
        read(maeF, per);
        read(detF, dat);
        while(per.nombre <> dat.nombre) do begin  {Actualice el codigo del registro "per" con el registro "dat"}
            read(maeF, per);                      {y se lo cargue al archivo maestro.}
        end;
        per.cod:=per.cod + dat.cod;
        seek(maeF,filepos(maeF)-1);
        write(maeF,per);
    end;
end.