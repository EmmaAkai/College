{3. Realizar un programa que presente un menú con opciones para:
a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
b. Abrir el archivo anteriormente generado y
i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado, el cual se proporciona desde el teclado.
ii. Listar en pantalla los empleados de a uno por línea.
iii. Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse.
NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario.
}
program e3p1;
type
    empleado = record
        nro:integer;
        apellido:string;
        nombre:string;
        edad:integer;
        dni:integer;
    end;

    arch_empleado = file of empleado;

procedure AsignarFile(var EF:arch_empleado);
    var
        ruta:string;
    begin
        writeln('Ingrese la ruta del archivo:');
        readln(ruta);
        Assing(EF,ruta);
    end;

procedure LeerEmpleado(var e:empleado);
    begin
        writeln('Ingrese el apellido:');
        readln(e.apellido);
        while(e.apellido <> 'fin') do begin
            writeln('Ingrese el dni:');
            readln(e.dni);
            writeln('Ingrese el nombre:');
            readln(e.nombre);
            writeln('Ingrese la edad:');
            readln(e.edad);
        end;
    end;

procedure CargarFile(var EF:arch_empleado);
    var
        e:empleado;
    begin
        reset(EF);
        LeerEmpleado(e);
        while(e.apellido <> 'fin') do begin
            read(EF,e)
            LeerEmpleado(e);
        end;
        close(EF);
    end;

Procedure InformarEmpleado(var EF:arch_empleado);
    var
        emp:empleado;
        aux:string;
    begin
        reset(EF);
        writeln('Ingrese el nombre o el apellido del empleado a buscar:');
        readln(aux);
        while(not EOF(EF)) do begin
            read(EF,emp)
                if((emp.apelldo=aux) or (emp.nombre=aux)) then begin
                    write(EF,emp.nombre);
                    write(EF,emp.apellido);
                    write(EF,emp.edad);
                    write(EF,emp.nro);
                    write(EF,emp.dni);
                    writeln('---');
                end;
            end;
        end;
        close(EF);
    end;

procedure ListarFile(var EF:arch_empleado);
    var
        i:integer;
        emp:empleado;
    begin
        i:=1;
        reset(EF);
        while(not EOF(EF)) do begin
            read(EF,emp);
            writeln(i,': ', emp.nombre, ' ', emp.apellido, '. Edad: ', emp.edad , '. Dni: ', emp.dni, '. Nro: ', emp.Nro, '.');
            writeln('---');
            i:=i+1;
        end;
        close(EF);
    end;

procedure Informar70(var EF:arch_empleado);
    var
        emp:empleado;
    begin
        reset(EF);
        writeln('Los empleados proximos a jubilarse son: ');
        while(not EOF(EF)) do begin
            read(EF,emp);
            if(emp > 70) then begin
                write(EF,emp.nombre);
                write(EF,emp.apellido);
                write(EF,emp.edad);
                write(EF,emp.nro);
                write(EF,emp.dni);
                write('---');
            end;
        end;
        close(EF);
    end;
var
    Empleados_file:arch_empleado;
begin
    AsignarFile(Empleados_file);
    CargarFile(Empleados_file);
    InformarEmpleado(Empleados_file);
    ListarFile(Empleados_file);
    Informar70(Empleados_file);
end.