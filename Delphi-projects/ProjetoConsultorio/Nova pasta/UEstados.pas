unit UEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastro, ImgList, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DBCtrls, ToolWin, Mask;

type
  TFRM_Estados = class(TFRM_Cadastro)
    LBL_Codigo: TLabel;
    LBL_Nome: TLabel;
    LBL_Sigla: TLabel;
    DBE_Codigo: TDBEdit;
    DBE_Nome: TDBEdit;
    DBE_Sigla: TDBEdit;
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
  FRM_Estados: TFRM_Estados;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TFRM_Estados.BT_NovoClick(Sender: TObject);
begin
  inherited;
DS_Generico.DataSet.FieldByName('CODIGO_ESTADO').AsInteger := 0;
DBE_Nome.SetFocus;
end;

procedure TFRM_Estados.BT_SalvarClick(Sender: TObject);
begin
  inherited;
  DBE_Codigo.SetFocus
end;

procedure TFRM_Estados.FormActivate(Sender: TObject);
begin
  inherited;
  DM_Principal.CarregarTodos(DM_Principal.SQL_Estados, DM_Principal.CDS_Estados, 'Estados', 'Nome_Estado');
  EDT_Consulta.Clear;
end;

procedure TFRM_Estados.SBT_PesquisarClick(Sender: TObject);
var campo: string;
begin
  inherited;
  DM_Principal.CDS_Estados.Close;
  DM_Principal.SQL_Estados.SQL.Clear;
  DM_Principal.SQL_Estados.Params.Clear;
  DM_Principal.SQL_Estados.SQL.Add('SELECT * FROM ESTADOS WHERE');

  campo:=UpperCase(CBX_Consulta.Items[CBX_Consulta.ItemIndex]);

  case CBX_TipoConsulta.ItemIndex of
    0: begin
      if TipoDado=1
        then DM_Principal.SQL_Estados.SQL.Add(campo + ' = '+ EDT_Consulta.Text);
      if TipoDado=2
        then DM_Principal.Sql_Estados.SQL.Add(campo + ' LIKE ' + CHR(39) +
          EDT_Consulta.Text + CHR(39));
      if TipoDado=3
        then DM_Principal.Sql_Estados.SQL.Add(campo + ' = ' + CHR(39) +
          EDT_Consulta.Text + CHR(39));
       end;

    1: DM_Principal.SQL_Estados.SQL.Add(campo + ' LIKE ' + CHR(39) +
      UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));

    2: DM_Principal.SQL_Estados.SQL.Add(campo + ' LIKE ' + CHR(39) +
      '%' + UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));
  end;

  DM_Principal.CDS_Estados.Open;
  if DM_Principal.CDS_Estados.IsEmpty
    then MessageDlg('Nada selecionado para o filtro.',mtInformation, [mbOK], 0);


end;

end.
