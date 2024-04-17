{Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.}

program e2p4;


type

	prestamos=record
		ISBN:integer;
		numSocio:integer;
		fecha:f;
		cantdiasprest:integer;
		end
		
		f=record
			dia:1..31;
			mes:1..12;
		end;
		
		arbol:^nodo;
		nodo=record
			dato:prestamos;
			
			HI:arbol;
			HD:arbol;
		end;
		
		lista=^nodoL;
		nodoL=record
		  dato:prestamos;
		  sig:lista;
		end;
		
		
		infoPrestamo=record
			codISBN:integer;
			ListaPres:nodoL;
		end;
		
		arbol2:^nodo2;
		nodo2=record
			dato:infoPrestamo;
			HI:arbol2;
			HD:arbol2;
		end;
		
		
		  
{a------------------------------}
procedure leerPrestamos(var p:prestamos);
	begin
		write('ISBN');
		readln(p.ISBN);
		writeln('Socio:');
		readln(p.numSocio);
		write('Fecha:');
		read(p.fecha.dia);
		write('/')
		readln(p.fecha.mes);
		writeln('Dias prestados:')
		readln(p.cantdiasprest);
	end;
	
	
procedure cargarArbolISBN(var a1,a2:arbol; p:prestamos);
begin
  if(a=nil) then begin
    new(a);
    a^.dato:=p;
    a^.HI:=nil;
    a^.HD:=nil;
  end
  else 
    if(p.ISBN<=a^.dato.ISBN)then cargarArbolISBN(a^.HI,p)
    else cargarArbolISBN(a^.HD,p);
end

procedure AgregarAtras(var L,ult:listaPres; p:infoprestamos);
	var
		nue=lista;
	begin
		new(nue);
		nue^.dato:=p;
		nue^.sig=nil;
		if(l=nil) then L:=nue
			else ult^.sig:=nue;
		ult:=nue;
	end;


procedure cargarArbolPrestamo(var a:arbol2; p:prestamos);
begin
  if(a=nil) then begin
    new(a);
    a^.dato:=p;
    a^.dato.lista:=nil;
    a^.HI:=nil;
    a^.HD:=nil;
    
  end
  else 
    if(p.codISBN < a^.dato.codISBN)then cargarArbolISBN(a^.HI,p)
    else 
      if(p.codISBN>a^.dato.codISBN)then cargarArbolISBN(a^.HD,p);
      else
        agregarAtras(a.dato.lista, a.dato.lista,p);
end	
	
	
procedure crearARbol(var a:arbol);
var
  p:prestamos;
  andsb
begin
  leerPrestamos(p);
  while(p.ISBN<>-1) do begin
    cargarArbolPrestamo(a,p);
    cargarArbolISBN(a,p);
    leerPrestamos(p);
  end;
end
var
	L:lista;
begin
	L:=nil;
end.