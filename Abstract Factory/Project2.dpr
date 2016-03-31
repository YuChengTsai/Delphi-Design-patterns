program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  user: TUser;
  dept: TDepartment;
  factory: IFactory;
  iu: IUser;
  id: IDepartment;
begin
  user := TUser.Create;
  dept := TDepartment.Create;

  //factory := TSqlServerFactory.Create;
  factory := TAccessFactory.Create;

  iu := factory.CreateUser;
  iu.Insert(user);
  iu.GetUser(1);

  id := factory.CreateDepartment;
  id.Insert(dept);
  id.GetDepartment(1);

  readln;
  // Insert user code here
end.