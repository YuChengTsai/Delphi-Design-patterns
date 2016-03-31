unit Unit1;

interface

uses
  SysUtils;

type
  TStock1 = class
  public
    procedure Sell;
    procedure Buy;
  end;

  TNationalDebt1 = class
  public
    procedure Sell;
    procedure Buy;
  end;

  TRealty1 = class
  public
    procedure Sell;
    procedure Buy;
  end;

  TFond = class
  private
    gu1: TStock1;
    nd1: TNationalDebt1;
    rt1: TRealty1;
  public
    procedure BuyFund;
    procedure SellFund;
  end;

implementation

{ TStock1 }

procedure TStock1.Buy;
begin
  writeln('Buy Stock!');
end;

procedure TStock1.Sell;
begin
  writeln('Sell Stock!');
end;

{ TNationalDebt1 }

procedure TNationalDebt1.Buy;
begin
  writeln('Buy NationalDebt!');
end;

procedure TNationalDebt1.Sell;
begin
  writeln('Sell NationalDebt!');
end;

{ TRealty1 }

procedure TRealty1.Buy;
begin
  writeln('Buy Realty!');
end;

procedure TRealty1.Sell;
begin
  writeln('Sell Realty!');
end;

{ TFond }

procedure TFond.BuyFund;
begin
  gu1.Buy;
  nd1.Buy;
  rt1.Buy;
end;

procedure TFond.SellFund;
begin
  gu1.Sell;
  nd1.Sell;
  rt1.Sell;
end;

end.
