unit Unit1;

interface

uses
  SysUtils;

type
  THandsetsoft = class
  public
    procedure Run; virtual; abstract;
  end;

  THandsetGame = class(THandsetsoft)
  public
    procedure Run; override;
  end;

  THandsetAddresslist = class(THandsetsoft)
  public
    procedure Run; override;
  end;

  THandsetBrand = class
  protected
    Soft: THandsetsoft;
  public
    procedure SetHandsetSoft(soft: THandsetSoft);
    procedure Run; virtual; abstract;
  end;

  THandsetBrandN = class(THandsetBrand)
  public
    procedure Run; override;
  end;

  THandsetBrandM = class(THandsetBrand)
  public
    procedure Run; override;
  end;

implementation

{ THandsetGame }

procedure THandsetGame.Run;
begin
  writeln('執行手機遊戲');
end;

{ THandsetAddresslist }

procedure THandsetAddresslist.Run;
begin
  writeln('執行手機通訊錄');
end;

{ THandsetBrand }

procedure THandsetBrand.SetHandsetSoft(soft: THandsetSoft);
begin
  self.Soft := soft;
end;

{ THandsetBrandN }

procedure THandsetBrandN.Run;
begin
  soft.Run;
end;

{ THandsetBrandM }

procedure THandsetBrandM.Run;
begin
  soft.Run
end;

end.
 