unit URelPacientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, StdCtrls, ExtCtrls, Buttons, ComCtrls, DBCtrls;

type
  TFRM_RelPacientes = class(TFRM_Padrao)
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
  FRM_RelPacientes: TFRM_RelPacientes;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TFRM_RelPacientes.BitBtn1Click(Sender: TObject);
begin
  inherited;
  DM_Principal.SQL_RelPacientes.Close;
  DM_Principal.SQL_RelPacientes.SQL.Clear;
  DM_Principal.SQL_RelPacientes.SQL.Add('SELECT PACIENTES.*, NOME_CONVENIO, DESCRICAO_CONVENIO');
  DM_Principal.SQL_RelPacientes.SQL.Add('FROM PACIENTES');
  DM_Principal.SQL_RelPacientes.SQL.Add('LEFT JOIN CONVENIOS_PACIENTES ON (PACIENTES.CODIGO_PACIENTE=');
  DM_Principal.SQL_RelPacientes.SQL.Add('CONVENIOS_PACIENTES.CODIGO_PACIENTE)');
  DM_Principal.SQL_RelPacientes.SQL.Add('LEFT JOIN CONVENIOS ON (CONVENIOS_PACIENTES.CODIGO_CONVENIO=');
  DM_Principal.SQL_RelPacientes.SQL.Add('CONVENIOS.CODIGO_CONVENIO)');

  if RG_Selecao.ItemIndex=1 then
  begin
    DM_Principal.SQL_RelPacientes.SQL.Add('WHERE PACIENTES.CODIGO_PACIENTE='
      +DM_Principal.CDS_PacientesCODIGO_PACIENTE.AsString)
  end;


  if RG_Selecao.ItemIndex = 2 then
  begin
    DM_Principal.SQL_RelPacientes.SQL.Add('WHERE DT_CADASTRO_PACIENTE BETWEEN '
      +CHR(39)+datetostr(DTP_Inicial.Date)+CHR(39));
    DM_Principal.SQL_RelPacientes.SQL.Add('AND ' + CHR(39) + datetostr(DTP_Final.Date)+ CHR(39));
  end;


  DM_Principal.SQL_RelPacientes.SQL.Add('ORDER BY NOME_PACIENTE');
  DM_Principal.SQL_RelPacientes.Open;

  DM_Principal.RvPrj_Consultorio.ExecuteReport('rpt_Pacientes');
end;

procedure TFRM_RelPacientes.FormActivate(Sender: TObject);
begin
  inherited;
  RG_Selecao.ItemIndex := 0;
  RG_SelecaoClick (self);
  DM_Principal.CarregarTodos(DM_Principal.SQL_Pacientes,DM_Principal.CDS_Pacientes,
    'PACIENTES', 'NOME_PACIENTE');
end;

procedure TFRM_RelPacientes.RG_SelecaoClick(Sender: TObject);
begin
  inherited;
  GB_Individual.Enabled:=RG_Selecao.ItemIndex=1;
  GB_Periodo.Enabled:=RG_Selecao.ItemIndex=2;
end;

end.
