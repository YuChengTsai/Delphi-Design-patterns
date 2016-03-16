unit Unit1;

interface

uses
SysUtils;

type
  IGiveGift = Interface
    procedure GiveDolls;
    procedure GiveFlowers;
    procedure GiveChocolae;
  end;
  //被追求者
  TShoolgirl = class
  private
    function getname: string;
    procedure setname(Value: string);
  published
    property Name: string read getname write setname;
  private
    _name :string;
  end;

  //追求者
  TPursuit = class(TInterfacedObject, IGiveGift)
  public
    procedure pursuit(mm : TShoolgirl);
    procedure GiveDolls;
    procedure GiveFlowers;
    procedure GiveChocolae;
  private
    mm : TShoolgirl;
  end;

  //代理人
  TProxy = class(TInterfacedObject, IGiveGift)
  public
    procedure Proxy(mm : Tshoolgirl);
    procedure GiveDolls;
    procedure GiveFlowers;
    procedure GiveChocolae;
  private
    gg : TPursuit;
  end;

implementation

{ TPursuit }

procedure TPursuit.GiveChocolae;
begin
  writeln(mm.Name + '送你巧克力');
end;

procedure TPursuit.GiveDolls;
begin
  writeln(mm.Name + '送你洋娃娃');
end;

procedure TPursuit.GiveFlowers;
begin
  writeln(mm.Name + '送你花');
end;

procedure TPursuit.pursuit(mm: TShoolgirl);
begin
  self.mm := mm;
end;

{ TShoolgirl }

function TShoolgirl.getname: string;
begin
  Result := _name;
end;

procedure TShoolgirl.setname(Value: string);
begin
  _name := Value;
end;

{ TProxy }

procedure TProxy.GiveChocolae;
begin
  gg.GiveChocolae;
end;

procedure TProxy.GiveDolls;
begin
  gg.GiveDolls;
end;

procedure TProxy.GiveFlowers;
begin
  gg.GiveFlowers;
end;

procedure TProxy.Proxy(mm: Tshoolgirl);
begin
  gg := Tpursuit.Create;
  gg.pursuit(mm);
end;

end.
 