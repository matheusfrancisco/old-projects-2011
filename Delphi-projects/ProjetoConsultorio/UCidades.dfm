inherited FRM_Cidades: TFRM_Cidades
  Caption = 'Cidades'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited TB_Cadastro: TToolBar
    inherited DBN_Cadastro: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited GBX_Cadastro: TGroupBox
    object LBL_Nome: TLabel
      Left = 55
      Top = 75
      Width = 32
      Height = 13
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LBL_Estado: TLabel
      Left = 49
      Top = 115
      Width = 38
      Height = 13
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LBL_Codigo: TLabel
      Left = 49
      Top = 35
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBE_Codigo: TDBEdit
      Left = 93
      Top = 32
      Width = 121
      Height = 21
      DataField = 'CODIGO_CIDADE'
      DataSource = DS_Generico
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Nome: TDBEdit
      Left = 102
      Top = 72
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME_CIDADE'
      DataSource = DS_Generico
      TabOrder = 1
    end
    object DBL_Estado: TDBLookupComboBox
      Left = 102
      Top = 112
      Width = 145
      Height = 21
      DataField = 'ESTADO_CIDADE'
      DataSource = DS_Generico
      KeyField = 'CODIGO_ESTADO'
      ListField = 'NOME_ESTADO'
      ListSource = DS_Estado
      TabOrder = 2
    end
  end
  inherited GBX_Consulta: TGroupBox
    inherited DBG_Consulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_CIDADE'
          Title.Caption = 'CIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO_CIDADE'
          Title.Caption = 'ESTADO'
          Visible = True
        end>
    end
  end
  inherited DS_Generico: TDataSource
    DataSet = DM_Principal.CDS_Cidades
  end
  object DS_Estado: TDataSource
    DataSet = DM_Principal.CDS_Estados
    Left = 216
    Top = 240
  end
end
