unit Unit1;

interface

uses
  SysUtils;

type
  TCountry = class;

  TUnitedNations = class
  public
    procedure Declare(Amessage: string; Colleague: TCountry); virtual; abstract;
  end;

  TCountry = class
  protected
    mediator: TUnitedNations;
  public
    constructor Create(Amediator: TUnitedNations);
  end;

  TUSA = class(TCountry)
  public
    procedure Declare(Amessage: string);
    procedure GetMessage(Amseesge: string);
  end;

  TIraq = class(TCountry)
  public
    procedure Declare(Amessage: string);
    procedure GetMessage(Amessage: string);
  end;

  TUnitedNationsSecurityCouncil= class(TUnitedNations)
  private
    _colleague1: TUSA;
    _colleague2: TIraq;
  public
    property colleaque1 :TUSA write _colleague1;
    property colleaque2 :TIraq write _colleague2;
    procedure Declare(Amessage: string; colleague: TCountry); override;
  end;



implementation

{ TCountry }

constructor TCountry.Create(Amediator: TUnitedNations);
begin
  mediator := Amediator
end;

{ TUSA }

procedure TUSA.Declare(Amessage: string);
begin
  mediator.Declare(Amessage, self);
end;

procedure TUSA.GetMessage(Amseesge: string);
begin
  writeln('美國獲得對方資訊: ' + Amseesge);
end;

{ TIraq }

procedure TIraq.Declare(Amessage: string);
begin
  mediator.Declare(Amessage, self);
end;

procedure TIraq.GetMessage(Amessage: string);
begin
  writeln('伊拉克獲得對方資訊: ' + Amessage);
end;

{ TUnitedNationsSecurityCouncil1 }

procedure TUnitedNationsSecurityCouncil.Declare(Amessage: string;
  colleague: TCountry);
begin
  if colleague = _colleague1 then
    _colleague2.GetMessage(Amessage)
  else
    _colleague1.GetMessage(Amessage);
end;

end.
