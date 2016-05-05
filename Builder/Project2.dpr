program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
director : TDirector;
b1, b2 : TBuilder;
p1 ,p2 : TProduct;
begin
  director := TDirector.Create;
  b1 := TConcreteBuilder1.Create;
  b2 := TConcreteBuilder2.Create;

  director.construct(b1);
  p1 := TProduct.Create;
  p1 := b1.GetResult;
  p1.show;

  director.construct(b2);
  p2 := TProduct.Create;
  p2 := b2.GetResult;
  p2.show;

  readln;

  // Insert user code here
end.