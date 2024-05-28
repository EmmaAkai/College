procedure leer (var archivo:detalle; var dato:v_prod);
begin
    if (not eof(archivo)) then 
        read (archivo,dato)
    else 
        dato.cod := valoralto;
    end;

begin
    assign (mae1, 'maestro'); assign (det1, 'detalle');
    reset (mae1); reset (det1);
    leer(det1,regd); {se procesan todos los registros del archivo det1}

    while (regd.cod <> valoralto) do begin
        read(mae1, regm);
        while (regm.cod <> regd.cod) do
            read (mae1,regm);
        { se procesan códigos iguales }
        while (regm.cod = regd.cod) do begin
            regm.cant := regm.cant - regd.cv;
            leer(det1,regd);
        end;
        {reubica el puntero}
        seek (mae1, filepos(mae1)-1);
        write(mae1,regm);
    end;
end.