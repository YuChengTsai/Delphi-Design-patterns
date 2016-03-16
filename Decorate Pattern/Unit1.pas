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
  writeln('裝扮的 ' + name);
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
  write('大T恤 ');
  inherited;
end;

{ TBigtrouser }

procedure TBigtrouser.show;
begin
  write('垮褲 ');
  inherited;
end;

{ TSneakers }

procedure TSneakers.show;
begin
  write('破球鞋 ');
  inherited;
end;

end.

 