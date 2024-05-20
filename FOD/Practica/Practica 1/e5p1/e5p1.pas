{5. Realizar un programa para una tienda de celulares, que presente un menú con
opciones para:
a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
ingresados desde un archivo de texto denominado “celulares.txt”.

Los registros correspondientes a los celulares deben contener: código de celular, nombre,
descripción, marca, precio, stock mínimo y stock disponible.
b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al
stock mínimo.
c. Listar en pantalla los celulares del archivo cuya descripción contenga una
cadena de caracteres proporcionada por el usuario.
d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
“celulares.txt” con todos los celulares del mismo. El archivo de texto generado
podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que
debería respetar el formato dado para este tipo de archivos en la NOTA 2.
NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el usuario.
NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique en
tres líneas consecutivas. En la primera se especifica: código de celular, el precio y
marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera
nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo
“celulares.txt”.
}

program e5p1;
type
    Celular = Record
        codigo: integer;
        nombre: String[20];
        descripcion: String;
        marca:String[20];
        precio: real;
        minStock: integer;
        actStock: integer;
    end;

    Celulares = file of Celular;    

procedure Asignar(var ArchCelular: Celulares);
    var
        ruta: string[12];
    begin
        writeln('Ingrese la ruta del archivo:');
        readln(ruta);
        assign(ArchCelular, ruta);
    end;

var
    ArchCelular:Celulares;
begin
    Asignar(ArchCelular);
end.