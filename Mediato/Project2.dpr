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

  c1.Declare('�����o�֪Z�A�_�h�n�o�ʾԪ��I');
  c2.Declare('�ڭ̨S���֪Z�A�]���ȾԪ��I');

  readln

  // Insert user code here
end.