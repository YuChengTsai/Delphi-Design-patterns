unit Unit2;

interface

uses
  SysUtils;

type
  TOperation = class
  private
    _NumberA: double;
    _NumberB: double;
    function get_NumberA: double;
    function get_NumberB: double;
    procedure set_NumberA(const Value: double);
    procedure set_NumberB(const Value: double);
  public
    function GetResult: double; virtual; abstract;
  published
    property NumberA: double read get_NumberA write set_NumberA;
    property NumberB: double read get_NumberB write set_NumberB;
  end;

  TOperatuibAdd = class(TOperation)
  public
    function GetResult: double; override;
  end;

  TOperatuibSub = class(TOperation)
  public
    function GetResult: double; override;
  end;

  TOperatuibMul = class(TOperation)
  public
    function GetResult: double; override;
  end;

  TOperatuibDiv = class(TOperation)
  public
    function GetResult: double; override;
  end;

  TOperationFactory = class
  public
    class function CreateOperate(operate: string): TOperation;
  end;

implementation

{ TOperation }

function TOperation.get_NumberA: double;
begin
  Result := _NumberA;
end;

function TOperation.get_NumberB: double;
begin
  Result := _NumberB;
end;

procedure TOperation.set_NumberA(const Value: double);
begin
  _NumberA := value;
end;

procedure TOperation.set_NumberB(const Value: double);
begin
  _NumberB := value;
end;

{ TOperatuibAdd }

function TOperatuibAdd.GetResult: double;
begin
  Result := NumberA + NUmberB;
end;

{ TOperationFactory }

class function TOperationFactory.CreateOperate(
  operate: string): TOperation;
begin
  if operate = '+' then Result := TOperatuibAdd.Create
  else if operate = '-' then Result := TOperatuibSub.Create
  else if operate = '*' then Result := TOperatuibMul.Create
  else if operate = '/' then Result := TOperatuibDiv.Create;
end;

{ TOperatuibDiv }

function TOperatuibDiv.GetResult: double;
begin
  if NumberB = 0 then
  begin
    Result := 0;
    exit;
  end;
  Result := NumberA / NUmberB;
end;

{ TOperatuibsSub }

function TOperatuibSub.GetResult: double;
begin
  Result := NumberA - NUmberB;
end;

{ TOperatuibMul }

function TOperatuibMul.GetResult: double;
begin
  Result := NumberA * NUmberB;
end;

end.

