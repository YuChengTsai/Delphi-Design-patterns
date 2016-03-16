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
  //�Q�l�D��
  TShoolgirl = class
  private
    function getname: string;
    procedure setname(Value: string);
  published
    property Name: string read getname write setname;
  private
    _name :string;
  end;

  //�l�D��
  TPursuit = class(TInterfacedObject, IGiveGift)
  public
    procedure pursuit(mm : TShoolgirl);
    procedure GiveDolls;
    procedure GiveFlowers;
    procedure GiveChocolae;
  private
    mm : TShoolgirl;
  end;

  //�N�z�H
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
  writeln(mm.Name + '�e�A���J�O');
end;

procedure TPursuit.GiveDolls;
begin
  writeln(mm.Name + '�e�A�v����');
end;

procedure TPursuit.GiveFlowers;
begin
  writeln(mm.Name + '�e�A��');
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
 