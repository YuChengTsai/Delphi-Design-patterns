object Form1: TForm1
  Left = 192
  Top = 127
  Width = 393
  Height = 229
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 128
    Top = 24
    Width = 75
    Height = 25
    Caption = '+'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 64
    Width = 75
    Height = 25
    Caption = '-'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 128
    Top = 104
    Width = 75
    Height = 25
    Caption = '*'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 128
    Top = 144
    Width = 75
    Height = 25
    Caption = '/'
    TabOrder = 3
    OnClick = Button4Click
  end
end
