program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  UNSC: TUnitedNationsSecurityCouncil;
  c1: TUSA;
  c2: TIraq;
begin
  UNSC := TUnitedNationsSecurityCouncil.Create;
  c1 := TUSA.Create(UNSC);
  c2 := TIraq.Create(UNSC);

  UNSC.colleaque1 := c1;
  UNSC.colleaque2 := c2;

  c1.Declare('不准研發核武，否則要發動戰爭！');
  c2.Declare('我們沒有核武，也不怕戰爭！');

  readln

  // Insert user code here
end.