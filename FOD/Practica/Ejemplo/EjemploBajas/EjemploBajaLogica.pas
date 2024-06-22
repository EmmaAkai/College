{ Técnicas de baja Logica 
Recuperación de espacio: Se utiliza el proceso de baja física periódicamente
para realizar un proceso de compactación del archivo.
Quita los registros marcados como eliminados, utilizando
cualquiera de los algoritmos vistos para baja física.​

Reasignación de espacio:  Recupera el espacio utilizando los lugares indicados
como eliminados para el ingreso de nuevos elementos al archivo (altas).​
​}
program EjemploBajaLogica;
const
    valorAlto = 9999;
type
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
        edad: integer;
    end;

    archivo = file of persona;

procedure leer(var det: archivo; var p: persona);
    begin
        if not eof(det) then
            read(det, p)
        else
            p.dni := valorAlto;
    end;

var
    Maestro: archivo;
    p: persona;
begin
    assing(Maestro, 'maestro'); //asigno el archivo
    reset(Maestro);       //abro el archivo
    leer(Maestro, p); // leer el primer registro para entrar al while
    while (p.nombre <> 'Carlos' and p.apellido <> 'Garcia') do
        leer(Maestro, p); //busco a carlos garcia
    //hasta que lo encuentro
    p.nombre := '***'; //marco el registro como eliminado

    seek(Mestro, filepos(Maestro) - 1); //me posiciono en el registro que quiero modificar
    write(Maestro, p); //modifico el registro cambiando el nombre por ***
    close(Maestro);     //cierro el archivo
end;