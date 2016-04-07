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
    writeln(format('當前時間: %s點 上午工作，精神百倍', [inttostr(w.hour)]))
  else begin
    w.setstate(TNoonState.Create);
    w.WriteProgram;
  end;
end;

{ TNoonState }

procedure TNoonState.WriteProgram(w: TWork);
begin
  if w.hour < 13 then
    writeln(format('當前時間: %s點 餓了，午飯；覺得睏，午休', [inttostr(w.hour)]))
  else begin
    w.setstate(TAfternoonState.Create);
    w.WriteProgram;
  end;
end;

{ TAfternoonState }

procedure TAfternoonState.WriteProgram(w: TWork);
begin
  if w.hour < 17 then
    writeln(format('當前時間: %s點 下午狀態還不錯，繼續努力', [inttostr(w.hour)]))
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
      writeln(format('當前時間: %s點 加班哦，疲累至極', [inttostr(w.hour)]))
    else begin
      w.SetState(TSleepingState.Create);
      w.WriteProgram;
    end;
end;

{ TSleepingState }

procedure TSleepingState.WriteProgram(w: TWork);
begin
  writeln(format('當前時間: %s點 不行了，睡著了', [inttostr(w.hour)]))
end;

{ TRestState }

procedure TRestState.WriteProgram(w: TWork);
begin
  writeln(format('當前時間: %s點 下班回家了。', [inttostr(w.hour)]));
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
  writeln(format('當前時間: %s點 老闆要我們強制下班。', [inttostr(w.hour)]));
  w.SetState(TRestState.Create);
end;

end.

