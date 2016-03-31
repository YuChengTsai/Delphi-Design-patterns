program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  jijin : TFond;
begin

  jijin.BuyFund;
  jijin.SellFund;

  readln;
  // Insert user code here
end.