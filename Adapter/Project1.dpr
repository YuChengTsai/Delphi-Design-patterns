program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  b: TPlayer;
  m: TPlayer;
  ym : TPlayer;
begin
  b := TForward.Create('�ڸ���');
  b.Attack;

  m := TGuards.Create('���J��p�}');
  m.Attack;

  ym := TTranslator.Create('����');
  ym.Attack;
  ym.Defense;

  readln;
  // Insert user code here
end.