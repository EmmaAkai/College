{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
||a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}

Program Ejercicio3;
const
    DimF=10;
Type
    vector = Array [1..DimF] of integer;

procedure CargarVector(var v:vector);
    var
        i:integer;
    begin
        for i:=1 to DimF do begin
            v[i]:=i;
        end;
    end;

procedure ImprimirVector(v:vector); //EJERCICIO A
    var
        i:integer;
    begin
        for i:=1 to DimF do begin
            writeln('Posicion ',i,': ',v[i]);
        end;
    end;

Procedure ImprimirVectorAlReves(v:vector);  //EJERCICIO B
    var
        i:integer;
    begin
        for i:=DimF downto 1 do begin
            writeln('Posicion ',i,': ',v[i]);
        end;
    end;

Procedure ImprimirEjercicioC(v:vector);     //EJERCICIO C
    var
        i:integer;     
    begin
        for i:=(DimF DIV 2) downto 1 do begin
            writeln('Posicion ',i,': ',v[i]);
        end;
        for i:=((DimF DIV 2)+1) to DimF do begin
            writeln('Posicion ',i,': ',v[i]);
        end;
    end;

Procedure ReadXtoY(v:vector; x,y:integer);  //EJERCICIO D
    var
        i:integer;
    begin
        if(x<y) then begin
            for i:= x to y do begin
                writeln('Posicion ',i,': ',v[i]);
            end;
        end
        else begin
            for i:= x downto y do begin
                writeln('Posicion ',i,': ',v[i]);
        end;
    end;
{creo que falta un end xd}
var
    vec:vector;
    x,y:integer;
begin
    CargarVector(vec);
    ImprimirVector(vec);                    //EJERCICIO A
    ImprimirVectorAlReves(vec);             //EJERCICIO B
    ImprimirEjercicioC(vec);                //EJERCICIO C
    writeln('Escriba 2 posiciones: ');
    readln(x);
    readln(y);
    ReadXtoY(Vec,x,y);                      //EJERCICIO D

end.