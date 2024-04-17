{Una aerolínea dispone de una estructura de datos con información de todos los pasajes vendidos
durante los años 2003 a 2014 por sus 6700 agencias oficiales. De cada pasaje se conoce el país
de destino, el mes de la venta (1 a 12), el año, el número de agencia (entre 1 y 6700) y el costo
del pasaje. La información se encuentra ordenada por número de agencia.
    a) Realizar un módulo que retorne en una estructura de datos la información de las agencias.
De cada agencia se conoce su código (entre 1 y 6700), razón social y localidad. La
información se ingresa por teclado sin ningún orden en particular.
    b) Realizar un módulo que reciba la información de los pasajes vendidos, la información de las
agencias oficiales y el código de una agencia (que podría no existir), y retorne una
estructura de datos con numero de la agencia, razón social, localidad, monto total vendido, y
mes, año y valor de cada pasaje vendido por dicha agencia. Esta información debe estar
ordenada por el valor de cada pasaje.}
program mecago;
const
    dimF=6700;
type
    infoPasaje=record
        destino:string;
        mes:1..12;
        anio:2003..2014;
        nAgencia:1..6700;
        costo:real;
    end;

    lista=^nodo;
    nodo=record
        data:infoPasaje;
        sig:lista;
    end;


{-------------------------------------------------------}
    infoAgencia=record
        codigo:integer;
        rSocial:string;
        localidad:string;
    end;

    VectorAgencias= array[1..dimF] of infoAgencia; 
{-------------------------------------------------------}


    informacion=record
        nAgencia:integer;
        rSocial:string;
        Localidad:string;
        MontoTotal:real;
        pasajes:lista2;
    end;

    infoPasaje2=record;
        anio:2003..2014;
        mes:1..12;
        costoPasaje:real;
    end;
    lista2=^nodo2;
    nodo2=record
        data:infoPasaje2;
        sig:lista2;
    end;


{-------------------------------------------------------}
{leerPasajes()
insertarOrdenado()  se disponen
cargarLista()}

{---------------MODULOS A------------------}
procedure leerInfoAgencia(var IA:infoAgencia);
    begin
        readln(IA.codigo);
        readln(IA.rSocial);
        readln(IA.localidad);
    end;
procedure cagarVector(L:lista; var VA:VectorAgencias);
    var
        i:integer;
        IA:infoAgencia;
    begin
        for i:=1 to dimf do begin
            leerInfoAgencia(IA);
            VA[IA.codigo]:=IA;
        end;
    end;

{---------------MODULOS B------------------}
procedure procesarInfo (L:lista; VA:VectorAgencias);
    var
        cod:integer;
        costotot:real;
        
    begin
        readln(cod);
        writeln(VA[cod].codigo)
        writeln(VA[cod].rSocial);
        writeln(VA[cod].localidad);
        While()
    end;
{-----------PROGRAMA PRINCIPAL-------------}
var
    L:lista;
    VA:VectorAgencias;
begin
    l:=nil
    cargarLista(L);
    cargarVector(L,VA);
end;