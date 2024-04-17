{El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.}

program e1p5;

const 
    dimF=300;

type
    oficina=record
        codigo:integer;
        dni:integer;
        valorExp:real;
    end;

    OficinasVect= array [1..dimF] of oficina;

{A--------------------------------------------------}

procedure LeerRegistro(var o:oficina);
begin
    writeln('Codigo de identificacion:');
    readln(o.codigo);
    if (o.codigo <> -1) then begin
        writeln('DNI del propietario:');
        readln(o.dni);
        writeln('Valor de la expensa');
        readln(o.valorExp);
    end;
end;

procedure cargarVector (var OV:OficinasVect; var dimL:integer);
    var
        o:oficina;
    begin
        LeerRegistro(o);
        while(o.codigo <> -1) do begin
            if(dimL<= dimF) then begin
                dimL:=dimL+1;
                OV[dimL]:= o;
                LeerRegistro(o);
            end;
        end;
    end;

procedure imprimirVector (OV: OficinasVect; dimL:integer);
    var
        j:integer;
    begin
        for j:= 1 to dimL do begin
            writeln('codigo  ',j, ':  ',OV[j].codigo);
            //writeln('DNI     ',j, ':  ',OV[j].DNI);
            //writeln('Expensa ',j, ':  $ ',OV[j].valorExp:2:2);
        end;
    end;


{B------------------------------------------------}
procedure OrdenarVector(var OV:OficinasVect; dimL:integer);
    var
        i,j:integer;
        actual:oficina;
    begin
        for i:= 2 to dimL do begin
            actual:=OV[i];
            j:= i-1;
            while (j<>0) and (OV[j].codigo > actual.codigo) do begin
                OV[j+1] := OV[j];
                j:=j-1;
            end;
            OV[j+1] := actual;
        end;
    end;

{C------------------------------------------------}
procedure busquedaDicotomica (OV:OficinasVect; dimL:integer);
    begin
        
    end;


{D-----------------------------------------------}
procedure expTotalRecursiva(OV:OficinasVect; dimL:integer; var i:integer; var ExpTotal:real);
    begin
        if(i<dimL) then begin
            i:=i+1;
            ExpTotal:= ExpTotal + OV[i].valorExp;
            expTotalRecursiva(OV,dimL,i,ExpTotal);
        end;
    end;
var
    ov:OficinasVect;
    dimL,i:integer;
    ExpTotal:real;
begin
    dimL:=0;i:=0;ExpTotal:=0;
    cargarVector(OV,dimL);
    //imprimirVector(OV,dimL);
    writeln('--ORDENADO--');
    OrdenarVector(OV,dimL);
    imprimirVector(OV,dimL);
    expTotalRecursiva(OV,dimL,i,ExpTotal);
    writeln('Expensas totales: ', ExpTotal:2:2);
end.