{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}

program ejercicio4;

var
num,num1:real;
begin
    writeln('Ingrese un numero');
    readln(num);
    num1:=num*2;
    while(num<>num1)do begin
        writeln('Ingrese otro numero');
        readln(num);
    end;
end.