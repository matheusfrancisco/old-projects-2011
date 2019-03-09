unit URelMedicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls;

type
  TFRM_RelMedicos = class(TFRM_Padrao)
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
  FRM_RelMedicos: TFRM_RelMedicos;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TFRM_RelMedicos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  DM_Principal.SQL_RelMedicos.Close;
  DM_Principal.SQL_RelMedicos.SQL.Clear;
  DM_Principal.SQL_RelMedicos.SQL.Add('SELECT MEDICOS.*, NOME_ESPECIALIZACAO, DESCRICAO_ESPECIALIACAO');
  DM_Principal.SQL_RelMedicos.SQL.Add('FROM ESPECIALIZACOES_MEDICOS, MEDICOS, ESPECIALIZACOES');
  DM_Principal.SQL_RelMedicos.SQL.Add('WHERE ESPECIALIZACOES_MEDICOS.CODIGO_MEDICO=MEDICOS.CODIGO_MEDICO');
  DM_Principal.SQL_RelMedicos.SQL.Add('AND ESPECIALIZACOES_MEDICOS.CODIGO_ESPECIALIZACAO=');
  DM_Principal.SQL_RelMedicos.SQL.Add('ESPECIALIZACOES.CODIGO_ESPECIALIZACAO');

  if RG_Selecao.ItemIndex=1 then
  begin
    DM_Principal.SQL_RelMedicos.SQL.Add('AND ESPECIALIZACOES_MEDICOS.CODIGO_MEDICO='
      +DM_Principal.CDS_MedicosCODIGO_MEDICO.AsString)
  end;


  if RG_Selecao.ItemIndex = 2 then
  begin
    DM_Principal.SQL_RelMedicos.SQL.Add('AND DT_CADASTRO_MEDICO BETWEEN '
      +CHR(39) +datetostr(DTP_Inicial.Date)+CHR(39));
    DM_Principal.SQL_RelMedicos.SQL.Add('AND ' + CHR(39) + datetostr(DTP_Final.Date)+ CHR(39));
  end;


  DM_Principal.SQL_RelMedicos.SQL.Add('ORDER BY NOME_MEDICO');
  DM_Principal.SQL_RelMedicos.Open;

  DM_Principal.RvPrj_Consultorio.ExecuteReport('rpt_Medicos');
end;

procedure TFRM_RelMedicos.FormActivate(Sender: TObject);
begin
  inherited;
  RG_Selecao.ItemIndex := 0;
  RG_SelecaoClick (self);
  DM_Principal.CarregarTodos(DM_Principal.SQL_Medicos,DM_Principal.CDS_Medicos,
    'MEDICOS', 'NOME_MEDICO');
end;

procedure TFRM_RelMedicos.RG_SelecaoClick(Sender: TObject);
begin
  inherited;
  GB_Individual.Enabled:=RG_Selecao.ItemIndex=1;
  GB_Periodo.Enabled:=RG_Selecao.ItemIndex=2;
end;

end.
