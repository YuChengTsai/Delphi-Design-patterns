unit Unit1;

interface

uses
  SysUtils, Classes;

type
  TAction = class;

  Tperson = class
  protected
    _action: string;
  public
    property Action: string read _action write _action;
    procedure Accept(visitor: TAction); virtual; abstract;
  end;

  TMan = class(Tperson)
  public
    procedure Accept(visitor: TAction); override;
  end;

  TWoman = class(Tperson)
  public
    procedure Accept(visitor: TAction); override;
  end;

  TAction = class
  public
    procedure GetManConclusion(man: Tman); virtual; abstract;
    procedure GetWoManConclusion(Woman: TWoman); virtual; abstract;
  end;

  TSuccess = class(TAction)
  public
    procedure GetManConclusion(man: Tman); override;
    procedure GetWoManConclusion(Woman: TWoman); override;
  end;

  TObjectStructure = class
  private
    elements: Tlist;
  public
    constructor Create;
    procedure Attach(element: Tperson);
    procedure Detach(element: Tperson);
    procedure Display(visitor: TAction);
  end;

implementation

{ TSuccess }

procedure TSuccess.GetManConclusion(man: Tman);
begin
  writeln(format('%s%s時，背後多半有一個偉大的旅人', [TMan.ClassName, self.className]));
end;

procedure TSuccess.GetWoManConclusion(Woman: TWoman);
begin
  writeln(format('%s%s時，背後多半有一個不成功的藍人', [TWoMan.ClassName, self.className]));
end;

{ TMan }

procedure TMan.Accept(visitor: TAction);
begin
  visitor.GetManConclusion(self);
end;

{ TWoman }

procedure TWoman.Accept(visitor: TAction);
begin
  visitor.GetWoManConclusion(self);
end;

{ TObjectStructure }

procedure TObjectStructure.Attach(element: Tperson);
begin
  elements.Add(element);
end;

constructor TObjectStructure.Create;
begin
  elements := Tlist.Create;
end;

procedure TObjectStructure.Detach(element: Tperson);
begin
  elements.Remove(element);
end;

procedure TObjectStructure.Display(visitor: TAction);
var
  i: integer;
  e: Tperson;
begin
  while e in elements do
    e.Accept(visitor);

  {for i := elements.Count - 1 downto 0 do
    if e in elements.Items[i] then
      e.Accept(visitor); }
end;

end.

