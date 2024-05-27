{
El problema siguiente generaliza aún más el problema anterior

El maestro se actualiza con tres archivos detalles

Los archivos detalle están ordenados de menor a mayor

Condiciones de archivos iguales, misma declaración de tipos del
problema anterior

1 MAESTRO y "N" DETALLES------------------------------------------
}

program MaestroNDetalles;
const
    valoralto='9999';
type
    {EL EJEMPLO NO TENIA TYPE, ASI QUE YO SUPONGO}
    str4:string[4];
    prod = Record
        cod: str4;
        descripcion: String[30];
        pu:real;
        cant:integer;
    end;

    v_prod = Record
        cod: str4;
        cv: integer; {cant vendida}
    end;

    detalle = file of v_prod;
    maestro = file of prod;

procedure leer(var archivo: detalle; var dato: v_prod);
    begin
        if (not eof(archivo)) then
            read(archivo,dato);
        else
            dato.cod := valoralto;
    end;

procedure minimo (var r1,r2,r3: v_prod; var min: v_prod);
    begin
        if(r1.cod < r2.cod) and (r1.cod < r3.cod) then begin
            min = r1;
            leer(det,r1);
        end
            else if (r2.cod <= r3.cod) then begin
                min := r2;
                leer(det2,r2);
            end
                else begin
                    min:= r3;
                    leer(det3,r3);
                end;
    end;

var
    regM:prod;
    min,regD1,regD2,regD3: v_prod;

    mae1:maestro;
    det1,det2,det3: detalle;
begin
    Assing(mae1,'Maestro');
    Assing(det1,'Detalle1');
    Assing(det2,'Detalle2'),
    Assign(det3,'Detalle3');
    
    reset(mae1); reset(det1); reset(det2); reset(det3);
    
    leer(det1, regD1); leer(det2, regD2); leer(det3, regD3);

    minimo(regD1,regD2,regD3,min);

    while(mid.cod <> valoralto) do begin
        read(mae1,regM);
        while(regM.cod <> min.cod) do
            read(mae1,regM);
        while(regM.cod = min.cod) do begin
            regM.cant:= regM.cant - min.cv;
            minimo(regD1,regD2,regD3,min);
        end;
        seek(mae1,filepos(mae1)-1);
        write(mae1,regm);
    end;
end;