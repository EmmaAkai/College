Program ArbolDeLista;
Type
    dato = Record
        nombre : String;
        edad : integer;
        turno : integer;
    End;

    lista = ^nodoA; 
    
    nodoA = Record
        d: dato;
        sig : lista;
    End;
    
    
    arbol = ^nodoB;

    nodoB = Record
        hi: arbol;
        hd: arbol;
        l: lista;
        turno: integer;
    End;


    
 



{Procedure agregarNodo (Var l:lista; d: dato); //Insertar Ordenado
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
        End;}


Procedure agregarHoja (Var a: arbol; d: dato);
    Var
        nue: arbol;
        nL: lista;
    Begin
        If (a = Nil) Then Begin
            //arbol
            new(nue);
            nue^.hi := Nil;
            nue^.hd := Nil;
            nue^.turno := d.turno;

            //lista
            new(nl);
            nl^.d := d;
            nl^.sig := Nil;
            nue^.l := nL;
            a := nue;
        End
            Else
                If (d.turno = a^.turno) Then
                    agregarNodo(a^.l,d)
                    Else
                        If (d.turno < a^.turno) Then
                            agregarHoja(a^.hi,d)
                            Else
                                agregarHoja(a^.hd,d)
        End;


Procedure cargarDato (Var a:arbol);
    Var
        d: dato;
    Begin
        WriteLn ('Ingrese turno');
        ReadLn (d.turno);
        While (d.turno <> 0) Do Begin
            WriteLn ('Ingrese nombre');
            ReadLn (d.nombre);
            WriteLn ('Ingrese edad');
            ReadLn (d.edad);
            agregarHoja(a,d);
            WriteLn ('Ingrese turno');
            ReadLn (d.turno);
        End;
    End;


Procedure mostrarDato (l: lista);
    Var
        aux: lista;
    Begin
        If (l <> Nil) Then
            aux := l;
        While (aux <> Nil) Do Begin
            WriteLn('Nombre: ',aux^.d.nombre);
            WriteLn('Edad: ',aux^.d.edad);
            aux := aux^.sig;
        End;
    End;


Procedure mostrarDatos (a:arbol);
    Begin
        If (a <> Nil) Then Begin
            mostrarDatos(a^.hi);
            WriteLn('Turno: ',a^.l^.d.turno);
            mostrarDato(a^.l);
            mostrarDatos(a^.hd)
        End;
    End;

    
Var
    a: arbol;
    opt: integer;
Begin
    Repeat
        WriteLn ('1- Cargar Datos');
        WriteLn ('2- Mostrar Datos');
        WriteLn ('0- Salir');
        ReadLn(opt);
        Case opt Of
            1: cargarDato(a);
            2: mostrarDatos(a);
        End;
    Until (opt = 0);
End.