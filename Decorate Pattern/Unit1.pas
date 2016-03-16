unit Unit1;

interface

uses
  SysUtils;

type
  TPerson = class
  public
    procedure person(name: string);
    procedure show; virtual;
  private
    name: string;
  end;

  TFinery = class(Tperson)
  protected
    component: Tperson;
  public
    procedure Decorate(component: Tperson);
    procedure show; override;
  end;

  TTshirts = class(TFinery)
  public
    procedure show; override;
  end;

  TBigtrouser = class(TFinery)
  public
    procedure show; override;
  end;

  TSneakers = class(TFinery)
  public
    procedure show; override;
  end;

implementation

{ TPerson }

procedure TPerson.person(name: string);
begin
  self.name := name;
end;

procedure TPerson.show;
begin
  writeln('�˧ꪺ ' + name);
end;

{ TFinery }

procedure TFinery.Decorate(component: Tperson);
begin
  self.component := component;
end;

procedure TFinery.show;
begin
  inherited;
    component.show;
end;

{ TTshirts }

procedure TTshirts.show;
begin
  write('�jT�� ');
  inherited;
end;

{ TBigtrouser }

procedure TBigtrouser.show;
begin
  write('���� ');
  inherited;
end;

{ TSneakers }

procedure TSneakers.show;
begin
  write('�}�y�c ');
  inherited;
end;

end.

 