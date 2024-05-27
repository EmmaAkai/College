program e1p2;

type
    Empleado = Record
        cod:integer;
        nombre:string[18];
        monto:real;
    end;

    EmpleadoFile = file of Empleado;

procedure importar(var EFile: EmpleadoFile);
    var
    begin
        
    end;

var
    EFile: EmpleadoFile;
begin
    
end.