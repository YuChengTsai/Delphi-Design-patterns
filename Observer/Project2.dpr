program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';
var
  huhansan : Tboss;
  tongshi1 : Tstockobserver;
  tongshi2 : TNBAobserver;
begin
  huhansan := TBoss.Create;
  tongshi1 := Tstockobserver.Create;
  tongshi2 := TNBAobserver.Create;

  tongshi1.StockObserver('魏關托', huhansan);
  tongshi2.NBAObserver('易管查', huhansan);

  //huhansan.Detach(tongshi1);
  huhansan.Subjectstate := '我胡漢三回來了！';

  huhansan.update(tongshi1.CloseStockMarket);
  huhansan.update(tongshi2.CloseNBADirectSeeding);

  //huhansan.update()

  //huhansan.Notify;

  readln;
  // Insert user code here
end.