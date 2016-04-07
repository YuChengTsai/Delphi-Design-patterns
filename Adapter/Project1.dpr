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
  b := TForward.Create('¤Ú¸¦º¸');
  b.Attack;

  m := TGuards.Create('³Á§J®æ¹p­}');
  m.Attack;

  ym := TTranslator.Create('«À©ú');
  ym.Attack;
  ym.Defense;

  readln;
  // Insert user code here
end.