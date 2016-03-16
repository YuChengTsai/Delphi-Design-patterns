unit Unit1;

interface

uses
SysUtils;

type
TNightingale = class
public
  procedure sweep;
  procedure Wash;
  procedure Buyrich;
end;

TUndergraduate = class(TNightingale)
end;

TVolunteer = class(TNightingale)
end;

IFactory = Interface
 function createNightingale(): TNightingale;
end;

TUndergraduateFactory = class(TInterfacedObject, IFactory)
public
  function createNightingale(): TNightingale;
end;

TVolunteerFactory = class(TInterfacedObject, IFactory)
public
  function createNightingale(): TNightingale;
end;


implementation

{ TNightingale }

procedure TNightingale.Buyrich;
begin
  writeln('¶R¦Ì');

end;

procedure TNightingale.sweep;
begin
  writeln('±½¦a');
end;

procedure TNightingale.Wash;
begin
  writeln('¬~¦ç');
end;


{ TUndergraduateFactory }

function TUndergraduateFactory.createNightingale: TNightingale;
begin
  result := TUndergraduate.Create;
end;

{ TVolunteerFactory }

function TVolunteerFactory.createNightingale: TNightingale;
begin
  result := TVolunteer.Create;
end;

end.
 