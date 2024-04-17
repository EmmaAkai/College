program Seleccion;

type

    Vector = array [1..10] of integer;

procedure inicializarVector (var v:vector);
    var
        i:integer;
    begin
        for i:=1 to 10 do 
            v[i]:=0;
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

procedure imprimirVector (v:vector);    
    var
        i:integer;
    begin
        writeLn('--------------------------------');
        for i:=1 to 10 do 
            writeLn('numero: ',v[i]);

    end;    

procedure Seleccion(var v:vector);
    var
        i,j,pos:integer;
        item:integer;   
    begin
        for i:=1 to 10 do begin
            pos:=i;
            for j:= i+1 to 10 do 
                if v[j] > v[pos] then
                    pos:=j;
            item:=v[pos];
            v[pos]:=v[i];
            v[i]:=item;        
        end;
    end;
var
    v:vector;
begin
    inicializarVector (v);
    cargarVector(v);
    Seleccion(v);
end.