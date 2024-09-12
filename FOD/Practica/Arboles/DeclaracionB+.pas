
DECLARACION B

TDato = record
    Codigo : Longint
    Nombre : string[50]
End
TNodo = record
    Cantclaves : integer
    Claves: array [1..M-1] of TDato
    Hijos: array [1..M] of integer
    Sig : integer
End
Ab = file of TNodo;

-------------------------------------

DECLARACION B+


TDato = record
    Codigo : Longint
    Nombre : string[50]
End
TNodo = record
    Cantclaves : integer
    Claves: array [1..M-1] of TDato
    Hijos: array [1..M] of integer
    Sig : integer
End
Ab = file of TNodo