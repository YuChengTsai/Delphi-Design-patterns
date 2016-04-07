unit Unit1;

interface

uses
  SysUtils;

type
  TWork = class;

  TState = class abstract(TObject)
  public
    procedure WriteProgram(w: TWork); virtual; abstract;
  end;

  TForennonState = class(TState)
  public
    procedure WriteProgram(w: TWork); override;
  end;

  TNoonState = class(TState)
  public
    procedure WriteProgram(w: TWork); override;
  end;

  TAfternoonState = class(TState)
  public
    procedure WriteProgram(w: TWork); override;
  end;

  TEveningState = class(TState)
  public
    procedure WriteProgram(w: Twork); override;
  end;

  TSleepingState = class(TState)
  public
    procedure WriteProgram(w: TWork); override;
  end;

  TRestState = class(TState)
  public
    procedure WriteProgram(w: TWork); override;
  end;

  TGetout = class(TState)
  public
    procedure WriteProgram(w: TWork); override;
  end;

  TWork = class
  private
    current: TState;
    _hour: integer;
    _finish: boolean;
    _getout: boolean;
  public
    constructor Create;
    property Hour: integer read _hour write _hour;
    property TaskFinished: boolean read _finish write _finish;
    procedure SetState(s: Tstate);
    procedure WriteProgram;
    property TaskGetOut: boolean read _getout write _getout;
  end;

implementation

{ TForennonState }

procedure TForennonState.WriteProgram(w: TWork);
begin
  if w.hour < 12 then
    writeln(format('��e�ɶ�: %s�I �W�Ȥu�@�A�믫�ʭ�', [inttostr(w.hour)]))
  else begin
    w.setstate(TNoonState.Create);
    w.WriteProgram;
  end;
end;

{ TNoonState }

procedure TNoonState.WriteProgram(w: TWork);
begin
  if w.hour < 13 then
    writeln(format('��e�ɶ�: %s�I �j�F�A�ȶ��Fı�o�t�A�ȥ�', [inttostr(w.hour)]))
  else begin
    w.setstate(TAfternoonState.Create);
    w.WriteProgram;
  end;
end;

{ TAfternoonState }

procedure TAfternoonState.WriteProgram(w: TWork);
begin
  if w.hour < 17 then
    writeln(format('��e�ɶ�: %s�I �U�Ȫ��A�٤����A�~��V�O', [inttostr(w.hour)]))
  else begin
    w.setstate(TEveningState.Create);
    w.WriteProgram;
  end;
end;

{ TEveningState }

procedure TEveningState.WriteProgram(w: Twork);
begin
  if w.TaskFinished then
  begin
    w.setstate(TRestState.Create);
    w.WriteProgram;
  end
  else if w.hour >= 20 then
  begin
    w.setstate(TGetOut.Create);
    w.WriteProgram;
  end
  else
    if w.hour < 21 then
      writeln(format('��e�ɶ�: %s�I �[�Z�@�A�h�֦ܷ�', [inttostr(w.hour)]))
    else begin
      w.SetState(TSleepingState.Create);
      w.WriteProgram;
    end;
end;

{ TSleepingState }

procedure TSleepingState.WriteProgram(w: TWork);
begin
  writeln(format('��e�ɶ�: %s�I ����F�A�εۤF', [inttostr(w.hour)]))
end;

{ TRestState }

procedure TRestState.WriteProgram(w: TWork);
begin
  writeln(format('��e�ɶ�: %s�I �U�Z�^�a�F�C', [inttostr(w.hour)]));
end;

{ TWork }

constructor TWork.Create;
begin
  current := TForennonState.Create;
end;

procedure TWork.SetState(s: Tstate);
begin
  current := s;
end;

procedure TWork.WriteProgram;
begin
  current.WriteProgram(self);
end;

{ TGetout }

procedure TGetout.WriteProgram(w: TWork);
begin
  writeln(format('��e�ɶ�: %s�I ����n�ڭ̱j��U�Z�C', [inttostr(w.hour)]));
  w.SetState(TRestState.Create);
end;

end.

