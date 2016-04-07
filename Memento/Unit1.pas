unit Unit1;

interface

uses
  SysUtils;

type
  TRoleStateMemento = class
  private
    _vit: integer;
    _atk: integer;
    _def: integer;
  public
    constructor Create(vit, atk, def: integer);
    property Vitality: integer read _vit write _vit;
    property Attack: integer read _atk write _atk;
    property Defense: integer read _def write _def;
  end;

  TGameRole = class
  private
    _vit: integer;
    _atk: integer;
    _def: integer;
  public
    property Vitality: integer read _vit write _vit;
    property Attack: integer read _atk write _atk;
    property Defense: integer read _def write _def;
    procedure StateDisplay;
    procedure GetInitState;
    procedure Fight;
    function SaveState: TRoleStateMemento;
    procedure RecoveryState(memento : TRoleStateMemento);
  end;

  TRoleStateCaretaker = class
  private
    _memento: TRoleStateMemento;
  public
    property memento: TRoleStateMemento read _memento write _memento;
  end;

implementation

{ TRoleStateMemento }

constructor TRoleStateMemento.Create(vit, atk, def: integer);
begin
  _vit := vit;
  _atk := atk;
  _def := def;
end;

{ TGameRole }

procedure TGameRole.Fight;
begin
  _vit := 0;
  _atk := 0;
  _def := 0;
end;

procedure TGameRole.GetInitState;
begin
  _vit := 100;
  _atk := 100;
  _def := 100;
end;

procedure TGameRole.RecoveryState(memento: TRoleStateMemento);
begin
  _vit := memento.Vitality;
  _atk := memento.Attack;
  _def := memento.Defense;
end;

function TGameRole.SaveState: TRoleStateMemento;
begin
  Result := TRoleStateMemento.Create(_vit, _atk, _def);
end;

procedure TGameRole.StateDisplay;
begin
  writeln('角色目前狀態:');
  writeln(format('體力: %d', [_vit]));
  writeln(format('攻擊力: %d', [_atk]));
  writeln(format('防禦力: %d', [_def]));
  writeln('');
end;

end.
