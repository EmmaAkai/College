{Ejemplo de eliminar con la tecnica de LISTA INVERTIDA}

procedure ELIMINAR(maestro: archivo);
    var 
        novela,indice: Novela;
        cod:integer;
        ok:boolean;
    begin
        ok:=false;
        write('INGRESE CODIGO DE LA NOVELA QUE DESEA ELIMINAR: ');
        readln(cod); //leo el codigo de la novela a eliminar
        writeln('');

        leer(maestro,indice); //guardo en INDICE el PRIMER dato de el archivo maestro
        leer(maestro,novela); //guardo en NOVELA el SEGUNDO dato de el archivo maestro

        {Mientras el codigo de la novela <> valorAlto y no se haya encontrado la novela}
        while (novela.codigo <> valorAlto) and (not ok) do begin //entro al while
            if(novela.codigo = cod) then begin //si encontre la novela a eliminar
                ok:=true; //ok = true
                novela.codigo := indice.codigo;//cambio el cod de la novela por el cod del indice 

                seek(maestro,filepos(maestro)-1);//me posiciono en la novela a eliminar
                indice.codigo := filepos(maestro) * -1; //Guardo en indice la posicion que elimine
                write(maestro,novela);//escribo la novela con el codigo cambiado por el indice en el archivo maestro

                seek(maeestro,0);//me posiciono en el primer registro del archivo
                write(maestro,indice); //escribo la posicion del archivo que elimine en el primer registro del archivo
            end
            else
                leer(maestro,novela);//SI NO ENCONTRE LA NOVELA, leo la siguiente novela
        end;
        if(ok) then
            writeln('NOVELA ELIMINADA') //informo que la novela fue eliminada
        else
            writeln('NOVELA NO ENCONTRADA'); //informo que la novela no fue encontrada
    end;


//EJEMPLO DE AGREGAR A UN ARCHIVO CON LISTA INVERTIDA

procedure Agregar(var maestro: archivo);
var
    act, indice: producto;
    novela: Novela;
    pos: integer;
begin
    reset(maestro); //abro el archivo maestro
    writeln('-- Agregar Novela --');
    writeln('');
    leerNovela(Novela); //leo los datos de la nove a agregar

    if(existeNovela(Novela.cod, maestro)) then //si la novela ya existe
        informarNovela(Novela)//informo que la novela ya existe
    else begin
        read(maestro, indice);//leo el primer registro el indice que tiene la pos al primer espacio libre
        pos:= indice.cod * -1;//guardo en pos la posicion del primer espacio libre (lo positivo{* -1})

        
        if(pos > 0) then begin //Si hay espacio libre disponible, reutilizarlo
            seek(maestro, pos);//me posiciono en el registro libre
            read(maestro, act);//guardo en ACT el registro libre que contiene la SIGUIENTE posición libre
            seek(maestro, pos);//Posicionar nuevamente en el registro libre
            write(maestro, novela);// Escribo el nuevo producto en el registro libre
            indice:= act;// actualizo el indice con la siguiente posición libre
            seek(maestro, 0);//me posiciono en el primer registro
            write(maestro, indice);// Escribo el indice la nueva en la primer posicion
        end
        else begin  // Si no hay espacio libre
            seek(maestro, filesize(maestro)); //me posiciono en el ultimo registro
            write(maestro, novela);//lo agrego al final del archivo
        end;

        writeln('- Se agrego la novela -'); //informo que la novela fue agregada
    end;
    close(maestro); //cierro el archivo
end;