inherited FRM_Estados: TFRM_Estados
  Caption = 'Estados'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited TB_Cadastro: TToolBar
    inherited DBN_Cadastro: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited GBX_Cadastro: TGroupBox
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
    object LBL_Nome: TLabel
      Left = 55
      Top = 72
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
    object LBL_Sigla: TLabel
      Left = 330
      Top = 72
      Width = 27
      Height = 13
      Caption = 'Sigla'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBE_Codigo: TDBEdit
      Left = 96
      Top = 32
      Width = 121
      Height = 21
      DataField = 'CODIGO_ESTADO'
      DataSource = DS_Generico
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Nome: TDBEdit
      Left = 96
      Top = 69
      Width = 228
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME_ESTADO'
      DataSource = DS_Generico
      TabOrder = 1
    end
    object DBE_Sigla: TDBEdit
      Left = 366
      Top = 72
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      DataField = 'SIGLA_ESTADO'
      DataSource = DS_Generico
      TabOrder = 2
    end
  end
  inherited GBX_Consulta: TGroupBox
    inherited DBG_Consulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_ESTADO'
          Title.Caption = 'Nome do Estado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGLA_ESTADO'
          Title.Caption = 'Sigla'
          Visible = True
        end>
    end
  end
  inherited DS_Generico: TDataSource
    DataSet = DM_Principal.CDS_Estados
  end
end
