Program parcial1;

type
    sub_dia= 1..31;
    envio=record
        cliente:integer;
        dia:sub_dia;
        codPostal:integer;
        peso:real;
    end;
        
procedure leerEnvio(var e:envio);
    begin
        e:=peso:=random(2000)/(random(10+1));
        if (e.peso <> 0) then begin
            e.cliente := random(100) + 1;
            e.codPostal := random(7500) + 1;
            e.dia :=random(31) + 1;
        end;
    end;        

procedure insertarEnArbol(var a:arbol; e:envio);
    begin
        if(a=nil) then begin
            new(a); a^.dato:= e; a^.HI:=nil; a^.HD:=nil;
        end
            else if (e.codPostal < a^.dato.codPostal)  then insertarEnArbol(a^.HI,e)
                    else if (e.codPostal > a^.dato.codPostal) then insertarEnArbol(a^.HD,e)
                        else agregarAdelante();
    end;