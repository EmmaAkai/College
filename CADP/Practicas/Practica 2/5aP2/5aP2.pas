{a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}
program Ejercicio5;

procedure CompararNumeros(NA,NB:integer; var Can,Tot:integer);
    begin
        If (NB=NA*2) then can:=can+1;
        tot:=tot+1;
    end;

var
    numA,numB,Cant,Total:integer;
begin
    Cant:=0;    Total:=0;
    writeln('Ingrese 2 numeros.');
    readln(numA);
    readln(numB);
    while(numA<>0) and (numB<>0) do begin
        CompararNumeros(numA,numB,Cant,Total);
        writeln('Ingrese otros 2 numeros.');
        readln(numA);
        readln(numB);
    end;
    writeln('La cantidad de pares leidos fue: ',Total);
    writeln('La cantidad pares en los que Num2=Num1*2: ',Cant);
end.