Program parcial1;

type
    sub_dia= 1..31;
    infoEnvio=record
        cliente:integer;
        dia:sub_dia;
        codPostal:integer;
        peso:real;
    end;

    envio=record
recordrecord
    arbol=^nodoA;
    nodoA=record
        dato:envio;
        HI:arbol;
        HD:arbol;
    end;    

        
procedure leerEnvio(var e:envio);
    begin
        WriteLn('Peso: ');
        ReadLn(e.peso);
        if (e.peso <> 0) then begin
            e.cliente := random(100) + 1;
            e.codPostal := random(7500) + 1;
            e.dia :=random(31) + 1;
        end;
    end;

procedure InsertarOrdenado(Var l:lista; d: dato); 
    Var
        nue, ant, act: lista;
    Begin
        new(nue);
        nue^.d := d;
        act := l;
        While (act <> Nil) And (d.edad > act^.d.edad) Do Begin  
            ant := act;
            act := act^.sig;
        End;
        If (act = l) Then
            l := nue
            Else
                ant^.sig := nue;
                nue^.sig := act;
        End;           

procedure insertarEnArbol(var a:arbol; e:envio);
    var
        L:lista;
    begin
        if(a=nil) then begin
            //Inicializo en el arbol
            new(a); a^.dato:= e; a^.HI:=nil; a^.HD:=nil;
            //Inicializo en la lista
        end
            else if (e.codPostal < a^.dato.codPostal)  then insertarEnArbol(a^.HI,e)
                    else if (e.codPostal > a^.dato.codPostal) then insertarEnArbol(a^.HD,e)
                        else agregarAdelante();
    end;