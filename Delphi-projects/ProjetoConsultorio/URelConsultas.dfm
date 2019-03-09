inherited FRM_RelConsultas: TFRM_RelConsultas
  Caption = 'Relat'#243'rio de Consultas'
  ClientHeight = 320
  OnActivate = FormActivate
  ExplicitWidth = 347
  ExplicitHeight = 352
  PixelsPerInch = 96
  TextHeight = 13
  object RG_Selecao: TRadioGroup [0]
    Left = 8
    Top = 8
    Width = 325
    Height = 41
    Caption = 'Tipo de Relat'#243'rio'
    Columns = 4
    Items.Strings = (
      'Geral'
      'M'#233'dico'
      'Paciente'
      'Conv'#234'nio')
    TabOrder = 0
    OnClick = RG_SelecaoClick
  end
  object GB_Individual: TGroupBox [1]
    Left = 8
    Top = 55
    Width = 325
    Height = 74
    Caption = 'Individual'
    TabOrder = 1
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 16
      Top = 32
      Width = 297
      Height = 21
      TabOrder = 0
    end
  end
  object GB_Periodo: TGroupBox [2]
    Left = 8
    Top = 135
    Width = 325
    Height = 114
    Caption = 'Per'#237'odo'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 21
      Top = 72
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object DTP_Inicial: TDateTimePicker
      Left = 75
      Top = 24
      Width = 186
      Height = 21
      Date = 41202.399864722230000000
      Time = 41202.399864722230000000
      TabOrder = 0
    end
    object DTP_Final: TDateTimePicker
      Left = 75
      Top = 64
      Width = 186
      Height = 21
      Date = 41202.399891666670000000
      Time = 41202.399891666670000000
      TabOrder = 1
    end
  end
  object BitBtn1: TBitBtn [3]
    Left = 83
    Top = 272
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn [4]
    Left = 194
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Sair'
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  inherited DS_Generico: TDataSource
    Left = 288
    Top = 152
  end
end
