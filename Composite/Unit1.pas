unit Unit1;

interface

uses
  SysUtils, Classes;

type
  ICompany = interface
    procedure Add(c: ICompany);
    function Remove(c: ICompany): ICompany;
    procedure Display(depth: integer);
    procedure LineOfDuty;
    function getname: string;
    procedure setname(Aname: string);
    property Name: string read getname write setname;
  end;

  TConcreteCompany = class(TInterfacedObject, ICompany)
  private
    FName: string;
    Fchildren: TInterfaceList;
    FHolder: ICompany;
    function getname: string;
    procedure setname(Aname: string);
  public
    constructor Create(name: string);
    destructor Destroy; override;
    procedure Add(c: ICompany);
    function Remove(c: ICompany): ICompany;
    procedure Display(depth: integer);
    procedure LineOfDuty;
    property Name: string read getname write setname;
  end;

  THRDepartment = class(TInterfacedObject, ICompany)
  private
    FName: string;
    function getname: string;
    procedure setname(Aname: string);
  public
    constructor Create(name: string);
    destructor Destroy; override;
    procedure Add(c: ICompany);
    function Remove(c: ICompany): ICompany;
    procedure Display(depth: integer);
    procedure LineOfDuty;
    property Name: string read getname write setname;
  end;

  TFinanceDepartment = class(TInterfacedObject, ICompany)
  private
    FName: string;
    function getname: string;
    procedure setname(Aname: string);
  public
    constructor Create(name: string);
    destructor Destroy; override;
    procedure Add(c: ICompany);
    function Remove(c: ICompany): ICompany;
    procedure Display(depth: integer);
    procedure LineOfDuty;
    property Name: string read getname write setname;
  end;

implementation

{ TConcreteCompany }

procedure TConcreteCompany.Add(c: ICompany);
begin
  Fchildren.Add(c);
end;

constructor TConcreteCompany.Create(name: string);
begin
  self.name := name;
  Fchildren := TInterfaceList.Create;
end;

destructor TConcreteCompany.Destroy;
begin
  Fchildren.Clear;
  FreeAndNil(Fchildren);
  inherited;
end;

procedure TConcreteCompany.Display(depth: integer);
var
  i: integer;
begin
  writeln(StringOfChar('-', depth) + Fname);
  for I := 0 to Fchildren.Count - 1 do begin
    ICompany(Fchildren.Items[i]).Display(depth + 2);
  end;
end;

function TConcreteCompany.getname: string;
begin
  Result := Fname;
end;

procedure TConcreteCompany.LineOfDuty;
var
  i: integer;
begin
  for i := 0 to Fchildren.Count - 1 do begin
    ICompany(Fchildren.Items[i]).LineOfDuty;
  end;
end;

function TConcreteCompany.Remove(c: ICompany): ICompany;
var
  i: integer;
begin
  FHolder := self;
  if FHolder <> nil then
  begin
    for i := 0 to Fchildren.Count -1 do begin
      if ((Fchildren.Items[i] as ICompany).name = c.name) then
      begin
        Fchildren.Remove(c);
      end;
    end;
    Result := FHolder
  end
  else begin
    Result := Self;
  end;
end;

procedure TConcreteCompany.setname(Aname: string);
begin
  Fname := Aname;
end;

{ THRDepartment }

procedure THRDepartment.Add(c: ICompany);
begin

end;

constructor THRDepartment.Create(name: string);
begin
  self.name := name;
end;

destructor THRDepartment.Destroy;
begin
  inherited;

end;

procedure THRDepartment.Display(depth: integer);
begin
  writeln(StringOfChar('-', depth) + Fname);
end;

function THRDepartment.getname: string;
begin
  Result := Fname;
end;

procedure THRDepartment.LineOfDuty;
begin
  writeln(format('%s 員工招聘交育訓練管理', [Fname]));
end;

function THRDepartment.Remove(c: ICompany): ICompany;
begin
  WriteLn('Cannot remove directly');
  Result := Self;
end;

procedure THRDepartment.setname(Aname: string);
begin
  Fname := Aname;
end;

{ TFinanceDepartment }

procedure TFinanceDepartment.Add(c: ICompany);
begin

end;

constructor TFinanceDepartment.Create(name: string);
begin
  self.name := name;
end;

destructor TFinanceDepartment.Destroy;
begin
  inherited;

end;

procedure TFinanceDepartment.Display(depth: integer);
begin
  writeln(StringOfChar('-', depth) + Fname);
end;

function TFinanceDepartment.getname: string;
begin
  Result := Fname;
end;

procedure TFinanceDepartment.LineOfDuty;
begin
  writeln(format('%s 公司財務收支管理', [Fname]));
end;

function TFinanceDepartment.Remove(c: ICompany): ICompany;
begin
  WriteLn('Cannot remove directly');
  Result := Self;
end;

procedure TFinanceDepartment.setname(Aname: string);
begin
  Fname := Aname;
end;

end.
 