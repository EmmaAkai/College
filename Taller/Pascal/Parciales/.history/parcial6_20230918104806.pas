program parcial6;
	
type
		infoPedido=record
			cliente:integer;
			dia:1..31;
			combos:integer;
			monto:real;
		end;	

		lista=^nodoL;
		nodoL=record
			dato:infoPedido;
			sig:lista;
		end;	
		
		info=record
			cliente:integer;
			L:lista;
		end;	
		
		arbol=^nodoA;
		nodoA=record
			dato:info;
			HI:arbol;
			HD:arbol;
		end;	

procedure leerPedido(var p:infoPedido);
	begin
		writeln('Cliente:');
		readln(p.cliente);
		if (p.cliente <> 0) then begin
			writeln('Dia');
			readln(p.dia);
			writeln('Combos');
			readln(p.combos);
			writeln('Monto');
			readln(p.monto);
		end;
	end;
	
procedure agregarAdelante(var L:lista; p:infoPedido);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=p;
			nue^.sig:=nil;
			L:=nue;
		end;
	
	
procedure insertarEnArbol(var a:arbol; p:infoPedido);
	begin
		if ( a = nil) then begin
			new(a);
			a^.dato.cliente:=p.cliente;
			a^.HI:=nil;
			a^.HD:=nil;
			
			a^.dato.L:=nil;
			agregarAdelante(a^.dato.L,p);
		end
		else
			if (p.cliente < a^.dato.cliente) then insertarEnArbol(a^.HI,p)
				else
					if (p.cliente > a^.dato.cliente) then insertarEnArbol(a^.HD,p)
						else
							agregarAdelante(a^.dato.L,p);
	end;
		

procedure cargarArbol (var a:arbol);
	var
		p:InfoPedido;
	begin
		leerPedido(p);
		while(p.cliente<>0) do begin
			insertarEnArbol(a,p);
			leerPedido(p);
		end;
	end;	


procedure imprimirDatos(p:infoPedido);
	begin
			writeln('Dia: ', p.dia);
			writeln('Combos: ',p.combos);
			writeln('Monto: ',p.monto:2:2);
	end;
procedure imprimir(L:lista);
	begin
		while (L<>nil) do begin
			imprimirDatos(L^.dato);
			L:=L^.sig;
		end;
	end;

procedure recorrerArbol(a:arbol; cli:integer);
	begin
		if (a<>nil) then begin
			if( cli = a^.dato.cliente) then begin
				imprimir(a^.dato.L);
			end;	
			recorrerArbol(a^.HI,cli);
			recorrerArbol(a^.HD,cli);
		end;
	end;
	

procedure imprimirCompras(a:arbol);
	var
		cli:integer;
	begin
		writeln('ingrese el cliente a buscar:');
		readln(cli);
		writeln('Compras realizadas por el cliente ', cli);
		recorrerArbol(a,cli);
	end;	


var
	a:arbol;
begin
	a:=nil;
	cargarArbol(a);
	imprimirCompras(a);
end.

