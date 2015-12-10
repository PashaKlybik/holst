object Metrika: TMetrika
  Left = 81
  Top = 218
  BorderIcons = [biSystemMenu]
  Caption = #1040#1085#1072#1083#1080#1079' '#1082#1086#1076#1072' '#1087#1086' '#1084#1077#1090#1088#1080#1082#1077' '#1061#1086#1083#1089#1090#1077#1076#1072
  ClientHeight = 524
  ClientWidth = 1048
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label_UniqueOperator: TLabel
    Left = 440
    Top = 120
    Width = 260
    Height = 19
    Caption = #1063#1080#1089#1083#1086' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1093' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1074' (n1):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_UniqueOperand: TLabel
    Left = 440
    Top = 172
    Width = 253
    Height = 19
    Caption = #1063#1080#1089#1083#1086' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1093' '#1086#1087#1077#1088#1072#1085#1076#1086#1074' (n2):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_Operator: TLabel
    Left = 440
    Top = 8
    Width = 219
    Height = 19
    Caption = #1054#1073#1097#1077#1077' '#1095#1080#1089#1083#1086' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1074' (N1):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_Operand: TLabel
    Left = 440
    Top = 60
    Width = 212
    Height = 19
    Caption = #1054#1073#1097#1077#1077' '#1095#1080#1089#1083#1086' '#1086#1087#1077#1088#1072#1085#1076#1086#1074' (N2):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_Volume: TLabel
    Left = 749
    Top = 120
    Width = 260
    Height = 19
    Caption = #1054#1073#1098#1077#1084' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'( V = N * log2(n) ):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_Dictionary: TLabel
    Left = 749
    Top = 60
    Width = 249
    Height = 19
    Caption = #1057#1083#1086#1074#1072#1088#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' ( n = n1 + n2 ):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_Length: TLabel
    Left = 752
    Top = 8
    Width = 246
    Height = 19
    Caption = #1044#1083#1080#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' ( N = N1 + N2 ):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_TeoreticLength: TLabel
    Left = 440
    Top = 230
    Width = 277
    Height = 19
    Caption = #1058#1077#1086#1088#1077#1090#1080#1095#1077#1089#1082#1072#1103' '#1076#1083#1080#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' (N'#39'):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_TeoreticVolume: TLabel
    Left = 439
    Top = 352
    Width = 278
    Height = 19
    Caption = #1058#1077#1086#1088#1077#1090#1080#1095#1077#1089#1082#1080#1081' '#1086#1073#1098#1105#1084' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' (V'#39'):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_LevelOfQuality: TLabel
    Left = 440
    Top = 291
    Width = 306
    Height = 19
    Caption = #1059#1088#1086#1074#1077#1085#1100' '#1082#1072#1095#1077#1089#1090#1074#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1103' (L'#39'):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_ComplexityOfCoding: TLabel
    Left = 439
    Top = 464
    Width = 315
    Height = 19
    Caption = #1058#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1100' '#1082#1086#1076#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' (D):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_ComplexityUnderstanding: TLabel
    Left = 439
    Top = 404
    Width = 288
    Height = 19
    Caption = #1057#1083#1086#1078#1085#1086#1089#1090#1100' '#1087#1086#1085#1080#1084#1072#1085#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' (Ec):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_InformationContent: TLabel
    Left = 8
    Top = 576
    Width = 329
    Height = 19
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1086#1077' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' (I):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label_IntellectualEfforts: TLabel
    Left = 8
    Top = 632
    Width = 227
    Height = 19
    Caption = #1048#1085#1090#1077#1083#1083#1077#1082#1090#1091#1072#1083#1100#1085#1099#1077' '#1091#1089#1080#1083#1080#1103' (E):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo_Class1: TMemo
    Left = 8
    Top = 8
    Width = 409
    Height = 504
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Clean_But: TButton
    Left = 816
    Top = 395
    Width = 206
    Height = 41
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1082#1086#1076
    TabOrder = 1
    OnClick = Clean_ButClick
  end
  object Edit_UniqueOperator: TEdit
    Left = 440
    Top = 145
    Width = 249
    Height = 21
    TabOrder = 2
  end
  object Edit_UniqueOperand: TEdit
    Left = 440
    Top = 197
    Width = 249
    Height = 21
    TabOrder = 3
  end
  object Edit_AllOperator: TEdit
    Left = 440
    Top = 33
    Width = 249
    Height = 21
    TabOrder = 4
  end
  object Edit_AllOperand: TEdit
    Left = 440
    Top = 85
    Width = 249
    Height = 21
    TabOrder = 5
  end
  object Analyze_But: TButton
    Left = 816
    Top = 455
    Width = 206
    Height = 41
    Caption = #1040#1085#1072#1083#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1082#1086#1076
    TabOrder = 6
    OnClick = Analyze_ButClick
  end
  object Edit_Dictionary: TEdit
    Left = 749
    Top = 85
    Width = 233
    Height = 21
    TabOrder = 7
  end
  object Edit_Length: TEdit
    Left = 749
    Top = 33
    Width = 233
    Height = 21
    TabOrder = 8
  end
  object Edit_Volume: TEdit
    Left = 749
    Top = 145
    Width = 233
    Height = 21
    TabOrder = 9
  end
  object Edit_TeoreticLength: TEdit
    Left = 440
    Top = 264
    Width = 249
    Height = 21
    TabOrder = 10
  end
  object Edit_TeoreticVolume: TEdit
    Left = 439
    Top = 377
    Width = 250
    Height = 21
    TabOrder = 11
  end
  object EditLevelOfQuality: TEdit
    Left = 440
    Top = 316
    Width = 249
    Height = 21
    TabOrder = 12
  end
  object Edit_ComplexityOfCoding: TEdit
    Left = 440
    Top = 491
    Width = 249
    Height = 21
    TabOrder = 13
  end
  object Edit_ComplexityUnderstanding: TEdit
    Left = 439
    Top = 429
    Width = 250
    Height = 21
    TabOrder = 14
  end
  object Edit_InformationContent: TEdit
    Left = 368
    Top = 576
    Width = 121
    Height = 21
    TabOrder = 15
  end
  object Edit_IntellectualEfforts: TEdit
    Left = 368
    Top = 632
    Width = 121
    Height = 21
    TabOrder = 16
  end
end
