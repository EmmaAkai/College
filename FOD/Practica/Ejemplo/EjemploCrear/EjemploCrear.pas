//CREAR Y LEER UN ARCHIVO------------------------------------------------------------//

program generarArchivo;

type
    Archivo = file of integer;

procedure leerArchivo(var archivoLogico:archivo);
    var
        nro: integer; //para leer cada elemento del archivo
    begin
        reset(archivoLogico); //abro el archivo anteriormente creado
        writeln('Los numeros dentro del archivo son: ');
        while(not eof(archivoLogico)) do begin //Mientras no sea EOF(END OF FILE) sigue leyendo
            read(archivoLogico,nro);
            write(nro);
        end;
        close(archivoLogico);
    end;

var
    archivoLogico: archivo;
    nro: integer;
    archivoFisico: string[12];

begin
    writeln('Ingrese el nombre del archivo:');
    read(archivoFisico); //declaro el nombre edel archivo
    assign(archivoLogico, archivoFisico); //se lo asigno al logico
    rewrite(archivoLogico); //se crea el archivo y lo abre
    writeln('Ingrese los numeros a ingresar al archivo:');
    read(nro); //Leo un numero
    while(nro<>0) do begin
        write(archivoLogico,nro);//meto en el archivo el numero
        read(nro); //sigo leyendo numeros hasta que ingrese un "0"
    end;
    close(archivoLogico); //cierro el archivo, abierto anteriormente con la instruccion rewrite

    leerArchivo(archivoLogico);
end.