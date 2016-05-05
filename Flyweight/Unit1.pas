unit Unit1;

interface

uses
  SysUtils, Classes;

type
  TFlyweight = class
  public
    procedure Operation(extrinsicstate: integer); virtual; abstract;
  end;

  TConcreteFlyweight = class(TFlyweight)
  public
    procedure Operation(extrinsicstate: integer); override;
  end;

  TUnsharedConcreteFlyweight = class(TFlyweight)
  public
    procedure Operation(extrinsicstate: integer); override;
  end;

  TFlyweightFactory = class
  private
    Hashtable: Tlist;
  public
    constructor Create;
    function GetFlyweight(key: string): TFlyweight;
  end;

implementation

{ TConcreteFlyweight }

procedure TConcreteFlyweight.Operation(extrinsicstate: integer);
begin
  writeln('具體Flyweight: ' + extrinsicstate);

end;

{ TUnsharedConcreteFlyweight }

procedure TUnsharedConcreteFlyweight.Operation(extrinsicstate: integer);
begin
  writeln('不共用的具體Flyweight: ' + extrinsicstate);

end;

{ TFlyweightFactory }

constructor TFlyweightFactory.Create;
begin
  hashtable := TList.Create;
  hashtable.()
end;

function TFlyweightFactory.GetFlyweight(key: string): TFlyweight;
begin

end;

end.
 