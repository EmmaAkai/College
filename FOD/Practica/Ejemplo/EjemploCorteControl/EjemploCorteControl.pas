program CorteControl;
const
    valoralto='zzzz';
type
    str10=string[10];

    prov = record
        provincia,partido,cuidad:str10;
        cantVarones,cantMujeres,cantDesocupados: integer;
    end;

    instituto = file of prov;

procedure Leer(var archivo: instituto, var dato:prov);
    begin
        if(not eof(archivo)) then
            read(archivo,dato);
        else
            dato.provincia:= valoralto;
    end;

var
    regM: prov;
    inst: instituto;
    tVarones,tMujeres,tDesocupados: integer;
    tProvVar,tProvMuj,tProvDes: integer;
    antProv,antPart: str10;

begin
    assing(inst,'censo');
    reset(inst); 
    leer(inst,regM);
    writeln('Provincia: ', regM.provincia);
    writeln('Partido: ', regM.partido);
    writeln('Ciudad: ', regM.ciudad);
    writeln('Varones: ',regM.cantVarones);
    writeln('Mujeres: ', regM.cantMujeres);
    writeln('Desocupados: ', regM.cantDesocupados);
    {Se inicializan los contadores de personas------------------------}
    tVarones:=0; tMujeres:=0; tDesocupados:=0;
    {Se inicializan los contadores de las provincia-------------------}
    tProvVar:=0; tProvMuj:=0; tProvDes:=0;
    {-----------------------------------------------------------------}
    while(regM.provincia <> valoralto) do begin
        antProv:=regM.provincia;
        antPart:=regM.partido;
        while((antProv = regM.provincia) and (antPart = regM.partido)) do begin
            
            write(regM.cuidad, regM.cantVarones, regM.cantMujeres, regM.cantDesocupados);
            tVarones:= tVarones + regM.cantVarones;
            tMujeres:= tMujeres + regM.cantMujeres;
            tDesocupados:= tDesocupados + regM.cantDesocupados;
            leer(inst,regM);
        
        end;
        
        
        writeln('Total partido: ', tVarones,tMujeres,tDesocupados);
        tProvVar:= tProvVar + tVarones;
        tProvMuj:= tProvMuj + tMujeres;
        tProvDes:= tProvDes + tDesocupados;
        
        tVarones:= 0; tMujeres:=0; tDesocupados:=0;

        antPart:= regM.partido;
        if(antProv <> regM.provincia) then begin
            writeln('Total provincia: ',tProvVar, tprovMuj, tProvDes);
            tProvVar:= 0; tProvMuj:= 0; tProvDes:= 0;
            writeln('Provincia: ', regM.provincia);
        end;
        writeln('Partido: ', regM.partido);
    end;
end.