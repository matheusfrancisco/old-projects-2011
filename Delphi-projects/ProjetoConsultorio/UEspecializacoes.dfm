inherited FRM_Especializacoes: TFRM_Especializacoes
  Caption = 'Especializa'#231#245'es'
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
    object LBL_Descricao: TLabel
      Left = 32
      Top = 115
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBE_Codigo: TDBEdit
      Left = 102
      Top = 32
      Width = 121
      Height = 21
      DataField = 'CODIGO_ESPECIALIZACAO'
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
      DataField = 'NOME_ESPECIALIZACAO'
      DataSource = DS_Generico
      TabOrder = 1
    end
    object DBM_Descricao: TDBMemo
      Left = 102
      Top = 112
      Width = 185
      Height = 89
      DataField = 'DESCRICAO_ESPECIALIZACAO'
      DataSource = DS_Generico
      TabOrder = 2
    end
  end
  inherited GBX_Consulta: TGroupBox
    inherited DBG_Consulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_ESPECIALIZACAO'
          Title.Caption = 'ESPECIALIZA'#199#195'O'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_ESPECIALIZACAO'
          Title.Caption = 'C'#211'DIGO'
          Visible = True
        end>
    end
  end
  inherited DS_Generico: TDataSource
    DataSet = DM_Principal.CDS_Especializacoes
  end
end
