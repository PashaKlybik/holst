object Metrika: TMetrika
  Left = 81
  Top = 218
  BorderIcons = [biSystemMenu]
  Caption = 'Halstead metrics'
  ClientHeight = 500
  ClientWidth = 559
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Clean_But: TButton
    Left = 8
    Top = 455
    Width = 145
    Height = 41
    Caption = 'Clear'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Clean_ButClick
  end
  object Analyze_But: TButton
    Left = 432
    Top = 454
    Width = 121
    Height = 41
    Caption = 'Procseed'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Analyze_ButClick
  end
  object Memo_inputFile: TMemo
    Left = 8
    Top = 8
    Width = 297
    Height = 441
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 2
  end
  object MemoFunctionNames: TMemo
    Left = 319
    Top = 7
    Width = 234
    Height = 441
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
end
