{El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que
ofrece: 1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla
con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se
conoce el nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una
sola suscripción. La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.
}
Program Ejercicio12;
type
	estring=string[30];

	Subs=array[1..4] of real; 			//Precios ya inicializados
	CantxSub=array[1..4] of integer; 	//cant por sub


	clientes=record
		nombre:estring;
		dni:Longint;
		edad:integer;
		tipo:1..4;
	end;
	ListaClientes=^PunCliente;
	PunCliente=record
		data:clientes;
		sig:ListaClientes;
	end;

procedure LeerRegistro(var Cli:clientes);
	begin
		readln(cli.dni);
		if (cli.dni <> 0) then begin
			readln(cli.nombre);
			readln(cli.edad);
			readln(cli.tipo);
		end;
	end;
procedure CargarClientes(var PriCliente:ListaClientes; cli:clientes);
	var
		nuevo:ListaClientes;
	begin
		new(nuevo); nuevo^.data:=cli; nuevo^.sig:=PriCliente;
		PriCliente:=nuevo;
	end;

procedure CargarLista(PriCliente:ListaClientes);
	var
		cli:clientes;
	begin
		LeerRegistro(cli);
		while(cli.dni <> 0) do begin
			cargarClientes(PriCliente,cli);
			LeerRegistro(cli);
		end;
	end;

{calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.}

procedure Maxs(subs:CantxSub;var maxSub1,MaxSub2:integer);
	var
		i,max1,max2:integer;
	begin
		max1:=-1;Max2:=-1;
		for i:= 1 to 4 do begin
			if(subs[i]>max1) then begin
				max2:=max1;
				max1:=subs[i];
				MaxSub2:=MaxSub1;
				MaxSub1:=i;
			end
			else if (subs[i]>max2) then begin
				max2:=subs[i];
				MaxSub2:=i;
			end;

		end;
	end;

{- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.}
function CondicionC(edad,tipo:integer):boolean;
	begin
		CondicionC:=(edad > 40) and ((tipo=4) or (tipo=3));
	end;
Procedure GenerarLista (var clientes2:ListaClientes; cli:clientes);
	var
		nuevo,ant,act:ListaClientes;
	begin
		new(nuevo); nuevo^.data:=cli; nuevo^.sig:=nil;
		ant:=clientes2;act:=clientes2;
		while (act <> nil) and (act^.data.dni > nuevo^.data.dni) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act <> nil) then begin
			if (ant = act) then
				clientes2:=nuevo
			else 
				ant^.sig:=nuevo;
			nuevo^.sig:=act;
		end;
	end;

Procedure Analizar (Clientes:ListaClientes; susc:subs ; var CantSub:CantxSub; var total:real;var maxSub1,maxSub2:integer; var Clientes2:ListaClientes);
	begin
		while (Clientes <> nil) do begin
			CantSub[Clientes^.data.tipo]:=CantSub[Clientes^.data.tipo]+1;
			clientes:=clientes^.sig;
			total:=total+susc[Clientes^.data.tipo];
			if (CondicionC(clientes^.data.edad,Clientes^.data.tipo)) then
				GenerarLista(Clientes2,Clientes^.data);
		end;
		Maxs(CantSub,maxSub1,MaxSub2)
	end;


{---------------PROGRAMA PRINCIPAL---------------}
var
	PriCliente,PriCliente2:ListaClientes;
	susc:subs;
	CantSub:CantxSub;
	total:real;
	i,maxSub1,MaxSub2:integer;
begin
	PriCliente:=nil;total:=0;
	for i:= 1 to 4 do CantSub[i]:=0;
	//CargarVector(susc);//SE DISPONE
	CargarLista(PriCliente);
	Analizar(PriCliente,susc,CantSub,total,maxsub1,maxsub2,PriCliente);	
	writeln('La ganancia total es ',total);
	writeln('Las 2 subs con mas susc son ',maxsub1,' y ',maxsub2);
	readln()
end.