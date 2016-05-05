unit Unit1;

interface

uses
  SysUtils, Classes;

type
  TProduct = class
  private
    parts: TStringList;
  public
    constructor Create;
    procedure Add(Apart: string);
    procedure show;
  end;

  TBuilder = class
  public
    procedure BuildPartA; virtual; abstract;
    procedure BuildPartB; virtual; abstract;
    function GetResult: TProduct; virtual ; abstract;
  end;

  TConcreteBuilder1 = class(TBuilder)
  private
    product: Tproduct;
  public
    constructor Create;
    procedure BuildPartA; override;
    procedure BuildPartB; override;
    function GetResult: TProduct; override;
  end;

  TConcreteBuilder2 = class(TBuilder)
  private
    product: Tproduct;
  public
    constructor Create;
    procedure BuildPartA; override;
    procedure BuildPartB; override;
    function GetResult: TProduct; override;
  end;

  TDirector = class
  public
    procedure Construct(builder : TBuilder);
  end;

implementation

{ TProduct }

procedure TProduct.Add(Apart: string);
begin
  parts.Append(Apart);
end;

constructor TProduct.Create;
begin
  parts := TStringList.Create;
end;

procedure TProduct.show;
var
part : string;
i : integer;
begin
  writeln('產品 建立 ----');
  for i := 0 to parts.Count -1  do
    writeln(parts[i]);
end;

{ TConcreteBuilder1 }

procedure TConcreteBuilder1.BuildPartA;
begin
  product.Add('零件A');
end;

procedure TConcreteBuilder1.BuildPartB;
begin
  product.Add('零件B');
end;

constructor TConcreteBuilder1.Create;
begin
  product := TProduct.Create;
end;

function TConcreteBuilder1.GetResult: TProduct;
begin
  Result := Product;
end;

{ TConcreteBuilder2 }

procedure TConcreteBuilder2.BuildPartA;
begin
  product.Add('零件X');

end;

procedure TConcreteBuilder2.BuildPartB;
begin
  product.Add('零件Y');

end;

constructor TConcreteBuilder2.Create;
begin
  product := TProduct.Create;
end;

function TConcreteBuilder2.GetResult: TProduct;
begin
  Result := Product;
end;

{ TDirector }

procedure TDirector.Construct(builder: TBuilder);
begin
  builder.BuildPartA;
  builder.BuildPartB;
end;

end.
 