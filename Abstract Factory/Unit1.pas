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
  writeln('在SQL Server中根據ID得到User表一紀錄');
end;

procedure TSqlserverUser.Insert(user: TUser);
begin
  writeln('在SQL Server中給User表增加一條紀錄');
end;

{ TAssessUser }

procedure TAccessUser.GetUser(id: integer);
begin
  writeln('在Access中根據ID得到User表一紀錄');
end;

procedure TAccessUser.Insert(user: TUser);
begin
  writeln('在Access中給User表增加一條紀錄');
end;

{ TSqlserverDepartment }

procedure TSqlserverDepartment.GetDepartment(id: integer);
begin
  writeln('在SQL Server中根據ID得到Department表一紀錄');
end;

procedure TSqlserverDepartment.Insert(department: TDepartment);
begin
  writeln('在SQL Server中給Department表增加一條紀錄');
end;

{ TAssessDepartment }

procedure TAccessDepartment.GetDepartment(id: integer);
begin
  writeln('在Access中根據ID得到Department表一紀錄');
end;

procedure TAccessDepartment.Insert(department: TDepartment);
begin  
  writeln('在Access中給Department表增加一條紀錄');
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
