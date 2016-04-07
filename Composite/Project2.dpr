program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
root, comp, comp1, comp2: ICompany;
begin
  root := TConcreteCompany.Create('ㄊ羆そ');
  root.Add(THRDepartment.Create('羆そ戈方场'));
  root.Add(TFinanceDepartment.Create('羆そ癩叭场'));

  comp := TConcreteCompany.Create('地狥だそ');
  comp.Add(THRDepartment.Create('地狥だそ戈方场'));
  comp.Add(TFinanceDepartment.Create('地狥だそ癩叭场'));
  root.Add(comp);

  comp1 := TConcreteCompany.Create('玭ㄊ快ㄆ矪');
  comp1.Add(THRDepartment.Create('玭ㄊ快ㄆ矪戈方场'));
  comp1.Add(TFinanceDepartment.Create('玭ㄊ快ㄆ矪癩叭场'));
  comp.Add(comp1);

  comp2 := TConcreteCompany.Create('狢快ㄆ矪');
  comp2.Add(THRDepartment.Create('狢快ㄆ矪戈方场'));
  comp2.Add(TFinanceDepartment.Create('狢快ㄆ矪癩叭场'));
  comp.Add(Comp2);

  writeln('挡篶瓜');
  root.Display(1);

  writeln('戮砫');
  root.LineOfDuty;

  readln;
  // Insert user code here
end.