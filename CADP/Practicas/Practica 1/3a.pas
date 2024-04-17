{Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10}
program Ejercicio;

var
    num1,num2,num3:integer;

begin
    readln(num1);
    readln(num2);
    readln(num3);
    if (num1>num2) and (num2>num3) then
        writeln(num1,num2,num3);

    if (num1>num3) and (num3>num2) then
        writeln(num1,num2,num3);

    if (num2>num1) and (num1>num3) then
        writeln(num2,num1,num3);

    if (num2>num3) and (num3>num1) then
        writeln(num2,num3,num1);

    if (num3>num1) and (num1>num2) then
        writeln(num3,num1,num2);

    if (num3>num2) and (num2>num1) then
        writeln(num3,num2,num1);
end.