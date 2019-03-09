unit UMedicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastro, ImgList, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DBCtrls, ToolWin, Mask, FMTBcd, SqlExpr, DBClient, Provider;

type
  TFRM_Medicos = class(TFRM_Cadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBE_Codigo: TDBEdit;
    DBE_Nome: TDBEdit;
    DBE_CRM: TDBEdit;
    DBE_Dt_Cadastro: TDBEdit;
    DBE_Dt_Alteração: TDBEdit;
    PageControl1: TPageControl;
    Tab_Dados: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBE_CPF: TDBEdit;
    DBE_RG: TDBEdit;
    DBE_Dt_Nascimento: TDBEdit;
    DBRG_Sexo: TDBRadioGroup;
    DBCB_Estado_Civil: TDBComboBox;
    DBM_Observacao: TDBMemo;
    Tab_Contato: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBE_Endereco: TDBEdit;
    DBE_Bairro: TDBEdit;
    DBE_CEP: TDBEdit;
    DBE_Telefone: TDBEdit;
    DBE_Celular: TDBEdit;
    DBE_email: TDBEdit;
    DBL_Cidade: TDBLookupComboBox;
    DS_Cidades: TDataSource;
    Tab_especializacoes: TTabSheet;
    DBGrid1: TDBGrid;
    SQL_Especializacoes: TSQLQuery;
    DSP_Especializacoes: TDataSetProvider;
    CDS_Especializacoes: TClientDataSet;
    DS_Especializacoes: TDataSource;
    SQL_EspecializacoesNOME_MEDICO: TWideStringField;
    SQL_EspecializacoesNOME_ESPECIALIZACAO: TWideStringField;
    CDS_EspecializacoesNOME_MEDICO: TWideStringField;
    CDS_EspecializacoesNOME_ESPECIALIZACAO: TWideStringField;
    procedure DS_GenericoDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure BT_NovoClick(Sender: TObject);
    procedure BT_SalvarClick(Sender: TObject);
    procedure SBT_PesquisarClick(Sender: TObject);
    procedure BT_LivreClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Medicos: TFRM_Medicos;

implementation

uses UDMPrincipal, UEspecializacoes_Medicas;

{$R *.dfm}

procedure TFRM_Medicos.BT_LivreClick(Sender: TObject);
begin
  inherited;
  FRM_Especializacoes_Medicas.ShowModal;
end;

procedure TFRM_Medicos.BT_NovoClick(Sender: TObject);
begin
  inherited;
  DS_Generico.DataSet.FieldByName('CODIGO_MEDICO').AsInteger := 0;
  DBE_Nome.SetFocus;
  PageControl1.ActivePageIndex:=0;
end;

procedure TFRM_Medicos.BT_SalvarClick(Sender: TObject);
begin
  inherited;
  DBE_Codigo.SetFocus;
end;

procedure TFRM_Medicos.DS_GenericoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  CDS_Especializacoes.Close;
  SQL_Especializacoes.Params[0].AsInteger :=DM_Principal.CDS_MedicosCODIGO_MEDICO.AsInteger;
  SQL_Especializacoes.ExecSQL;
  CDS_Especializacoes.Open;
end;

procedure TFRM_Medicos.FormActivate(Sender: TObject);
begin
  inherited;
  DM_Principal.CarregarTodos(DM_Principal.SQL_Medicos, DM_Principal.CDS_Medicos,'MEDICOS', 'NOME_MEDICO');
  DM_Principal.CarregarTodos(DM_Principal.SQL_Cidades, DM_Principal.CDS_Cidades, 'CIDADES', 'NOME_CIDADE');
  EDT_Consulta.Clear;
  PageControl1.ActivePageIndex:=0;
end;

procedure TFRM_Medicos.SBT_PesquisarClick(Sender: TObject);
var campo: string;
begin
  inherited;
  DM_Principal.CDS_Medicos.Close;
  DM_Principal.SQL_Medicos.SQL.Clear;
  DM_Principal.SQL_Medicos.Params.Clear;
  DM_Principal.SQL_Medicos.SQL.Add('SELECT * FROM MEDICOS WHERE ');

  campo:=UpperCase(CBX_Consulta.Items[CBX_Consulta.ItemIndex]);

  case CBX_TipoConsulta.ItemIndex of
    0: begin
      if TipoDado=1
        then DM_Principal.SQL_Medicos.SQL.Add(campo + ' = '+ EDT_Consulta.Text);
      if TipoDado=2
        then DM_Principal.SQL_Medicos.SQL.Add(campo + ' LIKE ' + CHR(39) +
          EDT_Consulta.Text + CHR(39));
      if TipoDado=3
        then DM_Principal.SQL_Medicos.SQL.Add(campo + ' = ' + CHR(39) +
          EDT_Consulta.Text + CHR(39));
       end;

    1: DM_Principal.SQL_Medicos.SQL.Add(campo + ' LIKE ' + CHR(39) +
      UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));

    2: DM_Principal.SQL_Medicos.SQL.Add(campo + ' LIKE ' + CHR(39) +
      '%' + UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));
  end;

  DM_Principal.CDS_Medicos.Open;
  if DM_Principal.CDS_Medicos.IsEmpty
    then MessageDlg('Nada selecionado para o filtro.',mtInformation, [mbOK], 0);
end;

end.
