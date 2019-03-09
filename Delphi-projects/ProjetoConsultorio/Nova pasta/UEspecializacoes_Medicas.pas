unit UEspecializacoes_Medicas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastro, ImgList, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DBCtrls, ToolWin;

type
  TFRM_Especializacoes_Medicas = class(TFRM_Cadastro)
    Label1: TLabel;
    Label2: TLabel;
    DBL_Medico: TDBLookupComboBox;
    DBL_Especializacoes: TDBLookupComboBox;
    DS_Medicos: TDataSource;
    DS_Especializacoes: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure SBT_PesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Especializacoes_Medicas: TFRM_Especializacoes_Medicas;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TFRM_Especializacoes_Medicas.FormActivate(Sender: TObject);
begin
  inherited;
  DM_Principal.CarregarTodos(DM_Principal.SQL_Especializacoes_Medicas,
    DM_Principal.CDS_Especializacoes_Medicas, 'ESPECIALIZACOES_MEDICOS', 'CODIGO_MEDICO');

  DM_Principal.CarregarTodos(DM_Principal.SQL_Medicos,
    DM_Principal.CDS_Medicos,'MEDICOS', 'NOME_MEDICO');

  DM_Principal.CarregarTodos(DM_Principal.SQL_Especializacoes,
    DM_Principal.CDS_Especializacoes, 'ESPECIALIZACOES', 'NOME_ESPECIALIZACAO');
end;

procedure TFRM_Especializacoes_Medicas.SBT_PesquisarClick(Sender: TObject);
var campo: string;
begin
  inherited;
  DM_Principal.CDS_Especializacoes_Medicas.Close;
  DM_Principal.SQL_Especializacoes_Medicas.SQL.Clear;
  DM_Principal.SQL_Especializacoes_Medicas.Params.Clear;
  DM_Principal.SQL_Especializacoes_Medicas.SQL.Add('SELECT * FROM ESPECIALIZACOES_MEDICOS WHERE ');

  campo:=UpperCase(CBX_Consulta.Items[CBX_Consulta.ItemIndex]);

  case CBX_TipoConsulta.ItemIndex of
    0: begin
      if TipoDado=1
        then DM_Principal.SQL_Especializacoes_Medicas.SQL.Add(campo + ' = '+
                     UpperCase(EDT_Consulta.Text));
      if TipoDado=2
        then DM_Principal.SQL_Especializacoes_Medicas.SQL.Add(campo + ' LIKE ' + CHR(39) +
          UpperCase(EDT_Consulta.Text) + CHR(39));
      if TipoDado=3
        then DM_Principal.SQL_Especializacoes_Medicas.SQL.Add(campo + ' = ' + CHR(39) +
          UpperCase(EDT_Consulta.Text) + CHR(39));
       end;

    1: DM_Principal.SQL_Especializacoes_Medicas.SQL.Add(campo + ' LIKE ' + CHR(39) +
      UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));

    2: DM_Principal.SQL_Especializacoes_Medicas.SQL.Add(campo + ' LIKE ' + CHR(39) +
      '%' + UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));
  end;

  DM_Principal.CDS_Especializacoes_Medicas.Open;
  if DM_Principal.CDS_Especializacoes_Medicas.IsEmpty
    then MessageDlg('Nada selecionado para o filtro.',mtInformation, [mbOK], 0);
end;

end.
