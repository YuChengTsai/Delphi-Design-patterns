unit Unit1;

interface

uses
  SysUtils;

type
  TUser = class
  private
    _id: integer;
    _name: string;
  public
    property ID: integer read _id write _id;
    property Name: string read _name write _name;
  end;

  TDepartment = class
  private
    _id: integer;
    _deptName: string;
  public
    property ID: integer read _id write _id;
    property deptName: string read _deptname write _deptname;
  end;

  IUser = interface
  procedure Insert(user: TUser);
  procedure GetUser(id: integer);
  end;

  IDepartment = interface
  procedure Insert(department: TDepartment);
  procedure GetDepartment(id: integer);
  end;

  TSqlserverUser = class(TInterfacedObject, IUser)
  public
    procedure Insert(user: TUser);
    procedure GetUser(id: integer);
  end;

  TAccessUser = class(TInterfacedObject, IUser)
  public
    procedure Insert(user: TUser);
    procedure GetUser(id: integer);
  end;

  TSqlserverDepartment = class(TInterfacedObject, IDepartment)
  public
    procedure Insert(department: TDepartment);
    procedure GetDepartment(id: integer);
  end;

  TAccessDepartment = class(TInterfacedObject, IDepartment)
  public
    procedure Insert(department: TDepartment);
    procedure GetDepartment(id: integer);
  end;

  IFactory = interface
  function CreateUser(): IUser;
  function CreateDepartment: IDepartment;
  end;

  TSqlServerFactory = class(TInterfacedobject, IFactory)
  public
    function CreateUser(): IUser;
    function CreateDepartment: IDepartment;
  end;

  TAccessFactory = class(TInterfacedobject, IFactory)
  public
    function CreateUser(): IUser;
    function CreateDepartment: IDepartment;
  end;

implementation

{ TSqlserverUser }

procedure TSqlserverUser.GetUser(id: integer);
begin
  writeln('�bSQL Server���ھ�ID�o��User��@����');
end;

procedure TSqlserverUser.Insert(user: TUser);
begin
  writeln('�bSQL Server����User��W�[�@������');
end;

{ TAssessUser }

procedure TAccessUser.GetUser(id: integer);
begin
  writeln('�bAccess���ھ�ID�o��User��@����');
end;

procedure TAccessUser.Insert(user: TUser);
begin
  writeln('�bAccess����User��W�[�@������');
end;

{ TSqlserverDepartment }

procedure TSqlserverDepartment.GetDepartment(id: integer);
begin
  writeln('�bSQL Server���ھ�ID�o��Department��@����');
end;

procedure TSqlserverDepartment.Insert(department: TDepartment);
begin
  writeln('�bSQL Server����Department��W�[�@������');
end;

{ TAssessDepartment }

procedure TAccessDepartment.GetDepartment(id: integer);
begin
  writeln('�bAccess���ھ�ID�o��Department��@����');
end;

procedure TAccessDepartment.Insert(department: TDepartment);
begin  
  writeln('�bAccess����Department��W�[�@������');
end;

{ TSqlServerFactory }

function TSqlServerFactory.CreateDepartment: IDepartment;
begin
  Result := TSqlServerDepartment.Create;
end;

function TSqlServerFactory.CreateUser: IUser;
begin
  Result := TSqlServerUser.Create;
end;

{ TAccessFactory }

function TAccessFactory.CreateDepartment: IDepartment;
begin
  Result := TAccessDepartment.Create;
end;

function TAccessFactory.CreateUser: IUser;
begin
  Result := TAccessUser.Create;
end;

end.
