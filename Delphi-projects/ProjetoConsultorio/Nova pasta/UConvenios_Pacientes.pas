unit UConvenios_Pacientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastro, ImgList, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DBCtrls, ToolWin;

type
  TFRM_Convenios_Pacientes = class(TFRM_Cadastro)
    Label1: TLabel;
    Label2: TLabel;
    DBL_Paciente: TDBLookupComboBox;
    DBL_Convenio: TDBLookupComboBox;
    DS_Pacientes: TDataSource;
    DS_Convenios: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure SBT_PesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Convenios_Pacientes: TFRM_Convenios_Pacientes;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TFRM_Convenios_Pacientes.FormActivate(Sender: TObject);
begin
  inherited;
  DM_Principal.CarregarTodos(DM_Principal.SQL_Convenios_Pacientes, DM_Principal.CDS_Convenios_Pacientes, 'CONVENIOS_PACIENTES', 'CODIGO_PACIENTE');
  DM_Principal.CarregarTodos(DM_Principal.SQL_Pacientes, DM_Principal.CDS_Pacientes, 'PACIENTES', 'NOME_PACIENTE');
  DM_Principal.CarregarTodos(DM_Principal.SQL_Convenios, DM_Principal.CDS_Convenios, 'CONVENIOS', 'NOME_CONVENIO');
end;

procedure TFRM_Convenios_Pacientes.SBT_PesquisarClick(Sender: TObject);
var campo: string;
begin
  inherited;
  DM_Principal.CDS_Convenios_Pacientes.Close;
  DM_Principal.SQL_Convenios_Pacientes.SQL.Clear;
  DM_Principal.SQL_Convenios_Pacientes.Params.Clear;
  DM_Principal.SQL_Convenios_Pacientes.SQL.Add('SELECT * FROM CONVENIOS_PACIENTES WHERE ');

  campo:=UpperCase(CBX_Consulta.Items[CBX_Consulta.ItemIndex]);

  case CBX_TipoConsulta.ItemIndex of
    0: begin
      if TipoDado=1
        then DM_Principal.SQL_Convenios_Pacientes.SQL.Add(campo + ' = '+ UpperCase(EDT_Consulta.Text));
      if TipoDado=2
        then DM_Principal.SQL_Convenios_Pacientes.SQL.Add(campo + ' LIKE ' + CHR(39) +
          UpperCase(EDT_Consulta.Text) + CHR(39));
      if TipoDado=3
        then DM_Principal.SQL_Convenios_Pacientes.SQL.Add(campo + ' = ' + CHR(39) +
          UpperCase(EDT_Consulta.Text) + CHR(39));
       end;

    1: DM_Principal.SQL_Convenios_Pacientes.SQL.Add(campo + ' LIKE ' + CHR(39) +
      UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));

    2: DM_Principal.SQL_Convenios_Pacientes.SQL.Add(campo + ' LIKE ' + CHR(39) +
      '%' + UpperCase(EDT_Consulta.Text) + '%'+ CHR(39));
  end;

  DM_Principal.CDS_Convenios_Pacientes.Open;
  if DM_Principal.CDS_Convenios_Pacientes.IsEmpty
    then MessageDlg('Nada selecionado para o filtro.',mtInformation, [mbOK], 0);
end;

end.
