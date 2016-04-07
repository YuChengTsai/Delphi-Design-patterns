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
  writeln(format('前鋒 %s 進攻', [name]));
end;

procedure TForward.Defense;
begin
  writeln(format('前鋒 %s 防守', [name]));
end;

{ TCenter }

procedure TCenter.Attack;
begin
  writeln(format('中鋒 %s 進攻', [name]));
end;

procedure TCenter.Defense;
begin
  writeln(format('中鋒 %s 防守', [name]));
end;

{ TGuards }

procedure TGuards.Attack;
begin
  writeln(format('後衛 %s 進攻', [name]));
end;

procedure TGuards.Defense;
begin
  writeln(format('後衛 %s 進攻', [name]));
end;

{ TForeignCenter }

procedure TForeignCenter.chinaAttack;
begin
  writeln(format('外籍中鋒 %s 進攻', [name]));
end;

procedure TForeignCenter.chinaDefense;
begin
  writeln(format('外籍中鋒 %s 防守', [name]));
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
 