program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var a,b,c :TResume;
begin
  a := TResume.Create;
  b := TResume.Create;
  c := TResume.Create;

  a.Resume('�j��');
  a.SetPersonalinfo('�k', '29');
  a.SetWorkExperience('1998-2000', 'XX���q');

  b.Assign(a);
  b.SetWorkExperience('1998-2006', 'YY���q');

  c := a;
  c.SetPersonalinfo('�k', '24');

  a.Display;
  b.Display;
  C.Display;

  readln;

  // Insert user code here
end.