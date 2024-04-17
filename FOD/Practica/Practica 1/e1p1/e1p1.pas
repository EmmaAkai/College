{1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. La carga finaliza
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del
archivo debe ser proporcionado por el usuario desde teclado.}
program e1p1;
type
    file_enteros = file of integer;

procedure cargar(var enteros: file_enteros);
    var
        num:integer;
    begin
        readln(num);
        while(num <> 30000) do begin
            read(enteros,num);
            readln(num);
        end;
    end;
var
    enteros: file_enteros;
begin
    rewrite(enteros);
    cargar(enteros);
    close(enteros);
end.