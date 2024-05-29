{ Se dispone de un archivo con información de los alumnos de la Facultad de Informática. Por
cada alumno se dispone de su código de alumno, apellido, nombre, cantidad de materias
(cursadas) aprobadas sin final y cantidad de materias con final aprobado. Además, se tiene
un archivo detalle con el código de alumno e información correspondiente a una materia
(esta información indica si aprobó la cursada o aprobó el final).
Todos los archivos están ordenados por código de alumno y en el archivo detalle puede
haber 0, 1 ó más registros por cada alumno del archivo maestro. Se pide realizar un
programa con opciones para:
    
    a. Actualizar el archivo maestro de la siguiente manera:
    - i.Si aprobó el final se incrementa en uno la cantidad de materias con final aprobado,
        y se decrementa en uno la cantidad de materias sin final aprobado.
    - ii.Si aprobó la cursada se incrementa en uno la cantidad de materias aprobadas sin
        final.
    
    b. Listar en un archivo de texto aquellos alumnos que tengan más materias con finales
aprobados que materias sin finales aprobados.

Teniendo en cuenta que este listado es un reporte de salida (no se usa con fines de carga),
    debe informar todos los campos de cada alumno en una sola línea del archivo de texto.

NOTA: Para la actualización del inciso a) los archivos deben ser recorridos sólo una vez.
}
program e2p2;
const
    fin= 9999;
type
    tipo= 0..2;

    alumno = Record
        cod:integer;
        nombre:string[18];
        apellido:string[18];
        cantCur:integer;
        cantFin:integer;
    end;

    materia = Record
        cod:integer;
        aprobo: tipo; // tipo de aprobado:| 0 -> desaprobado ; 1 -> cursada ; 2 -> final |
    end;

    maestro = file of alumno;
    detalle = file of materia;

procedure leer(var det: detalle; var m:materia);
    begin
        if (not eof(det)) then
            read(det,m)
        else
            m.cod:= fin;
    end;


procedure actualizar(var mae:maestro; var det:detalle);
    var
        a:alumno;
        m:materia;
        codAct:integer;
    begin
        reset(mae); reset(det);

        leer(det,m);
        while(m.cod <> fin) do begin
            codAct:= m.cod;
            while(m.cod = codAct) do begin
                //---Cuento y actualizo la cantCur y cantFin
                if(m.aprobo = 1) then
                    a.cantCur := a.cantCur+1
                else if(m.aprobo = 2) then
                    a.cantFin := a.cantFin + 1;
                    a.cantCur := a.cantCur - 1;
                //---Leo el siguiente alumnoMateria
                leer(det,m);
            end;
            //---Busco con el read hasta encontrar un alumno que coincida
            read(mae,a); // ---> Creo que se me rompe aca cuando sobrescribo el a, pierdo los datos que
                         //         acualice en el if de arriba (PREGUNTAR A JUANMITA JIJI) 
            while(a.cod <> codAct) do
                read(mae,a);
            //---Me pase por uno asi que vuelvo el puntero uno para atras
            seek(mae,filepos(mae)-1);
            //---Pongo el "a", actualizado en el maestro;
            write(mae,a);
        end;
        close(mae); close(det);
    end;


procedure PasarAaTxt(var mae:maestro; var lis:text);
    var
        a:alumno;
    begin
        reset(mae);
        rewrite(lis);
        writeln(lis,'Estos alumnos tienen mas finales aprobados que cursadas sin finales aprobados:');
        while(not eof(mae)) do begin
            read(mae,a);
            if(a.cantFin > a.cantCur) then begin
                writeln(lis, a.cod, ': ', a.apellido, ' ', a.nombre, '.');
            end;
        end;
    end;
var
    mae:maestro;
    det:detalle;
    listado: text;
begin
    Assign(mae,'maestro'); // se dispone
    Assign(det,'detalle');

    actualizar(mae,det);
    PasarAaTxt(mae,listado);
end.