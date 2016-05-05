unit Unit1;

interface

uses
  SysUtils;

type
  TRequest = class
  public
    requestType: string;
    requestcontent: string;
    Number:integer;
  end;

  TManger = class
  protected
    name: string;
    superior: TManger;
  public
    constructor Create(Aname: string);
    procedure SetSuperior(Asuperior: TManger);
    procedure RequestApplications(Arequest: TRequest); virtual; abstract;
  end;

  TCommonManger = class(TManger)
  public
    procedure RequestApplications(Arequest: TRequest); override;
  end;

  TMajordomo = class(TManger)
  public
    procedure RequestApplications(Arequest: TRequest); override;
  end;

  TGeneralManger = class(TManger)
  public
    procedure RequestApplications(Arequest: TRequest); override;
  end;


implementation

{ TManger }

constructor TManger.Create(Aname: string);
begin
  self.name := Aname;
end;

procedure TManger.SetSuperior(Asuperior: TManger);
begin
  self.superior := Asuperior;
end;

{ TCommonManger }

procedure TCommonManger.RequestApplications(Arequest: TRequest);
begin
  if (Arequest.requestType = '叫安') and (Arequest.Number <= 2) then
    writeln(format('%s:%s 计秖%d 砆у',[name, Arequest.RequestContent, Arequest.Number]))
  else if not (superior = nil) then
    superior.RequestApplications(Arequest);
end;

{ TMajordomo }

procedure TMajordomo.RequestApplications(Arequest: TRequest);
begin
  if (Arequest.requestType = '叫安') and (Arequest.Number <= 5) then
    writeln(format('%s:%s 计秖%d 砆у',[name, Arequest.RequestContent, Arequest.Number]))
  else if not (superior = nil) then
    superior.RequestApplications(Arequest);
end;

{ TGeneralManger }

procedure TGeneralManger.RequestApplications(Arequest: TRequest);
begin
  if (Arequest.requestType = '叫安') then
    writeln(format('%s:%s 计秖%d 砆у',[name, Arequest.RequestContent, Arequest.Number]))
  else if not (superior = nil) then
    superior.RequestApplications(Arequest)
  else if (Arequest.requestType = '羱') and (Arequest.Number <= 500) then
    writeln(format('%s:%s 计秖%d 砆у',[name, Arequest.RequestContent, Arequest.Number]))
  else if (Arequest.requestType = '羱') and (Arequest.Number > 500) then
    writeln(format('%s:%s 计秖%d 弧',[name, Arequest.RequestContent, Arequest.Number]))
end;

end.
