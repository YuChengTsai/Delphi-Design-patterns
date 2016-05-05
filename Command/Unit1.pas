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
  writeln('烤羊肉串!')
end;

procedure Tbarbecuer.BakeMutton;
begin
  writeln('烤雞肉串!')
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
    writeln('服務生: 雞翅已經沒有了，請點別的烤肉。');}

  self.command := command;
end;

end.

