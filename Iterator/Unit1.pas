unit Unit1;

interface

uses
  SysUtils, Classes;

type
  IIterator = interface
  function First: Tobject;
  function Next: Tobject;
  function IsDone: boolean;
  function CurrentItem: Tobject;
  end;

  IAggregate = interface
  function CreateIterator: IIterator;
  end;

  TConcreteAggregate = class(TInterfacedObject, IAggregate)
  private
    Fitems: TList;
    function getself(index:integer): Tobject;
    procedure setself(index: integer; value : Tobject);
  public
    function CreateIterator: IIterator;
    function getCount: integer;
    property self[index:integer] : Tobject read getself write setself;
   end;

  TConcreteIterator = class(TinterfacedObject, IIterator)
  private
    aggregate: TConcreteAggregate;
    current: integer;
  public
    constructor Create(aggregate: TConcreteAggregate);
    function First: Tobject;
    function Next: Tobject;
    function IsDone: boolean;
    function CurrentItem: Tobject;
  end;

implementation

{ TConcreteAggregate }

function TConcreteAggregate.CreateIterator: IIterator;
begin
  Fitems := TList.Create;
  Result := TConcreteIterator.Create(self);
end;

function TConcreteAggregate.getCount: integer;
begin
  Result := Fitems.Count;
end;

function TConcreteAggregate.getself(index:integer): Tobject;
begin
  Result := Fitems[index];
end;

procedure TConcreteAggregate.setself(index: integer; value : Tobject);
begin
  Fitems.Insert(index, value);
end;

{ TConcreteIterator }

constructor TConcreteIterator.Create(aggregate: TConcreteAggregate);
begin
  self.aggregate := aggregate;
end;

function TConcreteIterator.CurrentItem: Tobject;
begin

end;

function TConcreteIterator.First: Tobject;
begin
  Result := aggregate[0];
end;

function TConcreteIterator.IsDone: boolean;
begin
  Result := current >= aggregate.getCount;
end;

function TConcreteIterator.Next: Tobject;
var
ret: Tobject;
begin
  ret := nil;
  inc(current);
  if current < aggregate.getCount then
    ret = aggregate[current];
  Result := ret;
end;

end.
 