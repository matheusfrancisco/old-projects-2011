unit UDMPrincipal;

interface

uses
  SysUtils, Classes, WideStrings, DBXOracle, FMTBcd, DBClient, Provider, DB,
  SqlExpr, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave;

type
  TDM_Principal = class(TDataModule)
    SQL_ConexaoBD: TSQLConnection;
    SQL_Estados: TSQLQuery;
    DSP_Estados: TDataSetProvider;
    CDS_Estados: TClientDataSet;
    SQL_EstadosCODIGO_ESTADO: TFMTBCDField;
    SQL_EstadosNOME_ESTADO: TWideStringField;
    SQL_EstadosSIGLA_ESTADO: TWideStringField;
    CDS_EstadosCODIGO_ESTADO: TFMTBCDField;
    CDS_EstadosNOME_ESTADO: TWideStringField;
    CDS_EstadosSIGLA_ESTADO: TWideStringField;
    SQL_Cidades: TSQLQuery;
    DSP_Cidades: TDataSetProvider;
    CDS_Cidades: TClientDataSet;
    SQL_CidadesCODIGO_CIDADE: TFMTBCDField;
    SQL_CidadesESTADO_CIDADE: TFMTBCDField;
    SQL_CidadesNOME_CIDADE: TWideStringField;
    CDS_CidadesCODIGO_CIDADE: TFMTBCDField;
    CDS_CidadesESTADO_CIDADE: TFMTBCDField;
    CDS_CidadesNOME_CIDADE: TWideStringField;
    DSP_Convenios: TDataSetProvider;
    CDS_Convenios: TClientDataSet;
    SQL_Convenios: TSQLQuery;
    SQL_ConveniosCODIGO_CONVENIO: TFMTBCDField;
    SQL_ConveniosNOME_CONVENIO: TWideStringField;
    SQL_ConveniosDESCRICAO_CONVENIO: TWideStringField;
    CDS_ConveniosCODIGO_CONVENIO: TFMTBCDField;
    CDS_ConveniosNOME_CONVENIO: TWideStringField;
    CDS_ConveniosDESCRICAO_CONVENIO: TWideStringField;
    SQL_Especializacoes: TSQLQuery;
    CDS_Especializacoes: TClientDataSet;
    DSP_Especializacoes: TDataSetProvider;
    SQL_Medicos: TSQLQuery;
    CDS_Medicos: TClientDataSet;
    DSP_Medicos: TDataSetProvider;
    SQL_EspecializacoesCODIGO_ESPECIALIZACAO: TFMTBCDField;
    SQL_EspecializacoesNOME_ESPECIALIZACAO: TWideStringField;
    SQL_EspecializacoesDESCRICAO_ESPECIALIZACAO: TWideStringField;
    CDS_EspecializacoesCODIGO_ESPECIALIZACAO: TFMTBCDField;
    CDS_EspecializacoesNOME_ESPECIALIZACAO: TWideStringField;
    CDS_EspecializacoesDESCRICAO_ESPECIALIZACAO: TWideStringField;
    SQL_MedicosCODIGO_MEDICO: TFMTBCDField;
    SQL_MedicosCPF_MEDICO: TWideStringField;
    SQL_MedicosRG_MEDICO: TWideStringField;
    SQL_MedicosCRM_MEDICO: TWideStringField;
    SQL_MedicosNOME_MEDICO: TWideStringField;
    SQL_MedicosENDERECO_MEDICO: TWideStringField;
    SQL_MedicosBAIRRO_MEDICO: TWideStringField;
    SQL_MedicosCIDADE_MEDICO: TFMTBCDField;
    SQL_MedicosCEP_MEDICO: TWideStringField;
    SQL_MedicosTELEFONE_MEDICO: TWideStringField;
    SQL_MedicosCELULAR_MEDICO: TWideStringField;
    SQL_MedicosEMAIL_MEDICO: TWideStringField;
    SQL_MedicosOBSERVACOES_MEDICO: TWideStringField;
    SQL_MedicosDT_CADASTRO_MEDICO: TSQLTimeStampField;
    SQL_MedicosDT_ALTERACAO_MEDICO: TSQLTimeStampField;
    SQL_MedicosDT_NASCIMENTO_MEDICO: TSQLTimeStampField;
    SQL_MedicosSEXO_MEDICO: TWideStringField;
    SQL_MedicosESTADO_CIVIL_MEDICO: TWideStringField;
    CDS_MedicosCODIGO_MEDICO: TFMTBCDField;
    CDS_MedicosCPF_MEDICO: TWideStringField;
    CDS_MedicosRG_MEDICO: TWideStringField;
    CDS_MedicosCRM_MEDICO: TWideStringField;
    CDS_MedicosNOME_MEDICO: TWideStringField;
    CDS_MedicosENDERECO_MEDICO: TWideStringField;
    CDS_MedicosBAIRRO_MEDICO: TWideStringField;
    CDS_MedicosCIDADE_MEDICO: TFMTBCDField;
    CDS_MedicosCEP_MEDICO: TWideStringField;
    CDS_MedicosTELEFONE_MEDICO: TWideStringField;
    CDS_MedicosCELULAR_MEDICO: TWideStringField;
    CDS_MedicosEMAIL_MEDICO: TWideStringField;
    CDS_MedicosOBSERVACOES_MEDICO: TWideStringField;
    CDS_MedicosDT_CADASTRO_MEDICO: TSQLTimeStampField;
    CDS_MedicosDT_ALTERACAO_MEDICO: TSQLTimeStampField;
    CDS_MedicosDT_NASCIMENTO_MEDICO: TSQLTimeStampField;
    CDS_MedicosSEXO_MEDICO: TWideStringField;
    CDS_MedicosESTADO_CIVIL_MEDICO: TWideStringField;
    SQL_Convenios_Pacientes: TSQLQuery;
    SQL_Especializacoes_Medicas: TSQLQuery;
    DSP_Convenios_Pacientes: TDataSetProvider;
    DSP_Especializacoes_Medicas: TDataSetProvider;
    CDS_Convenios_Pacientes: TClientDataSet;
    CDS_Especializacoes_Medicas: TClientDataSet;
    SQL_Convenios_PacientesCODIGO_CONVENIO: TFMTBCDField;
    SQL_Convenios_PacientesCODIGO_PACIENTE: TFMTBCDField;
    CDS_Convenios_PacientesCODIGO_CONVENIO: TFMTBCDField;
    CDS_Convenios_PacientesCODIGO_PACIENTE: TFMTBCDField;
    SQL_Especializacoes_MedicasCODIGO_ESPECIALIZACAO: TFMTBCDField;
    SQL_Especializacoes_MedicasCODIGO_MEDICO: TFMTBCDField;
    CDS_Especializacoes_MedicasCODIGO_ESPECIALIZACAO: TFMTBCDField;
    CDS_Especializacoes_MedicasCODIGO_MEDICO: TFMTBCDField;
    CDS_Consultas: TClientDataSet;
    DSP_Consultas: TDataSetProvider;
    SQL_Consultas: TSQLQuery;
    CDS_ConsultasCODIGO_CONSULTA: TFMTBCDField;
    CDS_ConsultasCODIGO_PACIENTE: TFMTBCDField;
    CDS_ConsultasCODIGO_MEDICO: TFMTBCDField;
    CDS_ConsultasCODIGO_CONVENIO: TFMTBCDField;
    CDS_ConsultasDATA_CONSULTA: TSQLTimeStampField;
    SQL_ConsultasCODIGO_CONSULTA: TFMTBCDField;
    SQL_ConsultasCODIGO_PACIENTE: TFMTBCDField;
    SQL_ConsultasCODIGO_MEDICO: TFMTBCDField;
    SQL_ConsultasCODIGO_CONVENIO: TFMTBCDField;
    SQL_ConsultasDATA_CONSULTA: TSQLTimeStampField;
    SQL_Pacientes: TSQLQuery;
    DSP_Pacientes: TDataSetProvider;
    CDS_Pacientes: TClientDataSet;
    CDS_PacientesCODIGO_PACIENTE: TFMTBCDField;
    CDS_PacientesCPF_PACIENTE: TWideStringField;
    CDS_PacientesRG_PACIENTE: TWideStringField;
    CDS_PacientesNOME_PACIENTE: TWideStringField;
    CDS_PacientesENDERECO_PACIENTE: TWideStringField;
    CDS_PacientesBAIRRO_PACIENTE: TWideStringField;
    CDS_PacientesCIDADE_PACIENTE: TFMTBCDField;
    CDS_PacientesCEP_PACIENTE: TWideStringField;
    CDS_PacientesTELEFONE_PACIENTE: TWideStringField;
    CDS_PacientesCELULAR_PACIENTE: TWideStringField;
    CDS_PacientesEMAIL_PACIENTE: TWideStringField;
    CDS_PacientesOBSERVACOES_PACIENTE: TWideStringField;
    CDS_PacientesDT_CADASTRO_PACIENTE: TSQLTimeStampField;
    CDS_PacientesDT_ALTERACAO_PACIENTE: TSQLTimeStampField;
    CDS_PacientesDT_NASCIMENTO_PACIENTE: TSQLTimeStampField;
    CDS_PacientesSEXO_PACIENTE: TWideStringField;
    CDS_PacientesESTADO_CIVIL_PACIENTE: TWideStringField;
    CDS_PacientesPROFISSAO_PACIENTE: TWideStringField;
    CDS_PacientesPRONTUARIO_PACIENTE: TWideStringField;
    SQL_PacientesCODIGO_PACIENTE: TFMTBCDField;
    SQL_PacientesCPF_PACIENTE: TWideStringField;
    SQL_PacientesRG_PACIENTE: TWideStringField;
    SQL_PacientesNOME_PACIENTE: TWideStringField;
    SQL_PacientesENDERECO_PACIENTE: TWideStringField;
    SQL_PacientesBAIRRO_PACIENTE: TWideStringField;
    SQL_PacientesCIDADE_PACIENTE: TFMTBCDField;
    SQL_PacientesCEP_PACIENTE: TWideStringField;
    SQL_PacientesTELEFONE_PACIENTE: TWideStringField;
    SQL_PacientesCELULAR_PACIENTE: TWideStringField;
    SQL_PacientesEMAIL_PACIENTE: TWideStringField;
    SQL_PacientesOBSERVACOES_PACIENTE: TWideStringField;
    SQL_PacientesDT_CADASTRO_PACIENTE: TSQLTimeStampField;
    SQL_PacientesDT_ALTERACAO_PACIENTE: TSQLTimeStampField;
    SQL_PacientesDT_NASCIMENTO_PACIENTE: TSQLTimeStampField;
    SQL_PacientesSEXO_PACIENTE: TWideStringField;
    SQL_PacientesESTADO_CIVIL_PACIENTE: TWideStringField;
    SQL_PacientesPROFISSAO_PACIENTE: TWideStringField;
    SQL_PacientesPRONTUARIO_PACIENTE: TWideStringField;
    SQL_Paciente_Convenio: TSQLQuery;
    DSP_Paciente_Convenio: TDataSetProvider;
    CDS_Paciente_Convenio: TClientDataSet;
    RvSys_Consultorio: TRvSystem;
    RvPrj_Consultorio: TRvProject;
    RvDs_Estados: TRvDataSetConnection;
    RvDs_Convenios: TRvDataSetConnection;
    RvDs_Especializacoes: TRvDataSetConnection;
    SQL_RelCidades: TSQLQuery;
    DSP_RelCidades: TDataSetProvider;
    CDS_RelCidades: TClientDataSet;
    RvDs_Cidades: TRvDataSetConnection;
    SQL_RelMedicos: TSQLQuery;
    DSP_RelMedicos: TDataSetProvider;
    CDS_RelMedicos: TClientDataSet;
    RvDs_Medicos: TRvDataSetConnection;
    SQL_RelPacientes: TSQLQuery;
    CDS_RelPacientes: TClientDataSet;
    DSP_RelPacientes: TDataSetProvider;
    procedure CDS_EstadosAfterDelete(DataSet: TDataSet);
    procedure CDS_EstadosAfterPost(DataSet: TDataSet);
    procedure SQL_ConexaoBDAfterConnect(Sender: TObject);
    procedure CDS_CidadesAfterDelete(DataSet: TDataSet);
    procedure CDS_CidadesAfterPost(DataSet: TDataSet);
    procedure CDS_ConveniosAfterDelete(DataSet: TDataSet);
    procedure CDS_ConveniosAfterPost(DataSet: TDataSet);
    procedure CDS_EspecializacoesAfterDelete(DataSet: TDataSet);
    procedure CDS_EspecializacoesAfterPost(DataSet: TDataSet);
    procedure CDS_PacientesAfterDelete(DataSet: TDataSet);
    procedure CDS_PacientesAfterPost(DataSet: TDataSet);
    procedure CDS_Convenios_PacientesAfterDelete(DataSet: TDataSet);
    procedure CDS_Convenios_PacientesAfterPost(DataSet: TDataSet);
    procedure CDS_MedicosAfterDelete(DataSet: TDataSet);
    procedure CDS_MedicosAfterPost(DataSet: TDataSet);
    procedure CDS_Especializacoes_MedicasAfterDelete(DataSet: TDataSet);
    procedure CDS_Especializacoes_MedicasAfterPost(DataSet: TDataSet);
    procedure CDS_ConsultasAfterDelete(DataSet: TDataSet);
    procedure CDS_ConsultasAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function CarregarTodos(ASqlQuery: TSQLQuery; ADataSet: TClientDataSet;
    ATabela, AOrderBy: string): Boolean;
  end;

var
  DM_Principal: TDM_Principal;

implementation

{$R *.dfm}
function TDM_Principal.CarregarTodos(ASqlQuery: TSQLQuery;
  ADataSet: TClientDataSet; ATabela, AOrderBy: string): Boolean;
var
  I, J, Conta: Integer;
  ListaCampos: TStrings;
begin
  with ASqlQuery, ADataSet do
  begin
      ADataSet.Close;
      ListaCampos := TStringList.Create;
      GetFieldNames(ListaCampos);
      Params.Clear;
      SQL.Clear;
      SQL.Add('SELECT ');
      for I := 0 to ListaCampos.Count - 1 do
        if I = ListaCampos.Count -1 then
          SQL.Add('  ' + ListaCampos[I])
        else
          SQL.Add('  ' + ListaCampos[I] + ',');
        SQL.Add('FROM ' + UpperCase(ATabela));
        {Monta o Orderby}
        if Trim(AOrderBy) <> '' then
        begin
          SQL.Add('ORDER BY');
          Conta := 0;
          J := 1;
          for I := 1 to Length(AOrderBy) do
            begin
              Inc(Conta);
              if (AOrderBy[I] = ':') or (I = Length(AOrderBy)) then
              begin
                if I < Length(AOrderBy) then
                  SQL.Add('  '+ Copy(AOrderBy, J, Conta -1)+ ',')
                else
                 SQL.Add('  '+ Copy(AOrderBy, J, Conta));

                Conta := 0;
                J := I+1;
              end;
            end;
        end;
        ListaCampos.Free;
  end;
  ADataSet.FetchParams;
  ADataSet.Open;
  Result := not ADataSet.IsEmpty;
end;

procedure TDM_Principal.CDS_CidadesAfterDelete(DataSet: TDataSet);
begin
  CDS_Cidades.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_CidadesAfterPost(DataSet: TDataSet);
begin
  CDS_Cidades.ApplyUpdates(0);
  CDS_Cidades.Refresh;
end;

procedure TDM_Principal.CDS_ConsultasAfterDelete(DataSet: TDataSet);
begin
  CDS_Consultas.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_ConsultasAfterPost(DataSet: TDataSet);
begin
  CDS_Consultas.ApplyUpdates(0);
  CDS_Consultas.Refresh;
end;

procedure TDM_Principal.CDS_ConveniosAfterDelete(DataSet: TDataSet);
begin
  CDS_Convenios.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_ConveniosAfterPost(DataSet: TDataSet);
begin
  CDS_Convenios.ApplyUpdates(0);
  CDS_Convenios.Refresh;
end;

procedure TDM_Principal.CDS_Convenios_PacientesAfterDelete(DataSet: TDataSet);
begin
  CDS_Convenios_Pacientes.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_Convenios_PacientesAfterPost(DataSet: TDataSet);
begin
  CDS_Convenios_Pacientes.ApplyUpdates(0);
  CDS_Convenios_Pacientes.Refresh;
end;

procedure TDM_Principal.CDS_EspecializacoesAfterDelete(DataSet: TDataSet);
begin
  CDS_Especializacoes.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_EspecializacoesAfterPost(DataSet: TDataSet);
begin
  CDS_Especializacoes.ApplyUpdates(0);
  CDS_Especializacoes.Refresh;
end;

procedure TDM_Principal.CDS_Especializacoes_MedicasAfterDelete(
  DataSet: TDataSet);
begin
  CDS_Especializacoes_Medicas.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_Especializacoes_MedicasAfterPost(DataSet: TDataSet);
begin
  CDS_Especializacoes_Medicas.ApplyUpdates(0);
  CDS_Especializacoes_Medicas.Refresh;
end;

procedure TDM_Principal.CDS_EstadosAfterDelete(DataSet: TDataSet);
begin
  CDS_Estados.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_EstadosAfterPost(DataSet: TDataSet);
begin
  CDS_Estados.ApplyUpdates(0);
  CDS_Estados.Refresh;
end;

procedure TDM_Principal.CDS_MedicosAfterDelete(DataSet: TDataSet);
begin
  CDS_Medicos.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_MedicosAfterPost(DataSet: TDataSet);
begin
  CDS_Medicos.ApplyUpdates(0);
  CDS_Medicos.Refresh;
end;

procedure TDM_Principal.CDS_PacientesAfterDelete(DataSet: TDataSet);
begin
  CDS_Pacientes.ApplyUpdates(0);
end;

procedure TDM_Principal.CDS_PacientesAfterPost(DataSet: TDataSet);
begin
  CDS_Pacientes.ApplyUpdates(0);
  CDS_Pacientes.Refresh;
end;

procedure TDM_Principal.SQL_ConexaoBDAfterConnect(Sender: TObject);
begin
  DM_Principal.SQL_ConexaoBD.ExecuteDirect ('alter session set nls_numeric_characters = ".,"');
end;

end.
