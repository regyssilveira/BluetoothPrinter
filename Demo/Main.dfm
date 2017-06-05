object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Demo Bluetooth Printer'
  ClientHeight = 412
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnImprimir: TButton
    Left = 623
    Top = 382
    Width = 121
    Height = 25
    Caption = 'Imprimir Texto'
    TabOrder = 0
    OnClick = btnImprimirClick
  end
  object cbxDevice: TComboBox
    Left = 8
    Top = 384
    Width = 256
    Height = 21
    Style = csDropDownList
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 738
    Height = 368
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
end
