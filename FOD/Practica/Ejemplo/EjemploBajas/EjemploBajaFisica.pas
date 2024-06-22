{ Técnicas de Baja Física​: 

Generar un nuevo archivo con los elementos
válidos​ sin copiar los que se desea eliminar​

​
Utilizar el mismo archivo de datos, generando
los reacomodamientos que sean necesarios.
(Solo para archivos sin ordenar)​}

program EjemploBajaFisica;
const
    valoralto = 9999;

type
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
        edad: integer;
    end;

    archivoPersonas = file of persona;

procedure leer(var archivo: archivoPersonas; var reg: persona);
    begin
        if not eof(archivo) then
            read(archivo, reg)
        else
            reg.dni := valoralto;
    end;

var
    Maestro, Nuevo: archivoPersonas;
    p: persona;
begin
    assing(Maestro, 'maestro');  // Se asume que el archivo ya existe
    assing(Nuevo, 'Archivo nuevo'); // Se crea un archivo nuevo
    reset(Maestro); // Se abre el archivo maestro
    rewrite(Nuevo); // Se abre el archivo nuevo
    leer(Maestro, p); // Se lee el primer registro del archivo maestro
    {Se copian los registros previos a "Carlos Garcia"}
    while (reg.nombre <> 'Carlos') and (reg.apellido <> 'Garcia') do begin // Se copian los registros previos a "Carlos Garcia"
        write(Nuevo, p); // Se copia del maestro al archivo nuevo
        leer(Maestro, p); //leo el siguiente registro del maestro
    end;
    {Se copian los registros posteriores a "Carlos Garcia" omitiendolo a él}
    leer(Maestro, p); // Se lee el siguiente registro del maestro
    while (reg.dni <> valoralto) do begin // Se copian los registros posteriores a "Carlos Garcia"
        write(Nuevo, p); // Se copia del maestro al archivo nuevo
        leer(Maestro, p); //leo el siguiente registro del maestro
    end;

    close(Maestro); // Se cierra el archivo maestro
    close(Nuevo); // Se cierra el archivo nuevo

end;