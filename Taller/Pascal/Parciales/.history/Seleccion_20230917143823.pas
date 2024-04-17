program Seleccion;

type

    Vector = array [1..10] of integer;

procedure inicializarVector (var v:vector);
    var
        i:integer;
    begin
        for i:=1 to 10 do 
            i[i]:=0;
    end;


procedure cargarVector (var v:vector);
    var
        i:integer;
    begin
        for i:= 1 to 10 do begin
            v[i]:=random(100)+1;
            writeLn('Numero: ',v[i]);
        end;
    end;

var
    v:vector;
begin
    inicializarVector (v);
    cargarVector(v);
end.