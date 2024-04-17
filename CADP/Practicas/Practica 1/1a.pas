{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”}
Program Ejercicio1;
var
num1,num2:integer;
begin
    writeln('ingrese 2 numeros:');
    readln(num1);
    readln(num2);
    if(num1>num2) then begin
        writeln('El numero ',num1,' es mayor.')
        end
    else begin
        if(num2>num1) then
        writeln('El numero ',num2,' es mayor.')
        else
            writeln('Son iguales')     
    end;
end.