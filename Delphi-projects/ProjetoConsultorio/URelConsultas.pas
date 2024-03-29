unit URelConsultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls;

type
  TFRM_RelConsultas = class(TFRM_Padrao)
    RG_Selecao: TRadioGroup;
    GB_Individual: TGroupBox;
    GB_Periodo: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    DTP_Inicial: TDateTimePicker;
    DTP_Final: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure RG_SelecaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_RelConsultas: TFRM_RelConsultas;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TFRM_RelConsultas.BitBtn1Click(Sender: TObject);
begin
  inherited;
    DM_Principal.SQL_RelConsultas.Close;
    DM_Principal.SQL_RelConsultas.SQL.Clear;
    DM_Principal.SQL_RelConsultas.SQL.Add('SELECT DATA_CONSULTA, NOME_PACIENTE, NOME_MEDICO, NOME_CONVENIO');
    DM_Principal.SQL_RelConsultas.SQL.Add('FROM CONSULTAS');
    DM_Principal.SQL_RelConsultas.SQL.Add('LEFT JOUN PACIENTES ON (CONSULTAS.CODIGO_PACIENTE=PACIENTE.CODIGO_PACIENTE)');
    DM_Principal.SQL_RelConsultas.SQL.Add('LEFT JOUN PACIENTES ON (COSULTAS.CODIGO_MEDICO=MEDICOS.CODIGO_MEDICO)');
    DM_Principal.SQL_RelConsultas.SQL.Add('LEFT JOUN PACIENTES ON (CONSULTAS.CODIGO_CONVENIO=CONVENIOS.CODIGO_CONVENIO)');
    DM_Principal.SQL_RelConsultas.SQL.Add('WHERE DATA_CONSULTA BETWEEN ' +CHR(39)+datetostr(DTP_Inicial.Date)+CHR(39));
    DM_Principal.SQL_RelConsultas.SQL.Add('AND ' + CHR(39)+ datetostr(DTP_Final.Date)+ CHR(39));

    case RG_Selecao.ItemIndex of
    1: DM_Principal.SQL_RelConsultas.SQL.Add('AND CONSULTAS.CODIGO_MEDICO='
          +DM_Principal .CDS_MedicosCODIGO_MEDICO.AsString);

    2: DM_Principal.SQL_RelConsultas.SQL.Add('AND CONSULTAS.CODIGO_PACIENTE='
        +DM_Principal.CDS_PacientesCODIGO_PACIENTE.AsString);

    3: DM_Principal.SQL_RelConsultas.SQL.Add('AND CONSULTAS.CODIGO_CONVENIO='
        +DM_Principal.CDS_ConveniosCODIGO_CONVENIO.AsString);
    end;

    DM_Principal.SQL_RelConsultas.SQL.Add('ORDER BY DATA_CONSULTA');
    DM_Principal.SQL_RelConsultas.Open;

    DM_Principal.RvPrj_Consultorio.ExecuteReport('rpt_Consultas');
   end;

procedure TFRM_RelConsultas.FormActivate(Sender: TObject);
begin
  inherited;
   RG_Selecao.ItemIndex  := 0;
   RG_SelecaoClick (self);
end;

procedure TFRM_RelConsultas.RG_SelecaoClick(Sender: TObject);
begin
  inherited;
  case RG_Selecao.ItemIndex of
    0:begin
      GB_Individual.Caption:='Geral';
    end;

    1:begin
      DBLookupComboBox1.ListSource:=nil;
      DBLookupComboBox1.ListField:='NOME_MEDICO';
      DBLookupComboBox1.KeyField:='CODIGO_MEDICO';
      GB_Individual.Caption:='M�dico';
      DS_Generico.DataSet:=DM_Principal.CDS_Medicos;
      DBLookupComboBox1.ListSource:=DS_Generico;
      DBLookupComboBox1.ListField:='NOME_MEDICO';
      DBLookupComboBox1.KeyField:='CODIGO_MEDICO';
      DM_Principal.CarregarTodos(DM_Principal.SQL_Medicos,DM_Principal.CDS_Medicos,
        'MEDICOS', 'NOME_MEDICO');
    end;



    2:begin
      DBLookupComboBox1.ListSource:=nil;
      DBLookupComboBox1.ListField:='NOME_PACIENTE';
      DBLookupComboBox1.KeyField:='CODIGO_PACIENTE';
      GB_Individual.Caption:='Paciente';
      DS_Generico.DataSet:=DM_Principal.CDS_Pacientes;
      DBLookupComboBox1.ListSource:=DS_Generico;
      DBLookupComboBox1.ListField:='NOME_PACIENTE';
      DBLookupComboBox1.KeyField:='CODIGO_PACIENTE';
      DM_Principal.CarregarTodos(DM_Principal.SQL_Pacientes,DM_Principal.CDS_Pacientes,
        'PACIENTES', 'NOME_PACIENTE');
    end;



    3:begin
      DBLookupComboBox1.ListSource:=nil;
      DBLookupComboBox1.ListField:='NOME_CONVENIO';
      DBLookupComboBox1.KeyField:='CODIGO_CONVENIO';
      GB_Individual.Caption:='Conv�nio';
      DS_Generico.DataSet:=DM_Principal.CDS_Convenios;
      DBLookupComboBox1.ListSource:=DS_Generico;
      DBLookupComboBox1.ListField:='NOME_CONVENIO';
      DBLookupComboBox1.KeyField:='CODIGO_CONVENIO';
      DM_Principal.CarregarTodos(DM_Principal.SQL_Convenios,DM_Principal.CDS_Convenios,
        'CONVENIOS', 'NOME_CONVENIO');
    end;
  end;

  GB_Individual.Enabled:=RG_Selecao.ItemIndex<>0;
end;

end.
