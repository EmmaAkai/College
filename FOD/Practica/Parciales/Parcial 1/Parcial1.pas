{ Una federacion de competidores de running organiza distintas carreras al mes. Cada carrera cuenta
con DNI de corredor, apellido, nombre, kms que corrió y si gano o no la carrera (valor 1 indica que ganó,
y calor 0 indica que no ganó la carrera)

Puede haber distintas cantidades de carreras en el mes. Para el mes de abril se organizaron 5 carreras.

Escriba en el programa principal con la declaracion de tipos necesaria y realice un proceso que reciba
los 5 archivos y genere el archivo maestro con la siguiente informacion: 
    DNI, apellido, nombre, kms totales y carreras ganadas.

Todos los archivos se encuentran ordenados por DNI del corredor. Cada persona puede haber
corrido una o más carreras.
}

program Parcial1!;
const
    valoralto=9999;
    n=5;
type
    str18=string[18];

    //maestro
    corredor = record
        dni: integer;
        apellido:str18;
        nombre:str18;
        kmsTot:real;
        ganadas:integer;
    end;

    //detalle
    carrera = record
        dni:integer;
        apellido:str18;
        nombre:str18;
        kms:real;
        gano:0..1; // 1 win--- 0 perdio
    end;

    maestro = file of corredores;
    detalle = file of carrera;

    vectorDetalle = array [1 to n] of detalle; //Vector de los archivos
    vectorCarrera = array [1 to n] of carrera; //Vector de los registros

procedure leer(var det:detalle, var c:carrera);
    begin
        if (not eof(det)) then
            read(det,c);
        else
            c.dni:=valoralto;
    end;
                                                //vector del registro del detalle
procedure minimo(var vecDetalle: vectorDetalle; var vecCarrera:vectorCarrera; var min: carrera);
    var
        i,iMin:integer;
    begin
        iMin:=0;
        min.cod:=valoralto;
        for i:= 1 to n do begin
            if(vecCarrera[i].cod <> valoralto) then begin
                if (vecCarrera[i].cod < min.cod) then begin
                    min := vecCarrera[i];
                    iMin:=i;
                end;
            end;
        end;
        if(iMin <> 0) then begin
            leer(vecDetalle[iMin],vecCarrera[iMin]);
        end; 
    end;

procedure asignarDetalles(var vecDetalle:VectorDetalle; var vecCarrera:vectorCarrera);
//NO ES UNA BUENA PRACTICA PERO NO LO VOY A BORRAR
    var
        aString:str18;
    begin
        for i:= 1 to n begin
            str(i,aString);
            assing(vecDetalle[i],'Detalle '+aString);
            reset(vecDetalle[i]);
            leer(vecDetalle[i],vecCarrera[i]);
        end;
    end;


                                                                    //vector del registro de los detalles
procedure actualizar(var mae:maestro; var VecDetalle:vectorDetalle; var VecCarrera:vectorCarrera);
    var
        min:carrera;
        cor:Corredor;
        aString:str18;
        i,codAct: int;
        kmsTot:real;
        ganoTot:integer;
    begin
        reset(mae);
        asignarDetalles(vecDetalle,vecCarrera);

        minimo(VecDetalle,VecCarrera,min);
        while(min.cod <> valoralto) do begin
            codAct:= min.Cod;
            kmsTot:= 0;
            ganoTot:= 0;
            while(min.cod = codAct) do begin
                kmsTot:=kmsTot+min.kmsTot;
                if(min.gano = 1) then
                    ganoTot:=ganoTot+1;


                minimo(vecDetalle,vecCarrera,min);
            end; //LEI OTRO CORREDOR
            
            read(mae,cor);
            while(cor.cod <> codAct) do
                read(mae,cor);
            
            cor.kmsTot:=cor.kmsTot + kmsTot; //Puede tener carreras pasadas o futuras
            cor.ganadas:= cor.ganadas + ganoTot //Puede tener carreras ganadas pasadas o futuras;

            seek(mae,filepos(mae)-1);
            write(mae,cor);
        end;
        for i:=1 to n do
            close(vDet[i]);
        close(mae);
    end;

var
    mae: maestro;
    vecDetalle: vectorDetalle;
    vecCarrera: vectorCarrera;
begin
    assing(mae,'Maestro');
    actualizar(mae,vecDetalle,vecCarrera);
end.