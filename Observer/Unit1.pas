unit Unit1;

interface

uses
  SysUtils, Classes;

type
  TNotifyEvent = procedure of object;

  ISubject = interface
    function getSub: string;
    procedure setSub(const Value: string);
    procedure Notify;
    property Subjectstate: string read getSub write setSub;
  end;

  TBoss = class(TInterfacedObject, ISubject)
  private
    action: string;
    FInvestors: TInterfaceList;
    function getSub: string;
    procedure setSub(const Value: string);
  public
    procedure Notify;
    property Subjectstate: string read getSub write setSub;
    procedure update(Delegate: TNotifyEvent);
  end;

  TSecretary = class(TInterfacedObject, ISubject)
  private
    action: string;
    FInvestors: TInterfaceList;
    function getSub: string;
    procedure setSub(const Value: string);
  public
    procedure Notify;
    property Subjectstate: string read getSub write setSub;
  end;

  TStockObserver = class
  private
    Name: string;
    Sub: ISubject;
  public
    procedure StockObserver(name: string; Sub: ISubject);
    procedure CloseStockMarket;
  end;

  TNBAObserver = class
  private
    Name: string;
    Sub: ISubject;
  public
    procedure NBAObserver(name: string; Sub: ISubject);
    procedure CloseNBADirectSeeding;
  end;

implementation

{ TBoss }

{procedure TBoss.Attach(observer: IObserver);
begin
  if FInvestors = nil then
    FInvestors := TInterfaceList.Create;
  if FInvestors.IndexOf(Observer) < 0 then
    FInvestors.Add(Observer);
end;}

{procedure TBoss.Detach(observer: IObserver);
begin
  if FInvestors <> nil then
  begin
    FInvestors.Remove(Observer);
    if FInvestors.Count = 0 then
    begin
      FInvestors.Free;
      FInvestors := nil;
    end;
  end;
end;}

function TBoss.getSub: string;
begin
  Result := action
end;

procedure TBoss.Notify;
var
  i: Integer;
begin
  {if FInvestors <> nil then
    for i := 0 to Pred(FInvestors.Count) do
      IObserver(FInvestors[i]).Update(Self);}
end;

procedure TBoss.setSub(const Value: string);
begin
  action := Value;
end;

procedure TBoss.update(Delegate: TNotifyEvent);
begin
  if Assigned(Delegate) then
    Delegate;
end;

{ TSecretary }

{procedure TSecretary.Attach(observer: IObserver);
begin
  if FInvestors = nil then
    FInvestors := TInterfaceList.Create;
  if FInvestors.IndexOf(Observer) < 0 then
    FInvestors.Add(Observer);
end;

procedure TSecretary.Detach(observer: IObserver);
begin
  if FInvestors <> nil then
  begin
    FInvestors.Remove(Observer);
    if FInvestors.Count = 0 then
    begin
      FInvestors.Free;
      FInvestors := nil;
    end;
  end;
end;}

function TSecretary.getSub: string;
begin
  Result := action
end;

procedure TSecretary.Notify;
var
  i: Integer;
begin
  {if FInvestors <> nil then
    for i := 0 to Pred(FInvestors.Count) do
      IObserver(FInvestors[i]).Update(Self);}
end;

procedure TSecretary.setSub(const Value: string);
begin
  action := Value;
end;

{ TStockObserver }

procedure TStockObserver.CloseStockMarket;
begin
  writeln(Sub.Subjectstate + name + ' 關閉股票行情，繼續工作！');
end;

procedure TStockObserver.StockObserver(name: string; Sub: ISubject);
begin
  self.Name := name;
  self.Sub := Sub;
end;

{ TNBAObserver }

procedure TNBAObserver.CloseNBADirectSeeding;
begin
  writeln(Sub.Subjectstate + name + ' 關閉NBA直播，繼續工作！');
end;

procedure TNBAObserver.NBAObserver(name: string; Sub: ISubject);
begin
  self.Name := name;
  self.Sub := Sub;
end;

end.

