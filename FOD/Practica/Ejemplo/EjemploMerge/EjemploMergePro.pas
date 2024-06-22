{ Se tienen 3 archivos de productos ordenados por código, con la siguiente estructura:
    producto = record
        cod: integer;
        descripcion: string;
        precio: real;
        cant: integer;
    end;
    archivo = file of producto;
    Realizar un programa que genere un archivo maestro con la información de los 3 archivos de
    detalle, teniendo en cuenta que puede haber productos con el mismo código en los 3 archivos.
    En este caso, se deberá sumar la cantidad de productos. 
    Nota: los archivos de detalle pueden tener diferente cantidad de productos. 
    Implementar el programa utilizando procedimientos. 
}
program EjemploMergePro;
const
    valoralto = 9999;

type
    producto = record
        cod: integer;
        descripcion: string;
        precio: real;
        cant: integer;
    end;

    archivo = file of producto;

procedure leer(var det: archivo; var dato: producto);
    begin
        if (not eof(det)) then
            read(det,dato)
        else
            dato.cod:= valoralto;
    end;

procedure minimo(var det1,det2,det3: archivo; var r1,r2,r3,min:producto);
    begin
        if(r1.codigo <= r2.codigo and r1.codigo <= r3.codigo) then begin
            min:=r1;
            leer(det1,r1);
        end
        else if (r2.codigo <= r1.codigo and r2.codigo < r3.codigo) then begin
            min:=r2;
            leer(det2,r2);
        end
        else begin
            min:= r3;
            leer(det3,r3);
        end;
    end;

Procedure MergeNormal(var det1,det2,det3: archivo; var mae: archivo);
    var min,r1,r2,r3:producto
    begin
        leer(det1,r1); // Inicializo los registros r1
        leer(det2,r2); // r2
        leer(det3,r3); // r3
        minimo(det1,det2,det3,r1,r2,r3,min); // Busco el minimo entre los 3
        while(min.cod <> valoralto) do begin //mientras no este en el final
            write(mae,min); // escribo el minimo en el archivo maestro
            minimo(det1,det2,det3,r1,r2,r3,min); //busco el siguiente minimo
        end;
    end;

procedure MergeConDatosRepetidos(var det1,det2,det3:archivo; var mar:archivo);
    var
        minAct,min,r1,r2,r3:producto; //IMPORTANTE EL MIN ACTUAL
        total:integer; // Cantidad total de productos por codigo
    begin
        leer(det1,r1); // Inicializo los registros r1
        leer(det2,r2); // r2
        leer(det3,r3); // r3
        minimos(det1,det2,det3,r1,r2,r3,minAct); // Busco el minimo entre los 3
        while(min.codigo <> valoralto) do begin  //mientras no este en el final
            minAct:= min; // Guardo el minimo actual
            total:= 0; // Inicializo la cantidad total
            while(min.codigo = minAct.codigo) do begin // Mientras el minimo sea igual al minimo actual
                total := total + min.cant; // Sumo la cantidad total de productos
                minimo(det1,det2,det3,r1,r2,r3,min); // Busco el siguiente minimo
            end;
            minAct.cant:= total;// Actualizo la cantidad total de productos por que
//                      en este ejemplo solo tengo que mergear la cant total de prod
            write(mae,minAct); // actualizo el archivo maestro
        end;
    end;

var
    det1,det2,det3,mae: archivo;
begin
    assing(mae,'maestro');
    assing(det1,'detalle1');
    assing(det2,'detalle2');
    assing(det3,'detalle3');
    rewrite(mae);
    reset(det1);
    reset(det2);
    reset(det3);
    
    MergeNormal(det1,det2,det3,mae);


    close(mae);
    close(det1);
    close(det2);
    close(det3);
end;