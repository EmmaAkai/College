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
        else p.nroSucursal:= valorAlto;
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
        
        tVEmpresa:=0; {total cantidad de ventas de empressa}
        tMontoEmpresa:=0;
        
        leer(archivo,p); 
        writeln(archivoTxt,'Informe de ventas de la empresa.');
        
        while (p.nroSucursal <> valorAlto) do begin
            sucursalActual := p.nroSucursal;
            tMontoSucursal:=0; tVSucursal:=0;
            
            writeln(archivoTxt,'Sucursal: ',sucursalActual); 
            
            while (sucursalActual = p.nroSucursal) do begin
                empleadoActual:= p.dniEmpleado;
                tVEmpleado:=0; tMontoEmpleado:=0; 
                
                writeln(archivoTxt,'Empleado: DNI ',empleadoActual);
                
                while ( (sucursalActual = p.nroSucursal) and (empleadoActual = p.dniEmpleado)) do begin
                    anhoActual:= extraerAnho(p.fecha);
                    tVAnho:=0;  tMontoAnho:=0;
                    
                    while ( (sucursalActual = p.nroSucursal) and (empleadoActual = p.dniEmpleado) and (anhoActual = extraerAnho(p.fecha)))do begin
                        tVAnho:= tVAnho + 1; 
                        tMontoAnho:= tMontoAnho + p.monto;
                        leer(archivo,p);
                    end;// fin del año actual
                    
                    writeln(archivoTxt,'Año: ',anhoActual, 'Cantidad de ventas: ',tVAnho, ' Monto venta: ',tMontoAnho);
                    tVEmpleado:= tVEmpleado + tVAnho; 
                    tMontoEmpleado:= tMontoEmpleado + tMontoAnho;
                end;// fin del empleado actual
                
                writeln(archivoTxt,'Totales:   Ventas: ',tVEmpleado, ' Monto: ',tMontoEmpleado);
                tVSucursal:= tVSucursal + tVEmpleado;
                tMontoSucursal:= tMontoSucursal + tMontoEmpleado;
            end;// fin de la sucursal actual
            
            writeln(archivoTxt,'Cantidad total de ventas sucursal: ',tVSucursal); 
            writeln(archivoTxt,'Monto total vendido por sucursal: ',tMontoSucursal);
            tMontoEmpresa:= tMontoEmpresa + tMontoSucursal;
            tVEmpresa:= tVEmpresa + tVSucursal;
        
        end;// fin del archivo
        writeln(archivoTxt,'Cantidad de ventas de la empresa: ',tVEmpresa);
        writeln(archivoTxt,'Monto total vendido por la empresa: ',tMontoEmpresa); 
        close(archivo);
        close(archivoTxt);
    end;// fin del procedure :) 
