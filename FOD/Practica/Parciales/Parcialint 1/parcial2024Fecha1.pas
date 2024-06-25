{Considere que se tiene un archivo que contiene informacion de los préstamos otorgados por una empresa financiera que cuenta
con varias sucursales. Por cada préstamo se tiene la siguiente informacion: número de sucursal donde se otorgó, DNI del empleado que lo otorgó,
numero de prestamo, fecha de otorgamiento, monto del préstamo otorgado. Cada prestamo otorgado por la empresa se considera como una venta. Ademas, se sabe que 
el archivo esta ordenado por los siguientes criterios: codigo de sucursal, DNI del empleado y fecha de otorgacion (en ese orden).
Se solicita definir las estructuras de datos necesarias y escribir el modulo que reciba el archivo de datos y genere un informe en un archivo de texto
con el siguiente formato:
//
Informe de ventas de la empresa.
Sucursal: <numero de sucursal>
            Empleado: DNI <dni del empleado>
            Año: ... Cantidad de ventas: ... Monto venta: ...
            Año: .. Cantidad de ventas: ... Monto venta: ...
            Totales: Ventas: ... Monto: ...
            Empleado: DNI <dni del empleado>
            ...
        Cantidad total de ventas sucursal: ...
        Monto total vendido por sucursal: ...
Sucursal: <numero de sucursal>

Cantidad de ventas de la empresa: ...
Monto total vendido por la empresa: ...
//
Notas: 
el archivo de datos se debe recorrer solo una vez.
para determinar el año de otorgacion puede asimir que existe una funcion extraerAño(fecha).
En la generacion del archivo de texto solo interesa que aparezca la informacion requerida, no es necesario que se respete el formato exacto.
}
const   
    valorAlto = 9999;
type
    prestamo = record
        nroSucursal : integer;
        dniEmpleado : integer;
        nroPrestamo : integer;
        fecha : string; 
        monto : real;
    end;

    archivoPrestamos = file of prestamo;


// function extraerAño(......): .....; Se dispone


    procedure Leer(var archivo : archivoPrestamos; var p : prestamo);
    begin
        if (not eof (archivo) ) then 
            read(archivo,p)
        else 
            p.nroSucursal:= valorAlto;
    end;

    procedure GenerarInforme (var archivo : archivoPrestamos); 
    var
        archivoTxt : Text; 
        p : prestamo;
        tVEmpresa,tVSucursal,tVEmpleado,tVAnho,sucursalActual,empleadoActual,anhoActual : integer;
        tMontoEmpresa,tMontoSucursal,tMontoEmpleado,tMontoAnho : real;
    begin
        assign(archivo,'archivoDatos'); 
        assign(archivoTxt,'informe.txt');

        reset(archivo);
        rewrite(archivoTxt);

        tVEmpresa:=0; //inicializo el total de ventas de la empresa en  0
        tMontoEmpresa:=0; //inicializo el monto total de las ventas de la empresa en 0

        leer(archivo,p); //leo el primero para empezar a recorrer el archivo
        writeln(archivoTxt,'Informe de ventas de la empresa.'); //escribo en el .txt
        while (p.nroSucursal <> valorAlto) do begin // mientras no sea el final del archivo entro
            sucursalActual := p.nroSucursal; // me guardo el num de sucursal actual para el cc
            tMontoSucursal:=0; tVSucursal:=0; //inicializo los totales de la sucursal en 0
            writeln(archivoTxt,'Sucursal: ',sucursalActual); //escribo el num de sucursal en el .txt

            while (sucursalActual = p.nroSucursal) do begin //mientras siga siendo la misma sucursal
                empleadoActual:= p.dniEmpleado; //me guardo el dni del empleado actual para el cc
                tVEmpleado:=0; tMontoEmpleado:=0; //inicializo los totales del empleado en 0
                writeln(archivoTxt,'Empleado: DNI ',empleadoActual);// escribo el dni del emp en el .txt

                {Mientras siga siendo la misma sucursal y mientras siga siendo el mismo empleado}
                while ( (sucursalActual = p.nroSucursal) and (empleadoActual = p.dniEmpleado))do begin
                    anhoActual:= extraerAnho(p.fecha); //me guardo el año actual para el cc
                    tVAnho:=0;  tMontoAnho:=0; // inicializo los totales del año en 0

                    {Mientras siga siendo la misma sucursal               Y el mismo empleado                 Y el mismo año}
                    while ( (sucursalActual = p.nroSucursal) and (empleadoActual = p.dniEmpleado) and (anhoActual = extraerAnho(p.fecha)))do begin
                        tVAnho:= tVAnho + 1; //sumo 1 a la cantidad de ventas del año
                        tMontoAnho:= tMontoAnho + p.monto; //sumo el monto total de las ventas año
                        leer(archivo,p); // leo el siguiente dato 
                    end;// cuando leo otro año actual

                    writeln(archivoTxt,'Año: ',anhoActual, 'Cantidad de ventas: ',tVAnho, ' Monto venta: ',tMontoAnho); //escribo en el .txt el año, la cant de ventas y el monto de ventas
                    tVEmpleado:= tVEmpleado + tVAnho; //actualizo la CANTIDAD total de ventas del empleado
                    tMontoEmpleado:= tMontoEmpleado + tMontoAnho; // actualizo el MONTO total de ventas del empleados
                end;// cuando leo otro empleado

                writeln(archivoTxt,'Totales:   Ventas: ',tVEmpleado, ' Monto: ',tMontoEmpleado); //escribo en el .txt los totales del empleado(CANT Y MONTO)
                tVSucursal:= tVSucursal + tVEmpleado;// actualizo la CANTIDAD total de ventas de la sucursal
                tMontoSucursal:= tMontoSucursal + tMontoEmpleado;// actualizo el MONTO total de ventas de la sucursal
            end;// cuando leo otra sucursal

            writeln(archivoTxt,'Cantidad total de ventas sucursal: ',tVSucursal); //escribo en el .txt la cantidad total de ventas de la sucursal
            writeln(archivoTxt,'Monto total vendido por sucursal: ',tMontoSucursal); //escribo en el .txt el monto total de ventas de la sucursal
            tMontoEmpresa:= tMontoEmpresa + tMontoSucursal;
            tVEmpresa:= tVEmpresa + tVSucursal;

        end;// cuando leo VALOR ALTO
        writeln(archivoTxt,'Cantidad de ventas de la empresa: ',tVEmpresa);//escribo en el .txt la CANTIDAD total de ventas de la empresa
        writeln(archivoTxt,'Monto total vendido por la empresa: ',tMontoEmpresa); //escribo en el .txt el MONTO total de ventas de la empresa
        close(archivo); //cierro el archivo maestro
        close(archivoTxt); //cierro el archivo de texto

    end;// fin del procedure :) 
