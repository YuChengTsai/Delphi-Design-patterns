unit Unit1;

interface

uses
  SysUtils, Classes;

type
  Tbarbecuer = class
  public
    procedure BakeMutton;
    procedure BakeChickenWing;
  end;

  TCommand = class
  protected
    receiver: Tbarbecuer;
  public
    procedure Command(receiver: Tbarbecuer);
    procedure ExcuteCommand; virtual; abstract;
  end;

  TBakeMuttonCommand = class(TCommand)
  public
    constructor Create(receiver: TBarbecuer);
    procedure ExcuteCommand; override;
  end;

  TBakeChickenWing = class(TCommand)
  public
    constructor Create(receiver: TBarbecuer);
    procedure ExcuteCommand; override;
  end;

  TWaiter = class
  private
    command: TCommand;
    Order: Tstringlist;
  public
    constructor Create;
    procedure Setorder(command: TCommand);
    procedure Notify;
  end;

implementation

{ TCommand }

procedure TCommand.Command(receiver: Tbarbecuer);
begin
  self.receiver := receiver;
end;

{ Tbarbecuer }

procedure Tbarbecuer.BakeChickenWing;
begin
  writeln('�N�Ϧצ�!')
end;

procedure Tbarbecuer.BakeMutton;
begin
  writeln('�N���צ�!')
end;

{ TBakeMuttonCommand }

constructor TBakeMuttonCommand.Create(receiver: TBarbecuer);
begin
  inherited Command(receiver);
end;

procedure TBakeMuttonCommand.ExcuteCommand;
begin
  receiver.BakeMutton;
end;

{ TBakeChickenWing }

constructor TBakeChickenWing.Create(receiver: TBarbecuer);
begin
  inherited Command(receiver);
end;

procedure TBakeChickenWing.ExcuteCommand;
begin
  receiver.BakeChickenWing;
end;

{ TWaiter }

constructor TWaiter.Create;
begin
  order := TStringlist.Create;
end;

procedure TWaiter.Notify;
begin
  command.ExcuteCommand;
end;

procedure TWaiter.Setorder(command: TCommand);
begin
  {if command = TBakeMuttonCommand. then
    writeln('�A�ȥ�: ���ͤw�g�S���F�A���I�O���N�סC');}

  self.command := command;
end;

end.

