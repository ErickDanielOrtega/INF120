unit CNatural;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  { TNatural }

  TNatural = class
  private
    n: Integer;

  public
    constructor crear(n1: Integer);

    procedure setN(n1: Integer);
    function getN(): Integer;

    { Operaciones sobre Digitos }
    procedure insertar(digito, posicion: Integer);
    function obtener(posicion: Integer): Integer;
    procedure eliminar(posicion: Integer);
    function cantidad(): Integer;
    function sumar(): Integer;
    function pares(): Integer;
    function impares(): Integer;
    function primos(): Integer;
    function mayor(): Integer;
    function menor(): Integer;

    { Operaciones sobre Enteros }
    function invertir(): Integer;
    function capicua(): Boolean;
    function par(): Boolean;
    function impar(): Boolean;
    function primo(): Boolean;

    function binario(): String;
    function octal(): String;
    function hexadecimal(): String;
    function baseN(base: Integer): String;

    function romano(): String;
    function literal(): String;
  end;

implementation

constructor TNatural.crear(n1: Integer);
begin
  n := n1;
end;

procedure TNatural.setN(n1: Integer);
begin
  n := n1;
end;

function TNatural.getN(): Integer;
begin
  Result := n;
end;

procedure TNatural.insertar(digito, posicion: Integer);
var
  potencia: Integer;
  derecha: Integer;
  izquierda: Integer;
begin
  if (digito < 0) or (digito > 9) then
    Exit;

  if posicion < 0 then
    Exit;

  potencia := 1;

  while posicion > 0 do
  begin
    potencia := potencia * 10;
    posicion := posicion - 1;
  end;

  derecha := n mod potencia;
  izquierda := n div potencia;

  n := (izquierda * 10 + digito) * potencia + derecha;
end;


function TNatural.obtener(posicion: Integer): Integer;
var
  i: Integer;
  numero: Integer;
begin
  Result := -1;

  if posicion < 0 then
    Exit;

  numero := n;

  for i := 1 to posicion do
    numero := numero div 10;

  if numero > 0 then
    Result := numero mod 10;
end;


procedure TNatural.eliminar(posicion: Integer);
var
  potencia: Integer;
  derecha: Integer;
  izquierda: Integer;
begin
  if posicion < 0 then
    Exit;

  potencia := 1;

  while posicion > 0 do
  begin
    potencia := potencia * 10;
    posicion := posicion - 1;
  end;

  derecha := n mod potencia;
  izquierda := n div (potencia * 10);

  n := izquierda * potencia + derecha;
end;


function TNatural.cantidad(): Integer;
var
  numero: Integer;
begin
  if n = 0 then
  begin
    Result := 1;
    Exit;
  end;

  numero := n;
  Result := 0;

  while numero > 0 do
  begin
    numero := numero div 10;
    Result := Result + 1;
  end;
end;


function TNatural.sumar(): Integer;
var
  numero: Integer;
begin
  numero := n;
  Result := 0;

  while numero > 0 do
  begin
    Result := Result + (numero mod 10);
    numero := numero div 10;
  end;
end;


function TNatural.pares(): Integer;
var
  numero: Integer;
  digito: Integer;
begin
  numero := n;
  Result := 0;

  while numero > 0 do
  begin
    digito := numero mod 10;

    if digito mod 2 = 0 then
      Result := Result + 1;

    numero := numero div 10;
  end;
end;


function TNatural.impares(): Integer;
var
  numero: Integer;
  digito: Integer;
begin
  numero := n;
  Result := 0;

  while numero > 0 do
  begin
    digito := numero mod 10;

    if digito mod 2 <> 0 then
      Result := Result + 1;

    numero := numero div 10;
  end;
end;


function TNatural.primos(): Integer;
var
  numero: Integer;
  digito: Integer;
  i: Integer;
  esPrimo: Boolean;
begin
  numero := n;
  Result := 0;

  while numero > 0 do
  begin
    digito := numero mod 10;

    if digito >= 2 then
    begin
      esPrimo := True;

      for i := 2 to digito - 1 do
      begin
        if digito mod i = 0 then
          esPrimo := False;
      end;

      if esPrimo then
        Result := Result + 1;
    end;

    numero := numero div 10;
  end;
end;


function TNatural.mayor(): Integer;
var
  numero: Integer;
  digito: Integer;
begin
  if n = 0 then
  begin
    Result := 0;
    Exit;
  end;

  numero := n;
  Result := 0;

  while numero > 0 do
  begin
    digito := numero mod 10;

    if digito > Result then
      Result := digito;

    numero := numero div 10;
  end;
end;


function TNatural.menor(): Integer;
var
  numero: Integer;
  digito: Integer;
begin
  if n = 0 then
  begin
    Result := 0;
    Exit;
  end;

  numero := n;
  Result := 9;

  while numero > 0 do
  begin
    digito := numero mod 10;

    if digito < Result then
      Result := digito;

    numero := numero div 10;
  end;
end;

function TNatural.invertir(): Integer;
var
  numero: Integer;
  digito: Integer;
begin
  numero := n;
  Result := 0;

  while numero > 0 do
  begin
    digito := numero mod 10;
    Result := Result * 10 + digito;
    numero := numero div 10;
  end;
end;


function TNatural.capicua(): Boolean;
begin
  Result := n = invertir();
end;


function TNatural.par(): Boolean;
begin
  Result := n mod 2 = 0;
end;


function TNatural.impar(): Boolean;
begin
  Result := n mod 2 <> 0;
end;


function TNatural.primo(): Boolean;
var
  i: Integer;
begin
  if n < 2 then
  begin
    Result := False;
    Exit;
  end;

  Result := True;

  for i := 2 to n - 1 do
  begin
    if n mod i = 0 then
      Result := False;
  end;
end;

function TNatural.binario(): String;
var
  numero: Integer;
  digito: Integer;
begin
  numero := n;
  Result := '';

  if numero = 0 then
  begin
    Result := '0';
    Exit;
  end;

  while numero > 0 do
  begin
    digito := numero mod 2;

    if digito = 0 then
      Result := '0' + Result
    else
      Result := '1' + Result;

    numero := numero div 2;
  end;
end;

function TNatural.octal(): String;
var
  numero: Integer;
  digito: Integer;
begin
  numero := n;
  Result := '';

  if numero = 0 then
  begin
    Result := '0';
    Exit;
  end;

  while numero > 0 do
  begin
    digito := numero mod 8;

    Result := Chr(Ord('0') + digito) + Result;

    numero := numero div 8;
  end;
end;

function TNatural.hexadecimal(): String;
var
  numero: Integer;
  digito: Integer;
begin
  numero := n;
  Result := '';

  if numero = 0 then
  begin
    Result := '0';
    Exit;
  end;

  while numero > 0 do
  begin
    digito := numero mod 16;

    if digito < 10 then
      Result := Chr(Ord('0') + digito) + Result
    else if digito = 10 then
      Result := 'A' + Result
    else if digito = 11 then
      Result := 'B' + Result
    else if digito = 12 then
      Result := 'C' + Result
    else if digito = 13 then
      Result := 'D' + Result
    else if digito = 14 then
      Result := 'E' + Result
    else
      Result := 'F' + Result;

    numero := numero div 16;
  end;
end;

function TNatural.baseN(base: Integer): String;
var
  numero: Integer;
  digito: Integer;
begin
  Result := '';

  if (base < 2) or (base > 16) then
    Exit;

  numero := n;

  if numero = 0 then
  begin
    Result := '0';
    Exit;
  end;

  while numero > 0 do
  begin
    digito := numero mod base;

    if digito < 10 then
      Result := Chr(Ord('0') + digito) + Result
    else if digito = 10 then
      Result := 'A' + Result
    else if digito = 11 then
      Result := 'B' + Result
    else if digito = 12 then
      Result := 'C' + Result
    else if digito = 13 then
      Result := 'D' + Result
    else if digito = 14 then
      Result := 'E' + Result
    else
      Result := 'F' + Result;

    numero := numero div base;
  end;
end;

function TNatural.romano(): String;
var
  numero: Integer;
begin
  numero := n;
  Result := '';

  if (numero <= 0) or (numero > 3999) then
    Exit;

  while numero >= 1000 do
  begin
    Result := Result + 'M';
    numero := numero - 1000;
  end;

  if numero >= 900 then
  begin
    Result := Result + 'CM';
    numero := numero - 900;
  end;

  if numero >= 500 then
  begin
    Result := Result + 'D';
    numero := numero - 500;
  end;

  if numero >= 400 then
  begin
    Result := Result + 'CD';
    numero := numero - 400;
  end;

  while numero >= 100 do
  begin
    Result := Result + 'C';
    numero := numero - 100;
  end;

  if numero >= 90 then
  begin
    Result := Result + 'XC';
    numero := numero - 90;
  end;

  if numero >= 50 then
  begin
    Result := Result + 'L';
    numero := numero - 50;
  end;

  if numero >= 40 then
  begin
    Result := Result + 'XL';
    numero := numero - 40;
  end;

  while numero >= 10 do
  begin
    Result := Result + 'X';
    numero := numero - 10;
  end;

  if numero >= 9 then
  begin
    Result := Result + 'IX';
    numero := numero - 9;
  end;

  if numero >= 5 then
  begin
    Result := Result + 'V';
    numero := numero - 5;
  end;

  if numero >= 4 then
  begin
    Result := Result + 'IV';
    numero := numero - 4;
  end;

  while numero >= 1 do
  begin
    Result := Result + 'I';
    numero := numero - 1;
  end;
end;



function TNatural.literal(): String;
var
  numero: Integer;

  function unidad(x: Integer): String;
  begin
    case x of
      0: Result := '';
      1: Result := 'uno';
      2: Result := 'dos';
      3: Result := 'tres';
      4: Result := 'cuatro';
      5: Result := 'cinco';
      6: Result := 'seis';
      7: Result := 'siete';
      8: Result := 'ocho';
      9: Result := 'nueve';
    end;
  end;

  function decena(x: Integer): String;
  begin
    case x of
      10: Result := 'diez';
      11: Result := 'once';
      12: Result := 'doce';
      13: Result := 'trece';
      14: Result := 'catorce';
      15: Result := 'quince';
      16: Result := 'dieciseis';
      17: Result := 'diecisiete';
      18: Result := 'dieciocho';
      19: Result := 'diecinueve';
      20: Result := 'veinte';
      21: Result := 'veintiuno';
      22: Result := 'veintidos';
      23: Result := 'veintitres';
      24: Result := 'veinticuatro';
      25: Result := 'veinticinco';
      26: Result := 'veintiseis';
      27: Result := 'veintisiete';
      28: Result := 'veintiocho';
      29: Result := 'veintinueve';
      30: Result := 'treinta';
      40: Result := 'cuarenta';
      50: Result := 'cincuenta';
      60: Result := 'sesenta';
      70: Result := 'setenta';
      80: Result := 'ochenta';
      90: Result := 'noventa';
    end;
  end;

  function hasta999(x: Integer): String;
  var
    c, d, u: Integer;
  begin
    Result := '';

    if x < 100 then
    begin
      if x <= 29 then
        Result := decena(x)
      else
      begin
        d := (x div 10) * 10;
        u := x mod 10;

        Result := decena(d);

        if u > 0 then
          Result := Result + ' y ' + unidad(u);
      end;

      Exit;
    end;

    c := x div 100;
    x := x mod 100;

    case c of
      1:
        if x = 0 then
          Result := 'cien'
        else
          Result := 'ciento';

      2: Result := 'doscientos';
      3: Result := 'trescientos';
      4: Result := 'cuatrocientos';
      5: Result := 'quinientos';
      6: Result := 'seiscientos';
      7: Result := 'setecientos';
      8: Result := 'ochocientos';
      9: Result := 'novecientos';
    end;

    if x > 0 then
      Result := Result + ' ' + hasta999(x);
  end;

begin
  numero := n;

  if numero = 0 then
  begin
    Result := 'cero';
    Exit;
  end;

  if numero < 0 then
  begin
    Result := 'menos ' + hasta999(-numero);
    Exit;
  end;

  if numero < 1000 then
  begin
    Result := hasta999(numero);
    Exit;
  end;

  if numero < 1000000 then
  begin
    if numero div 1000 = 1 then
      Result := 'mil'
    else
      Result := hasta999(numero div 1000) + ' mil';

    numero := numero mod 1000;

    if numero > 0 then
      Result := Result + ' ' + hasta999(numero);

    Exit;
  end;

  Result := 'Numero fuera de rango';
end;

end.
end.
