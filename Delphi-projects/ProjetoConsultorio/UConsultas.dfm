inherited FRM_Consultas: TFRM_Consultas
  Caption = 'Consultas'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited TB_Cadastro: TToolBar
    inherited DBN_Cadastro: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited GBX_Cadastro: TGroupBox
    Left = 10
    ExplicitLeft = 10
    object Label1: TLabel
      Left = 48
      Top = 32
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 48
      Top = 62
      Width = 41
      Height = 13
      Caption = 'Paciente'
    end
    object Label3: TLabel
      Left = 48
      Top = 92
      Width = 33
      Height = 13
      Caption = 'M'#233'dico'
    end
    object Label4: TLabel
      Left = 48
      Top = 122
      Width = 45
      Height = 13
      Caption = 'Conv'#234'nio'
    end
    object Label5: TLabel
      Left = 48
      Top = 152
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object DBE_Codigo: TDBEdit
      Left = 87
      Top = 29
      Width = 121
      Height = 21
      DataField = 'CODIGO_CONSULTA'
      DataSource = DS_Generico
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Data: TDBEdit
      Left = 77
      Top = 149
      Width = 121
      Height = 21
      DataField = 'DATA_CONSULTA'
      DataSource = DS_Generico
      TabOrder = 4
    end
    object DBL_Paciente: TDBLookupComboBox
      Left = 95
      Top = 60
      Width = 325
      Height = 21
      DataField = 'CODIGO_PACIENTE'
      DataSource = DS_Generico
      KeyField = 'CODIGO_PACIENTE'
      ListField = 'NOME_PACIENTE'
      ListSource = DS_Paciente
      TabOrder = 1
      OnCloseUp = DBL_PacienteCloseUp
    end
    object DBL_Medico: TDBLookupComboBox
      Left = 87
      Top = 90
      Width = 325
      Height = 21
      DataField = 'CODIGO_MEDICO'
      DataSource = DS_Generico
      KeyField = 'CODIGO_MEDICO'
      ListField = 'NOME_MEDICO'
      ListSource = DS_Medico
      TabOrder = 2
    end
    object DBL_Convenio: TDBLookupComboBox
      Left = 99
      Top = 120
      Width = 325
      Height = 21
      DataField = 'CODIGO_CONVENIO'
      DataSource = DS_Generico
      KeyField = 'CODIGO_CONVENIO'
      ListField = 'NOME_CONVENIO'
      ListSource = DS_Convenio
      TabOrder = 3
    end
  end
  inherited GBX_Consulta: TGroupBox
    inherited DBG_Consulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA_CONSULTA'
          Title.Caption = 'DATA DA CONSULTA'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_MEDICO'
          Title.Caption = 'M'#201'DICO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_PACIENTE'
          Title.Caption = 'PACIENTE'
          Width = 60
          Visible = True
        end>
    end
  end
  inherited DS_Generico: TDataSource
    DataSet = DM_Principal.CDS_Consultas
    OnDataChange = DS_GenericoDataChange
  end
  object DS_Paciente: TDataSource
    DataSet = DM_Principal.CDS_Pacientes
    Left = 424
    Top = 56
  end
  object DS_Medico: TDataSource
    DataSet = DM_Principal.CDS_Medicos
    Left = 424
    Top = 120
  end
  object DS_Convenio: TDataSource
    DataSet = DM_Principal.CDS_Paciente_Convenio
    Left = 424
    Top = 184
  end
end
