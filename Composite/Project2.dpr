program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
root, comp, comp1, comp2: ICompany;
begin
  root := TConcreteCompany.Create('�_���`���q');
  root.Add(THRDepartment.Create('�`���q�H�O�귽��'));
  root.Add(TFinanceDepartment.Create('�`���q�]�ȳ�'));

  comp := TConcreteCompany.Create('�W���تF�����q');
  comp.Add(THRDepartment.Create('�تF�����q�H�O�귽��'));
  comp.Add(TFinanceDepartment.Create('�تF�����q�]�ȳ�'));
  root.Add(comp);

  comp1 := TConcreteCompany.Create('�n�ʿ�ƳB');
  comp1.Add(THRDepartment.Create('�n�ʿ�ƳB�H�O�귽��'));
  comp1.Add(TFinanceDepartment.Create('�n�ʿ�ƳB�]�ȳ�'));
  comp.Add(comp1);

  comp2 := TConcreteCompany.Create('�C�{��ƳB');
  comp2.Add(THRDepartment.Create('�C�{��ƳB�H�O�귽��'));
  comp2.Add(TFinanceDepartment.Create('�C�{��ƳB�]�ȳ�'));
  comp.Add(Comp2);

  writeln('���c�ϡG');
  root.Display(1);

  writeln('¾�d�G');
  root.LineOfDuty;

  readln;
  // Insert user code here
end.