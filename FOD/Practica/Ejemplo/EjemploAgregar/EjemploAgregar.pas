//Agregar datos a un archivo existente-------------------

program AgregarAlArchivo;
type
    datos = Record
        Nombre: String[12];
        Edad: integer;
    end;

    Personas = File of datos;

procedure LeerPersona(var d: datos);
    begin
        writeln('Nombre:');
        readln(d.Nombre);
        if(d.Nombre <> 'zzz') then begin
            writeln('Edad:');
            readln(d.Edad);
        end;
    end;

procedure CargarArchivo(var PersonasFile: Personas);
    var
        d: datos;
    begin
        LeerPersona(d);
        while(d.Nombre <> 'zzz') do begin
            write(PersonasFile, d);
            LeerPersona(d);
        end;
    end;


procedure CrearArchivo(var PersonasFile: Personas);
    var
        ArchivoFisico: String[18];
    begin
        writeln('Nombre del archivo:');
        readln(ArchivoFisico);
        assign(PersonasFile, ArchivoFisico);
        rewrite(PersonasFile);
        CargarArchivo(PersonasFile);
        close(PersonasFile);
    end;

Procedure ImprimirPersona(d:datos);
    begin
        writeln('------------------');
        writeln('Nombre: ', d.nombre);
        writeln('Edad: ', d.edad);
    end;

procedure ImprimirArchivo(var PersonasFile: Personas);
    var
        d:datos;
    begin
        reset(PersonasFile);
        writeln('Las personas son:');
        while(not eof(PersonasFile)) do begin
            read(PersonasFile,d);
            ImprimirPersona(d);
        end;
        close(PersonasFile);
    end;

procedure AgregarAlArchivo(var PersonasFile: Personas);
    var
        d: datos;
    begin
        reset(PersonasFile);
        seek(PersonasFile, filesize(PersonasFile));
        LeerPersona(d);
        while(d.Nombre <> 'zzz') do begin
            write(PersonasFile, d);
            LeerPersona(d);
        end;
        close(PersonasFile);
    end;
var
    PersonasFile: Personas;
begin
    CrearArchivo(PersonasFile);
    ImprimirArchivo(PersonasFile);
    AgregarAlArchivo(PersonasFile);
    ImprimirArchivo(PersonasFile);
end.