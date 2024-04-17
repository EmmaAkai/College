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
	f=record
		dia:1..31;
		mes:1..12;
	end;
	prestamo=record
		ISBN:integer;
		numSocio:integer;
		fecha:f;
		cantdiasprest:integer;
	end;
		

{ARBOL NORMAL------------------------}

	arbol=^nodo;
	nodo=record
		dato:prestamo;
		HI:arbol;
		HD:arbol;
	end;
		
{ARBOL NORMAL------------------------}ñ


{ARBOL CON LISTA --------------------}
	lista=^nodoLista;
	nodoLista=record
		dato:prestamo;
		sig:lista;
	end;
		
	infoPrestamo=record
		codISBN:integer;
		ListaPres:lista;
	end;
		
	arbol2=^nodo2;
	nodo2=record
		dato:infoPrestamo;
		HI:arbol2;
		HD:arbol2;
	end;
{ARBOL CON LISTA --------------------}

		  
{a------------------------------}
procedure leerPrestamo(var p:prestamo);
	begin
		write('ISBN: ');
		readln(p.ISBN);
		if (p.ISBN <> -1) then begin
		write('Socio: ');
		readln(p.numSocio);
		write('Dia: ');
		readln(p.fecha.dia);
		write('Mes: ');
		readln(p.fecha.mes);
		writeln('Dias prestados:');
		readln(p.cantdiasprest);	
		end;
	end;
	
{Cargo arbol normal------------------------}
{procedure insertarEnArbol(var a:arbol; p:prestamo);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato := p;
			a^.HI := nil;
			a^.HD := nil;
		end
		else
			if (p.ISBN <= a^.dato.ISBN)  then insertarEnArbol(a^.HI,p)
				else insertarEnArbol(a^.HD,p)
				
	end; {}

procedure cargarArbol(var a:arbol);
	var
		p:prestamo;
	begin
		leerPrestamo(p);
		while(p.ISBN<>-1) do begin
			insertarEnArbol(a,p);
			leerPrestamo(p);
		end;
	end;		


{Imprimo el arbol1---------------------}
procedure imprmirArbol1(a:arbol);
	begin
		if(a<>nil) then begin
			writeln(a^.dato.ISBN);
			imprmirArbol1(a^.HI);
			imprmirArbol1(a^.HD);
		end;
	end;

var
	a:arbol;
begin
	cargarArbol(a);
	imprmirArbol1(a);
end.