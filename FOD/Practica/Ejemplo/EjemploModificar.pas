//Modificar un archivo ya existente-----------------------///

program EjemploModificar;

type

    empleado = Record
        Nombre: String[20];
        Direccion: String[20];
        Salario: real;
    end;

    Empleados = file of empleado;


procedure CrearArchivo(var ArchivoLogico: Empleados);
    var
        ArchivoFisico: String[18];
    begin
        writeln('Ingrese el nombre del archivo:');
        readln(archivoFisico);
        assign(ArchivoLogico, ArchivoFisico);
        rewrite(ArchivoLogico);
        close(ArchivoLogico);
    end;


procedure LeerEmpleado (var e: empleado);
    begin
        writeln('Ingrese el nombre del empleado:');
        readln(e.Nombre);
        if (e.Nombre <> 'zzz') then begin
            
            writeln('Ingrese la direccion del empleado:');
            readln(e.Direccion);
            
            writeln('Ingrese el salario del empleado:');
            readln(e.Salario);  
            
        end;
    end;


procedure CargarArchivo( var ArchivoLogico: Empleados);
    var
        e:empleado;
    begin
        reset(ArchivoLogico);
        writeln('La lectura finaliza cuando se ingresa el nombre "zzz".');
        LeerEmpleado(e);
        while(e.Nombre <> 'zzz') do begin
            write(ArchivoLogico,e);
            LeerEmpleado(e);
        end;
        close(ArchivoLogico);
    end;

procedure ModificarArchivo(var ArchivoLogico: Empleados); //AUMENTA SU SALARIO EN 1.1
    var
        e: empleado;
    begin
        reset(ArchivoLogico);
        while(not EOF(ArchivoLogico)) do begin
            Read(ArchivoLogico,e);
            e.Salario:=e.salario*1.2;
            Seek(ArchivoLogico, filepos(ArchivoLogico) - 1);
            write(archivoLogico, e);
        end;
        close(ArchivoLogico);
    end;

procedure InformarEmpleado(e: empleado);
    begin
        writeln('Nombre: ', e.Nombre);
        writeln('Direccion: ', e.Direccion);
        writeln('Salario: ', e.Salario:2:2);
        writeln('------------------------');
    end;

procedure LeerArchivo(var ArchivoLogico: Empleados);
    var
        e:empleado;
    begin
        reset(ArchivoLogico);
        Writeln('Los empleados son:');
        while (not eof(ArchivoLogico)) do begin
            read(ArchivoLogico, e);
            InformarEmpleado(e);
        end;
        close(ArchivoLogico);
    end;

var
    ArchivoLogico: Empleados;
begin
    CrearArchivo(ArchivoLogico);
    CargarArchivo(ArchivoLogico);
    LeerArchivo(ArchivoLogico);
    ModificarArchivo(ArchivoLogico);
    writeln('------');
    LeerArchivo(ArchivoLogico);
end.