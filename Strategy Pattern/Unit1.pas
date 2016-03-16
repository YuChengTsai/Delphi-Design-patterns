unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    total : double;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
csuper : TCahsContext;
totalprices : double;
begin
  csuper := TCahsContext.Create;
  csuper.Cashcontext(combobox1.text);
  totalprices := csuper.GetResult(StrtoFloat(edit1.text) * StrtoFloat(edit2.text));
  total := total + totalprices;
  memo1.lines.Add('單價：' + edit1.text + ' 數量：' + edit2.text + ' ' + combobox1.text +
   ' 合計：' + FloattostrF(totalprices, ffNumber, 8, 0));
  label4.Caption :=FloattostrF(total, ffNumber, 8, 0);
end;

end.
