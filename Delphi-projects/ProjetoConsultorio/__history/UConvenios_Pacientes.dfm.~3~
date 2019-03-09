inherited FRM_Convenios_Pacientes: TFRM_Convenios_Pacientes
  Caption = 'Conv'#234'nios por Pacientes'
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
      Width = 41
      Height = 13
      Caption = 'Paciente'
    end
    object Label2: TLabel
      Left = 40
      Top = 98
      Width = 45
      Height = 13
      Caption = 'Conv'#234'nio'
    end
    object DBL_Paciente: TDBLookupComboBox
      Left = 85
      Top = 45
      Width = 350
      Height = 21
      DataField = 'CODIGO_PACIENTE'
      DataSource = DS_Generico
      KeyField = 'CODIGO_PACIENTE'
      ListField = 'NOME_PACIENTE'
      ListSource = DS_Pacientes
      TabOrder = 0
    end
    object DBL_Convenio: TDBLookupComboBox
      Left = 90
      Top = 96
      Width = 344
      Height = 21
      DataField = 'CODIGO_CONVENIO'
      DataSource = DS_Generico
      KeyField = 'CODIGO_CONVENIO'
      ListField = 'NOME_CONVENIO'
      ListSource = DS_Convenios
      TabOrder = 1
    end
  end
  inherited GBX_Consulta: TGroupBox
    inherited DBG_Consulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO_PACIENTE'
          Title.Caption = 'C'#211'DIGO DO PACIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_CONVENIO'
          Title.Caption = 'C'#211'DIGO DO CONV'#202'NIO'
          Visible = True
        end>
    end
  end
  inherited DS_Generico: TDataSource
    DataSet = DM_Principal.CDS_Convenios_Pacientes
  end
  object DS_Pacientes: TDataSource
    DataSet = DM_Principal.CDS_Pacientes
    Left = 408
    Top = 248
  end
  object DS_Convenios: TDataSource
    DataSet = DM_Principal.CDS_Convenios
    Left = 472
    Top = 248
  end
end
