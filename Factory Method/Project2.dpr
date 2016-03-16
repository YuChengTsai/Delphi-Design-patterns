program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
factory : IFactory;
hugong : TNightingale;
studentA : TNightingale;
begin
  factory := TUndergraduateFactory.create;
  studentA := factory.createNightingale();
  studentA.sweep;
  studentA.Wash;
  studentA.Buyrich;
  readln;
  // Insert user code here
end.