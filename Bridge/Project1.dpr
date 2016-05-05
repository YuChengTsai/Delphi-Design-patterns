program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  ab: THandsetBrand;
begin
  ab:= THandsetBrandN.Create;

  ab.SetHandsetSoft(ThandsetGame.Create);
  ab.Run;

  ab.SetHandsetSoft(THandsetAddresslist.Create);
  ab.Run;

  ab := THandsetBrandM.Create;

  ab.SetHandsetSoft(THandsetGame.Create);
  ab.Run;

  ab.SetHandsetSoft(THandsetAddresslist.Create);
  ab.Run;

  ab.Free;

  readln;
  // Insert user code here
end.