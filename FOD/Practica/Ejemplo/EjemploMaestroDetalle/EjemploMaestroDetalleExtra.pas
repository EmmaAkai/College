{Precondiciones del ejemplo
• Ambos archivos (maestro y detalle) están ordenados por
código del producto
• En el archivo detalle solo aparecen productos que
existen en el archivo maestro
• Cada producto del maestro puede ser, a lo largo del día,
vendido más de una vez, por lo tanto, en el archivo
detalle pueden existir varios registros correspondientes al
mismo producto}

program MaestroDetalleExtra;
const
    valoralto='9999';
type 
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
var
    regM: prod;
    regD: v_prod;
    MaeF: maestro;
    DetF: detalle;
    
    total: integer;

begin
    assing(MaeF,'Maestro');
    assing(DetF,'Detalle');
    {proceso principal-----------}
    reset(MaeF); reset(DetF);
    while(not eof(detF)) do begin
        read(maeF,regM);
        read(detF,regD);
        while (regM.cod <> regD.cod) do
                read(maeF,regM);
        while((not eof(detF)) and (regM.cod = regD.cod)) do begin
            regM.cant := regM.cant - regD.cv;
            read(detF, regD);
        end;
        if (not eof(detF)) then
                seek(detF,filepos(detF)-1);
        seek(maeF,filepos(maeF)-1);
        write(maeF,regM);
    end;
end.