unit Unit1;

interface

uses
  SysUtils, Classes;

type
  IIterator = interface
    procedure Next;
    function IsDone: boolean;
    function CurrentItem: string;
  end;

  IAggregate = interface
    function CreateIterator: IIterator;
  end;

  TConcreteAggregate = class(TInterfacedObject, IAggregate)
  private
    Fitems: Tstringlist;
    procedure setself(index: integer; value: string);
    function getself(index: integer): string;
  public
    constructor Create;
    function CreateIterator: IIterator;
    function getCount: integer;
    property self[index: integer]: string read getself write setself;
  end;

  TConcreteIterator = class(TInterfacedObject, IIterator)
  private
    aggregate: TConcreteAggregate;
    current: integer;
  public
    constructor Create(aggregate: TConcreteAggregate);
    procedure Next;
    function IsDone: boolean;
    function CurrentItem: string;
  end;

  TConcreteIteratorDesc = class(TInterfacedObject, IIterator)
  private
    aggregate: TConcreteAggregate;
    current :integer;
  public
    constructor Create(aggregate: TconcreteAggregate);
    procedure Next;
    function IsDone: boolean;
    function CurrentItem: string;
  end;

implementation

{ TConcreteAggregate }

constructor TConcreteAggregate.Create;
begin
  Fitems := TstringList.Create;
end;

function TConcreteAggregate.CreateIterator: IIterator;
begin
  //Result := TConcreteIterator.Create(self);
  Result := TConcreteIteratorDesc.Create(self);
end;

function TConcreteAggregate.getCount: integer;
begin
  Result := Fitems.Count;
end;

function TConcreteAggregate.getself(index: integer): string;
begin
  Result := Fitems[index]
end;

procedure TConcreteAggregate.setself(index: integer; value: string);
begin
  Fitems.Insert(index, value);
end;

{ TConcreteIterator }

constructor TConcreteIterator.Create(aggregate: TConcreteAggregate);
begin
  self.aggregate := aggregate;
end;

function TConcreteIterator.CurrentItem: string;
begin
  Result := aggregate.self[current]
end;

function TConcreteIterator.IsDone: boolean;
begin
  Result := current >= aggregate.getCount;
end;

procedure TConcreteIterator.Next;
begin
  inc(current);
end;

{ TConcreteIteratorDesc }

constructor TConcreteIteratorDesc.Create(aggregate: TconcreteAggregate);
begin
  self.aggregate := aggregate;
  current := aggregate.getCount - 1
end;

function TConcreteIteratorDesc.CurrentItem: string;
begin
  Result := aggregate.self[current]
end;

function TConcreteIteratorDesc.IsDone: boolean;
begin
  Result := current < 0;
end;

procedure TConcreteIteratorDesc.Next;
begin
  Dec(current);
end;

end.

