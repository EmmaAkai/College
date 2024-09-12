program test;
const 
    s = 30;
    valorAlto = 9999;
type

    producto = record
        cod:integer;
        nombre:string[s];
        precio:real;
        stock:integer;
        stockMin:integer;
    end;

    venta = record
        cod:integer;
        cantidad:integer;
    end;

    maestro = file of producto;
    detalle = file of venta;

    vectorRecord = array[1..s] of venta;
    vectorDetalle= array[1..s] of detalle;

procedure leer(var archivo: detalle; var dato:venta);
    begin
        if(not eof(archivo)) then
            read(archivo, dato)
        else
            dato.cod:=valorAlto;
    end;

procedure minimo(var VecRecord: vectorRecord; var VecDetalle: vectorDetalle; var min:venta);
    var
        i, iMin:integer;
    begin
        iMin:=0;
        min.cod:=valorAlto;
        
        for i := 1 to s do begin
            if(VecRecord[i].cod <> valorAlto) then
                if(VecRecord[i].cod < min.cod) then begin
                    min:= vecRecord[i];
                    iMin:=i;
                end;
        end;

        if(iMin <> 0) then
            leer(VecDetalle[iMin], VecRecord[iMin]);
    end;

procedure Actualizar (var Mae: Maestro; var vecDetalle: VectorDetalle;  var VecRecord: VectorRecord);
    var
        min:venta;
        nombre:string[s];
        p:producto;
        i,cantVendida,codAct: integer;
    begin
        reset(Mae); //Abro el archivo maestro

        for i := 1 to s do begin
            readln(nombre);
            assing(vecDetalle[i], nombre);  //Asigno el archivo detalle
            reset(vecDetalle[i]); //Abro el archivo detalle
            leer(VecDetalle[i], VecRecord[i]); //Leo el primer registro y lo guardo en el vector de records
        end;


        minimo(VecRecord, VecDetalle, min); //Busco el minimo

        while (min.cod <> valorAlto) do begin //Mientras no llegue al final del archivo
            codAct := min.cod; //Guardo el codigo actual
            cantVendida:=0;//Inicializo la cantidad vendida

            while (min.cod = codAct) do begin //Mientras el codigo sea igual al anterior
                cantVendida:= cantVendida + min.cantidad; //Sumo la cantidad vendida
                minimo(VecRecord, VecDetalle, min); //Busco el siguiente minimo
            end;

            read(Mae, p); //Leo el primer registro del archivo maestro
            while (p.cod <> codAct) do //Mientras el codigo sea distinto al actual
                read(Mae, p); //Leo el siguiente registro
            
            p.stock:= p.stock - cantVendida; //actualizo la cantidad vendida del stock

            seek(Mae, filepos(Mae)-1); //Me posiciono en el registro actual
            write(Mae, p);   //Escribo el registro actual el stock actualizado
        end;

        close(Mae); //Cierro el archivo maestro
        for i:= 1 to s do   //Cierro los archivos detalle
            close(vecDetalle[i]); //Cierro el archivo detalle
    end;