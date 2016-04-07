unit Unit1;

interface

uses
  SysUtils;

type
  TPlayer = class
  protected
    name: string;
  public
    constructor Create(Aname: string);
    procedure Attack; Virtual; abstract;
    procedure Defense; Virtual; abstract;
  end;

  TForward = class(TPlayer)
  public
    procedure Attack; override;
    procedure Defense; override;
  end;

  TCenter = class(TPlayer)
  public
    procedure Attack; override;
    procedure Defense; override;
  end;

  TGuards = class(TPlayer)
  public
    procedure Attack; override;
    procedure Defense; override;
  end;

  TForeignCenter = class
  private
    _name: string;
  public
    property Name: string read _name write _name;
    procedure chinaAttack;
    procedure chinaDefense;
  end;

  TTranslator = class(TPlayer)
  private
    wjzf: TForeignCenter;
  public
    constructor Create(Aname: string);
    procedure Attack; override;
    procedure Defense; override;
  end;

implementation

{ TPlayer }

constructor TPlayer.Create(Aname: string);
begin
  self.name := Aname;
end;

{ TForward }

procedure TForward.Attack;
begin
  writeln(format('�e�W %s �i��', [name]));
end;

procedure TForward.Defense;
begin
  writeln(format('�e�W %s ���u', [name]));
end;

{ TCenter }

procedure TCenter.Attack;
begin
  writeln(format('���W %s �i��', [name]));
end;

procedure TCenter.Defense;
begin
  writeln(format('���W %s ���u', [name]));
end;

{ TGuards }

procedure TGuards.Attack;
begin
  writeln(format('��� %s �i��', [name]));
end;

procedure TGuards.Defense;
begin
  writeln(format('��� %s �i��', [name]));
end;

{ TForeignCenter }

procedure TForeignCenter.chinaAttack;
begin
  writeln(format('�~�y���W %s �i��', [name]));
end;

procedure TForeignCenter.chinaDefense;
begin
  writeln(format('�~�y���W %s ���u', [name]));
end;

{ TTranslator }

procedure TTranslator.Attack;
begin
  wjzf.chinaAttack;
end;

constructor TTranslator.Create(Aname: string);
begin
  wjzf := TForeignCenter.Create;
  wjzf.Name := Aname;
end;

procedure TTranslator.Defense;
begin
  wjzf.chinaDefense;
end;

end.
 