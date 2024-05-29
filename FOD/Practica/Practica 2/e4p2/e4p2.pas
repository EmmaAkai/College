{A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un
archivo que contiene los siguientes datos: 
        nombre de provincia, cantidad de personas alfabetizadas y total de encuestados.

Se reciben dos archivos detalle provenientes de dos agencias de censo diferentes,
    dichos archivos contienen: 
        nombre de la provincia, código de localidad, cantidad de alfabetizados y cantidad de encuestados.
        
Se pide realizar los módulos necesarios para actualizar el archivo maestro
    a partir de los dos archivos detalle.

NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle
pueden venir 0, 1 ó más registros por cada provincia.}

program e4p2;

const
    fin='zzzz';

type
    str30=string[30];

    prov = Record
        nombre:str30;
        cantAlf:integer;
        totEncu:integer;
    end;

    agen = Record
        nombre:str30;
        cod:integer;
        cantAlf:integer;
        cantEncu:integer;
    end;

    maestro = file of prov;
    detalle = file of agen;

procedure leer(var archivo: detalle; a:agen);
    begin
        if(not eof(archivo)) then
            read(archivo,a);
        else
            a.nombre:=fin;
    end;


//---Este proceso se hace cuando tengo 2 detalles----------------
procedure minimo(var min,p1,p2:prov; var det1,det2: detalle);
    begin
        if(p1.nombre < p2.nombre) then begin
            min:= r1;
            leer(det1,p1);
        end
        else
            min:=r2;
            leer(det2,p2);
    end;

procedure actualizar(var mae:maestro; var det1,det2:detalle);
        p:prov;
        min,a1,a2:agen;
        nomAct:=str30;
    begin
        reset(mae);reset(det1);reset(det2);

        leer(det1,p1);
        leer(det2,p2);
        minimo(min,a1,a2,det1,det2)
        while(min.nombre <> fin) do begin
            nomAct:= min.nombre;
            //busco la provincia leida en el detalle en el archivo maestro
            while(a.nombre = nomAct) do
                leer(mae,p);

            //actualizo el maestro
            while(min.nombre = nomAct) do begin
                p.cantAlf:= p.cantAlf + min.cantAlf;
                p.cantEncu:= p.cantEncu + min.cantEncu;
                minimo(min,a1,a2,det1,det2);
            end;

            seek(mae,filepos(mae)-1);
            write(mae,p);

        end;
        close(mae);close(det1);close(det2);
    end;
var
    mae:maestro;
    det1,det2:detalle;
begin
    Assign(mae,'maestro'); Assign(det1,'detalle1'); Assign(det2,'detalle2');
    actualizar(mae,det1,det2);
end.