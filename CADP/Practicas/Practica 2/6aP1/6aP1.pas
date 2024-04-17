{a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.}
Program ejercicio6;

procedure LeerNumeros(var m:integer);
var
num:integer;
begin
    writeln('Ingrese valores, para finalizar ingrese un numero negativo.');
    readln(num);
    while(num>m) do begin
        m:=num;
        readln(num);
    end;
end;

var
    max:integer;
begin
    max:=-9999;
    LeerNumeros(max);
    writeln('El numero mas alto ingresado fue ',max);
end.