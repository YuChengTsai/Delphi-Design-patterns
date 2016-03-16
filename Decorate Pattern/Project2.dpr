program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
 xc : TPerson;
 dtx : TTShirts;
 kk : Tbigtrouser;
 pqx : TSneakers;
Begin
  xc := TPerson.Create;
  dtx := TTShirts.Create;
  kk := Tbigtrouser.Create;
  pqx := TSneakers.Create;

  writeln('第一種裝扮');

  xc.Person('小菜');
  pqx.Decorate(xc);
  kk.Decorate(pqx);
  dtx.Decorate(kk);

  dtx.show;
  readln;
end.
