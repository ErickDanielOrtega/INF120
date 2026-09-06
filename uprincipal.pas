unit UPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  CNatural;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button12: TButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);

  private
    natural: TNatural;

    function verificarNatural(): Boolean;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.verificarNatural(): Boolean;
begin
  Result := True;

  if natural = nil then
  begin
    ShowMessage('Primero debe crear un número natural.');
    Result := False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  natural := nil;


  MenuItem4.OnClick := @MenuItem1Click;

  MenuItem5.OnClick := @MenuItem1Click;
  MenuItem6.OnClick := @MenuItem1Click;
  MenuItem7.OnClick := @MenuItem1Click;
  MenuItem8.OnClick := @MenuItem1Click;
  MenuItem9.OnClick := @MenuItem1Click;
  MenuItem10.OnClick := @MenuItem1Click;
  MenuItem11.OnClick := @MenuItem1Click;
  MenuItem12.OnClick := @MenuItem1Click;
  MenuItem13.OnClick := @MenuItem1Click;
  MenuItem14.OnClick := @MenuItem1Click;

  MenuItem15.OnClick := @MenuItem1Click;
  MenuItem16.OnClick := @MenuItem1Click;
  MenuItem17.OnClick := @MenuItem1Click;
  MenuItem18.OnClick := @MenuItem1Click;
  MenuItem19.OnClick := @MenuItem1Click;
  MenuItem20.OnClick := @MenuItem1Click;
  MenuItem21.OnClick := @MenuItem1Click;
  MenuItem22.OnClick := @MenuItem1Click;
  MenuItem23.OnClick := @MenuItem1Click;
  MenuItem24.OnClick := @MenuItem1Click;
  MenuItem25.OnClick := @MenuItem1Click;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  valor: Integer;
begin
  valor := StrToIntDef(Edit1.Text, -1);

  if valor < 0 then
  begin
    ShowMessage('Ingrese un número natural válido.');
    Exit;
  end;

  if natural = nil then
    natural := TNatural.crear(valor)
  else
    natural.setN(valor);

  ShowMessage('Natural creado: ' + IntToStr(natural.getN()));
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
var
  op: Integer;
  pos: Integer;
  dig: Integer;
  base: Integer;
  texto: String;
begin



  if Sender = MenuItem4 then
  begin
    Close;
    Exit;
  end;



  if Sender = MenuItem5 then
  begin
    if not verificarNatural() then
      Exit;

    pos := StrToIntDef(
      InputBox('Insertar', 'Ingrese la posición:', ''),
      -1
    );

    dig := StrToIntDef(
      InputBox('Insertar', 'Ingrese el dígito (0-9):', ''),
      -1
    );

    if (pos < 1) or (dig < 0) or (dig > 9) then
    begin
      ShowMessage('Datos inválidos.');
      Exit;
    end;

    natural.insertar(pos, dig);

    ShowMessage(
      'Dígito insertado.' + #13#10 +
      'Natural: ' + IntToStr(natural.getN())
    );

    Exit;
  end;



  if Sender = MenuItem6 then
  begin
    if not verificarNatural() then
      Exit;

    pos := StrToIntDef(
      InputBox('Obtener', 'Ingrese la posición:', ''),
      -1
    );

    if pos < 1 then
    begin
      ShowMessage('Posición inválida.');
      Exit;
    end;

    if pos > natural.cantidad() then
    begin
      ShowMessage('La posición no existe.');
      Exit;
    end;

    ShowMessage(
      'Dígito en la posición ' + IntToStr(pos) +
      ': ' + IntToStr(natural.obtener(pos))
    );

    Exit;
  end;

  if Sender = MenuItem7 then
  begin
    if not verificarNatural() then
      Exit;

    pos := StrToIntDef(
      InputBox('Eliminar', 'Ingrese la posición:', ''),
      -1
    );

    if pos < 1 then
    begin
      ShowMessage('Posición inválida.');
      Exit;
    end;

    if pos > natural.cantidad() then
    begin
      ShowMessage('La posición no existe.');
      Exit;
    end;

    natural.eliminar(pos);

    ShowMessage(
      'Dígito eliminado.' + #13#10 +
      'Natural: ' + IntToStr(natural.getN())
    );

    Exit;
  end;


  if Sender = MenuItem8 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Cantidad de dígitos: ' +
      IntToStr(natural.cantidad())
    );

    Exit;
  end;



  if Sender = MenuItem9 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Suma de los dígitos: ' +
      IntToStr(natural.sumar())
    );

    Exit;
  end;



  if Sender = MenuItem10 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Cantidad de dígitos pares: ' +
      IntToStr(natural.pares())
    );

    Exit;
  end;



  if Sender = MenuItem11 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Cantidad de dígitos impares: ' +
      IntToStr(natural.impares())
    );

    Exit;
  end;



  if Sender = MenuItem12 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Cantidad de dígitos primos: ' +
      IntToStr(natural.primos())
    );

    Exit;
  end;



  if Sender = MenuItem13 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Dígito mayor: ' +
      IntToStr(natural.mayor())
    );

    Exit;
  end;



  if Sender = MenuItem14 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Dígito menor: ' +
      IntToStr(natural.menor())
    );

    Exit;
  end;



  if Sender = MenuItem15 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Número invertido: ' +
      IntToStr(natural.invertir())
    );

    Exit;
  end;



  if Sender = MenuItem16 then
  begin
    if not verificarNatural() then
      Exit;

    if natural.capicua() then
      ShowMessage('El número es capicúa.')
    else
      ShowMessage('El número no es capicúa.');

    Exit;
  end;


  if Sender = MenuItem17 then
  begin
    if not verificarNatural() then
      Exit;

    if natural.par() then
      ShowMessage('El número es par.')
    else
      ShowMessage('El número no es par.');

    Exit;
  end;


  if Sender = MenuItem18 then
  begin
    if not verificarNatural() then
      Exit;

    if natural.impar() then
      ShowMessage('El número es impar.')
    else
      ShowMessage('El número no es impar.');

    Exit;
  end;


  if Sender = MenuItem19 then
  begin
    if not verificarNatural() then
      Exit;

    if natural.primo() then
      ShowMessage('El número es primo.')
    else
      ShowMessage('El número no es primo.');

    Exit;
  end;


  if Sender = MenuItem20 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Binario: ' +
      natural.binario()
    );

    Exit;
  end;


  if Sender = MenuItem21 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Octal: ' +
      natural.octal()
    );

    Exit;
  end;


  if Sender = MenuItem22 then
  begin
    if not verificarNatural() then
      Exit;

    ShowMessage(
      'Hexadecimal: ' +
      natural.hexadecimal()
    );

    Exit;
  end;


  if Sender = MenuItem23 then
  begin
    if not verificarNatural() then
      Exit;

    base := StrToIntDef(
      InputBox('Base N', 'Ingrese la base (2-36):', ''),
      -1
    );

    if (base < 2) or (base > 36) then
    begin
      ShowMessage('La base debe estar entre 2 y 36.');
      Exit;
    end;

    ShowMessage(
      'Base ' + IntToStr(base) + ': ' +
      natural.baseN(base)
    );

    Exit;
  end;


  if Sender = MenuItem24 then
  begin
    if not verificarNatural() then
      Exit;

    texto := natural.romano();

    ShowMessage(
      'Número romano: ' + texto
    );

    Exit;
  end;


  if Sender = MenuItem25 then
  begin
    if not verificarNatural() then
      Exit;

    texto := natural.literal();

    ShowMessage(
      'Número en literal: ' + texto
    );

    Exit;
  end;

end;

end.
