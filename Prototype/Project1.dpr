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

  a.Resume('大鳥');
  a.SetPersonalinfo('男', '29');
  a.SetWorkExperience('1998-2000', 'XX公司');

  b.Assign(a);
  b.SetWorkExperience('1998-2006', 'YY公司');

  c := a;
  c.SetPersonalinfo('男', '24');

  a.Display;
  b.Display;
  C.Display;

  readln;

  // Insert user code here
end.