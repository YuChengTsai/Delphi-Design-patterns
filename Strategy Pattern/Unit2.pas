unit Unit2;

interface

uses
  SysUtils;

type
  TCashSuper = class(TObject)
  public
    function acceptCash(money: double): double; virtual; abstract;
  end;

  TCashNormal = class(TCashSuper)
  public
    function acceptCash(money: double): double; override;
  end;

  TCashRebate = class(TCashSuper)
  private
    moneyRebate: double;
  public
    procedure CashRebate(moneyRebate: string);
    function acceptCash(money: double): double; override;
  end;

  TCashReturn = class(TCashSuper)
  private
    moneyCodition: double;
    moneyReturn: double;
  public
    procedure CashReturn(moneyCodition, moneyReturn: string);
    function acceptCash(money: double): double; override;
  end;

  TCashFatory = class
  public
    class function CreateCashAccept(operate: string): TCashSuper;
  end;

  TCahsContext = class
  private
    cs : TCashSuper;
  public
    procedure Cashcontext(operate : string);
    function GetResult(money : double) : double;
  end;

implementation

{ TCashNormal }

function TCashNormal.acceptCash(money: double): double;
begin
  Result := money;
end;

{ TCashRebate }

function TCashRebate.acceptCash(money: double): double;
begin
  Result := money * moneyRebate;
end;

procedure TCashRebate.CashRebate(moneyRebate: string);
begin
  self.moneyRebate := StrToFloat(moneyRebate);
end;

{ TCashReturn }

function TCashReturn.acceptCash(money: double): double;
begin
  if money >= moneyCodition then
    result := money - (Round(money / moneyCodition)) * moneyReturn;
end;

procedure TCashReturn.CashReturn(moneyCodition, moneyReturn: string);
begin
  self.moneyCodition := StrToFloat(moneyCodition);
  self.moneyReturn := StrToFloat(moneyReturn);
end;

{ TCashFatory }

class function TCashFatory.CreateCashAccept(operate: string): TCashSuper;
var cr1 : TCashReturn;
cr2 : TCashrebate;
begin
{  if operate = '正常收費' then
  begin
    result := TCashNormal.Create
  end
  else if operate = '滿300送100' then
  begin
    cr1 := TCashReturn.Create;
    cr1.CashReturn('300', '100');
    result := cr1;
  end
  else if operate = '打8折' then
  begin
    cr2 := TCashRebate.Create;
    cr2.CashRebate('0.8');
    result := cr2;
  end;}
end;

{ TCahsContext }

procedure TCahsContext.Cashcontext(operate : string);
var cr1 : TCashReturn;
cr2 : TCashrebate;
begin
  if operate = '正常收費' then
  begin
    cs := TCashNormal.Create
  end
  else if operate = '滿300送100' then
  begin
    cr1 := TCashReturn.Create;
    cr1.CashReturn('300', '100');
    cs := cr1;
  end
  else if operate = '打8折' then
  begin
    cr2 := TCashRebate.Create;
    cr2.CashRebate('0.8');
    cs := cr2;
  end;
end;

function TCahsContext.GetResult(money: double): double;
begin
  Result := cs.acceptCash(money);
end;

end.

 