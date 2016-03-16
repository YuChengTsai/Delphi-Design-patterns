unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
oper : TOperation;
begin
oper := TOperationFactory.CreateOperate('+');
oper.NumberA := 5.62;
oper.NumberB := 6;

showmessage(FloatTostr(oper.GetResult));

end;

procedure TForm1.Button2Click(Sender: TObject);
var
oper : TOperation;
begin
oper := TOperationFactory.CreateOperate('-');
oper.NumberA := 5.62;
oper.NumberB := 6;

showmessage(FloatTostr(oper.GetResult));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
oper : TOperation;
begin
oper := TOperationFactory.CreateOperate('*');
oper.NumberA := 5.62;
oper.NumberB := 6;

showmessage(FloatTostr(oper.GetResult));
end;

procedure TForm1.Button4Click(Sender: TObject);
var
oper : TOperation;
begin
oper := TOperationFactory.CreateOperate('/');
oper.NumberA := 5.62;
oper.NumberB := 0;

showmessage(FloatTostr(oper.GetResult));
end;

end.
