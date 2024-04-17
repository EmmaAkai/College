{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”}
program ejercicio5;

var
num,num1:real;
cant:integer;
begin
    writeln('Ingrese un numero');
    readln(num);
    num1:=num*2;
    cant:=0;
    while(num<>num1) and (cant<10) do begin
        writeln('Ingrese otro numero');
        readln(num);
        cant:=cant+1;
    end;
end.
