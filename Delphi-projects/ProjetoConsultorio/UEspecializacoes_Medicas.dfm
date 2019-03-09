inherited FRM_Especializacoes_Medicas: TFRM_Especializacoes_Medicas
  Caption = 'Especializa'#231#245'es M'#233'dicas'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited TB_Cadastro: TToolBar
    inherited DBN_Cadastro: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited GBX_Cadastro: TGroupBox
    object Label1: TLabel
      Left = 40
      Top = 48
      Width = 33
      Height = 13
      Caption = 'M'#233'dico'
    end
    object Label2: TLabel
      Left = 40
      Top = 98
      Width = 64
      Height = 13
      Caption = 'Especialidade'
    end
    object DBL_Medico: TDBLookupComboBox
      Left = 79
      Top = 48
      Width = 350
      Height = 21
      DataField = 'CODIGO_MEDICO'
      DataSource = DS_Generico
      KeyField = 'CODIGO_MEDICO'
      ListField = 'NOME_MEDICO'
      ListSource = DS_Medicos
      TabOrder = 0
    end
    object DBL_Especializacoes: TDBLookupComboBox
      Left = 110
      Top = 98
      Width = 319
      Height = 21
      DataField = 'CODIGO_ESPECIALIZACAO'
      DataSource = DS_Generico
      KeyField = 'CODIGO_ESPECIALIZACAO'
      ListField = 'NOME_ESPECIALIZACAO'
      ListSource = DS_Especializacoes
      TabOrder = 1
    end
  end
  inherited GBX_Consulta: TGroupBox
    inherited DBG_Consulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO_MEDICO'
          Title.Caption = 'C'#211'DIGO DO M'#201'DICO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_ESPECIALIZACAO'
          Title.Caption = 'C'#211'DIGO DA ESPECIALIZA'#199#195'O'
          Visible = True
        end>
    end
  end
  inherited DS_Generico: TDataSource
    DataSet = DM_Principal.CDS_Especializacoes_Medicas
  end
  object DS_Medicos: TDataSource
    DataSet = DM_Principal.CDS_Medicos
    Left = 472
    Top = 88
  end
  object DS_Especializacoes: TDataSource
    DataSet = DM_Principal.CDS_Especializacoes
    Left = 472
    Top = 152
  end
end
