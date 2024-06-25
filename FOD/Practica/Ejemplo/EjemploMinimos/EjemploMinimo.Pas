procedure minimo(var vectorReg: reg_detalle; var min: producto; var deta: vector_detalle);
var
    i,pos_min: integer;
begin
    min.codigo := valoralto;
    pos_min := 0; //inicializo el minimo en 0 para saber si encontre un minimo
    for i := 1 to n do begin // recorro los 5 registros
        if (vectorReg[i].codigo <> valoralto) then  // si el registro no es valoralto
            if (vectorReg[i].codigo < min.codigo) then begin // si el codigo del registro es menor al minimo
                min := vectorReg[i]; // asigno el registro al minimo
                pos_min := i; 
            end;
    if (pos_min <> 0) then // si encontre un minimo
        leer(deta[pos_min], vectorReg[pos_min]); // leo el siguiente registro del archivo
    end;
end;

procedure minimo(var vecDetalle: vectorDetalle; var vecRegistros:vectorRegistros; var min: registro);
    var
        i,iMin:integer;
    begin
        iMin:=0;    //inicializo el indice minimo para saber si encontre un minimo
        min.cod:=valoralto; //inicializo el min.cod en valoralto para saber si encontre un cod minimo
        for i:= 1 to n do begin //recorro tdo el vector de registros
            if(vecRegistros[i].cod <> valoralto) then begin //si el cod no es valor alto entro
                if (vecCarrera[i].cod < min.cod) then begin //si el cod es menor al minimo
                    min := vecCarrera[i]; //asigno el registro mas menor al min
                    iMin:=i; //guardo el indice del minimo
                end;
            end;
        end;
        if(iMin <> 0) then begin //si encontre un minimo
            leer(vecDetalle[iMin],vecCarrera[iMin]); //leo el siguiente registro del archivo
        end; 
    end;


//-------------------------------------------------------------------
//SIN VECTOR --------------------------------------------------------
//-------------------------------------------------------------------

procedure minimo(var det1,det2:detalle; var p1,p2,min: pedido);
    begin
        if(p1.cod < p2.cod) then begin
            min:=p1;
            leer(det1,p1);
        end
        else begin
            min:=p2;
            leer(det2,p2);
        end;
    end;

procedure minimo(var det1,det2:detalle; var p1,p2,min: pedido; var suc:integer;);
    begin
        if(p1.cod < p2.cod) then begin
            min:=p1;
            suc:=1;
            leer(det1,p1);
        end
        else begin
            min:=p2;
            suc:=2;
            leer(det2,p2);
        end;
    end;

procedure minimo(var det1,det2,det3:detalle; var p1,p2,p3,min: pedido; var suc:integer;);
    begin
        if(p1.cod < p2.cod) then begin
            min:=p1;
            suc:=1;
            leer(det1,p1);
        end
        else if(p2.cod < p3.cod) then begin
            min:=p2;
            suc:=2;
            leer(det2,p2);
        end else begin
            min:=p3;
            suc:=3;
            leer(det3,p3);
        end;
    end;