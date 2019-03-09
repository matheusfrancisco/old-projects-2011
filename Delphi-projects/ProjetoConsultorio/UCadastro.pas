unit UCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, Buttons, Grids, DBGrids, StdCtrls, ComCtrls, ExtCtrls,
  DBCtrls, ImgList, ToolWin;

type
  TFRM_Cadastro = class(TFRM_Padrao)
    TB_Cadastro: TToolBar;
    GBX_Cadastro: TGroupBox;
    IMG_Cadastro: TImageList;
    DBN_Cadastro: TDBNavigator;
    ToolButton1: TToolButton;
    BT_Novo: TToolButton;
    BT_Salvar: TToolButton;
    BT_Alterar: TToolButton;
    BT_Cancelar: TToolButton;
    BT_Excluir: TToolButton;
    ToolButton7: TToolButton;
    BT_Livre: TToolButton;
    ToolButton9: TToolButton;
    BT_Sair: TToolButton;
    GBX_Consulta: TGroupBox;
    EDT_Consulta: TEdit;
    CBX_Consulta: TComboBox;
    CBX_TipoConsulta: TComboBox;
    DBG_Consulta: TDBGrid;
    SBT_Pesquisar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure AtivarBotoes(AEdicao:Boolean);
    procedure BT_NovoClick(Sender: TObject);
    procedure BT_SalvarClick(Sender: TObject);
    procedure BT_AlterarClick(Sender: TObject);
    procedure BT_CancelarClick(Sender: TObject);
    procedure BT_ExcluirClick(Sender: TObject);
    procedure BT_SairClick(Sender: TObject);
    procedure SBT_PesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
  TipoDado:integer;
    { Public declarations }
  end;

var
  FRM_Cadastro: TFRM_Cadastro;

implementation

{$R *.dfm}

procedure TFRM_Cadastro.AtivarBotoes(AEdicao: Boolean);
begin
  DBN_Cadastro.Enabled := not AEdicao;
  BT_Novo.Enabled := not AEdicao;
  BT_Salvar.Enabled := AEdicao;
  BT_Alterar.Enabled := not AEdicao;
  BT_Cancelar.Enabled := AEdicao;
  BT_Excluir.Enabled := not AEdicao;
  BT_Sair.Enabled := not AEdicao;
end;

procedure TFRM_Cadastro.BT_AlterarClick(Sender: TObject);
begin
  inherited;
  if DS_Generico.DataSet.IsEmpty then
    Exit;
  DS_Generico.DataSet.Edit;
  AtivarBotoes(True);
end;

procedure TFRM_Cadastro.BT_CancelarClick(Sender: TObject);
begin
  inherited;
  AtivarBotoes(False);
  DS_Generico.DataSet.Cancel;
end;

procedure TFRM_Cadastro.BT_ExcluirClick(Sender: TObject);
begin
  inherited;
  if DS_Generico.DataSet.IsEmpty then
    Exit;
  if MessageDlg('Confirma exclusão do '+'registro atual?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        if DS_Generico.DataSet.IsEmpty then Exit;
      DS_Generico.DataSet.Edit;
      DS_Generico.DataSet.Delete;
      DS_Generico.DataSet.Close;
      DS_Generico.DataSet.Open;
    end;

end;

procedure TFRM_Cadastro.BT_NovoClick(Sender: TObject);
begin
  inherited;
  AtivarBotoes(True);
  if not DS_Generico.DataSet.Active then
    DS_Generico.DataSet.Open;
    DS_Generico.DataSet.Append;
end;

procedure TFRM_Cadastro.BT_SairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFRM_Cadastro.BT_SalvarClick(Sender: TObject);
begin
  inherited;
  AtivarBotoes(False);
  DS_Generico.DataSet.Post;
end;

procedure TFRM_Cadastro.FormShow(Sender: TObject);
begin
  inherited;
  CBX_Consulta.Items.Clear;
  DS_Generico.DataSet.GetFieldNames(CBX_Consulta.Items);
  CBX_Consulta.ItemIndex := 0;
  AtivarBotoes(False);
end;

procedure TFRM_Cadastro.SBT_PesquisarClick(Sender: TObject);
var i:integer;
  palavra:string;
  key:char;
begin
  inherited;
  TipoDado:=1; //numeric
  palavra:=trim(EDT_Consulta.Text);

  for i:=1 to length(palavra) do
  begin
    key:=palavra[i];
    if not (key in ['0'..'9']) then
    begin
      if key = '/'
        then TipoDado:=3 //data
        else TipoDado:=2; // character
    end;
  end;
end;

end.
