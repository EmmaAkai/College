{
2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.
}
program e2p1;
type
    file_enteros = file of integer;

procedure asignar(var enteros:file_enteros);
    var
        ruta:string;
    begin
        writeln('Ingrese la ruta del archivo:');
        readln(ruta);
        assign(enteros,ruta);
    end;

procedure recorrer(var enteros:file_enteros; var nums:integer; var promedio:real);
    var
        total:integer;
        num:integer;
    begin
        Reset(enteros);
        total:=0;
        while(not EOF(enteros)) do begin
            read(enteros,num);
            if(num < 1500) then
                nums:=nums+1;
            total:=total+num;   
        end;
        promedio:= (total / FileSize(enteros));
        close(enteros);
    end;

procedure informar(var enteros:file_enteros; nums:integer; promedio:real);
    var
        i,num:integer;
    begin
        i:=0;
        Writeln('La cantidad de numeros menores a 1500 son: ',nums);
        Writeln('El promedio de los numeros del archivo son: ', promedio);
        Writeln('Los numeros del archivo son: ');
        while(not EOF(enteros)) do begin
            read(enteros,num);
            Write(i,' ----> ', num);
            i:=i+1;
        end;
    end;
var
    enteros: file_enteros;
    nums:integer;
    promedio:real;
begin
    asignar(enteros);
    nums:=0;
    promedio:=0;
    recorrer(enteros,nums,promedio);
    informar(enteros,nums,promedio);
end.