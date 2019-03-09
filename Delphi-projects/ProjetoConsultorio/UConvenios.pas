unit UConvenios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastro, ImgList, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DBCtrls, ToolWin, Mask;

type
  TFRM_Convenios = class(TFRM_Cadastro)
    LBL_Codigo: TLabel;
    LBL_Nome: TLabel;
    LBL_Descricao: TLabel;
    DBE_Codigo: TDBEdit;
    DBE_Nome: TDBEdit;
    DBM_Descricao: TDBMemo;
    procedure FormActivate(Sender: TObject);
    procedure BT_NovoClick(Sender: TObject);
    procedure BT_SalvarClick(Sender: TObject);
    procedure SBT_PesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Convenios: TFRM_Convenios;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TFRM_Convenios.BT_NovoClick(Sender: TObject);
begin
  inherited;
  DS_Generico.DataSet.FieldByName('CODIGO_CONVENIO').AsInteger := 0;
  DBE_Nome.SetFocus;
end;

procedure TFRM_Convenios.BT_SalvarClick(Sender: TObject);
begin
  inherited;
  DBE_Codigo.SetFocus;
end;

procedure TFRM_Convenios.FormActivate(Sender: TObject);
begin
  inherited;
  DM_Principal.CarregarTodos(DM_Principal.SQL_Convenios, DM_Principal.CDS_Convenios, 'CONVENIOS', 'NOME_CONVENIO');
  EDT_Consulta.Clear;
end;

procedure TFRM_Convenios.SBT_PesquisarClick(Sender: TObject);
var campo: string;
begin
  inherited;
  DM_Principal.CDS_Convenios.Close;
  DM_Principal.SQL_Convenios.SQL.Clear;
  DM_Principal.SQL_Convenios.Params.Clear;
  DM_Principal.SQL_Convenios.SQL.Add('SELECT * FROM CONVENIOS WHERE ');

  campo:=UpperCase(CBX_Consulta.Items[CBX_Consulta.ItemIndex]);

  case CBX_TipoConsulta.ItemIndex of
    0: begin
      if TipoDado=1
        then DM_Principal.SQL_Convenios.SQL.Add(campo + ' = '+ UpperCase(EDT_Consulta.Text));
      if TipoDado=2
        then DM_Principal.Sql_Convenios.SQL.Add(campo + ' LIKE ' + CHR(39) +
          EDT_Consulta.Text + CHR(39));
      if TipoDado=3
        then DM_Principal.Sql_Convenios.SQL.Add(campo + ' = ' + CHR(39) +
          UpperCase(EDT_Consulta.Text) + CHR(39));
       end;

    1: DM_Principal.SQL_Convenios.SQL.Add(campo + ' LIKE ' + CHR(39) +
      UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));

    2: DM_Principal.SQL_Convenios.SQL.Add(campo + ' LIKE ' + CHR(39) +
      '%' + UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));
  end;

  DM_Principal.CDS_Convenios.Open;
  if DM_Principal.CDS_Convenios.IsEmpty
    then MessageDlg('Nada selecionado para o filtro.',mtInformation, [mbOK], 0);

end;

end.
