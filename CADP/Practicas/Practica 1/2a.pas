
{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}
program Ejercicio2;
var
num:real;
begin
    writeln('Escriba un numero');
    readln(num);
    if (num>=0) then
        writeln(num:2:2)
    else 
        writeln(num*-1:2:2);
end.