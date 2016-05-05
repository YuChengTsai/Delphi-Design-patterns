program Project2;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  boy, boy1: TBarbecuer;
  bakeMuttonCommand1, bakeMuttonCommand2: TCommand;
  bakeChickenWingCommand1: TCommand;
  girl: TWaiter;
begin
  boy := Tbarbecuer.Create;
  boy1 := Tbarbecuer.Create;
  bakeMuttonCommand1 := TBakeMuttonCommand.Create(boy);
  bakeMuttonCommand2 := TBakeMuttonCommand.Create(boy1);
  bakeChickenWingCommand1 := TBakeChickenWing.Create(boy);
  girl := TWaiter.Create;

  girl.Setorder(bakeMuttonCommand1);
  girl.Notify;
  girl.Setorder(bakeMuttonCommand2);
  girl.Notify;
  girl.Setorder(bakeChickenWingCommand1);
  girl.Notify;

  readln;

  // Insert user code here
end.