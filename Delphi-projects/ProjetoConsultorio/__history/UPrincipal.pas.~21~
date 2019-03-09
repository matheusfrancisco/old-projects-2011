unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ExtCtrls, ToolWin, ComCtrls, pngimage;

type
  TFRM_Principal = class(TForm)
    MNU_Principal: TMainMenu;
    TB_Principal: TToolBar;
    IMG_Fundo: TImage;
    IMG_Principal: TImageList;
    C1: TMenuItem;
    Pacientes1: TMenuItem;
    Mdicos1: TMenuItem;
    Convnios1: TMenuItem;
    Especializaes1: TMenuItem;
    Cidades1: TMenuItem;
    Estados1: TMenuItem;
    Movimentaes1: TMenuItem;
    Consultas1: TMenuItem;
    TBT_Pacientes: TToolButton;
    TBT_Medicos: TToolButton;
    ToolButton3: TToolButton;
    TBT_Convenios: TToolButton;
    TBT_Especializacoes: TToolButton;
    ToolButton6: TToolButton;
    TBT_Consultas: TToolButton;
    ToolButton8: TToolButton;
    TBT_Sair: TToolButton;
    Relatrios1: TMenuItem;
    Consultas2: TMenuItem;
    N1: TMenuItem;
    Pacientes2: TMenuItem;
    Mdicos2: TMenuItem;
    Gerais1: TMenuItem;
    Convnios2: TMenuItem;
    Especializaes2: TMenuItem;
    Cidades2: TMenuItem;
    Estados2: TMenuItem;
    procedure Estados1Click(Sender: TObject);
    procedure TBT_SairClick(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Convnios1Click(Sender: TObject);
    procedure TBT_ConveniosClick(Sender: TObject);
    procedure Especializaes1Click(Sender: TObject);
    procedure TBT_EspecializacoesClick(Sender: TObject);
    procedure Pacientes1Click(Sender: TObject);
    procedure TBT_PacientesClick(Sender: TObject);
    procedure Mdicos1Click(Sender: TObject);
    procedure TBT_MedicosClick(Sender: TObject);
    procedure Consultas1Click(Sender: TObject);
    procedure TBT_ConsultasClick(Sender: TObject);
    procedure Estados2Click(Sender: TObject);
    procedure Convnios2Click(Sender: TObject);
    procedure Especializaes2Click(Sender: TObject);
    procedure Cidades2Click(Sender: TObject);
    procedure Mdicos2Click(Sender: TObject);
    procedure Pacientes2Click(Sender: TObject);
    procedure Consultas2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Principal: TFRM_Principal;

implementation

uses UEstados, UCidades, UConvenios, UEspecializacoes, UPacientes, UMedicos,
  UConsultas, UDMPrincipal, URelMedicos, URelPacientes, URelConsultas;

{$R *.dfm}

procedure TFRM_Principal.Cidades1Click(Sender: TObject);
begin
  FRM_Cidades.ShowModal;
end;

procedure TFRM_Principal.Cidades2Click(Sender: TObject);
begin
  DM_Principal.SQL_RelCidades.Close;
  DM_Principal.SQL_RelCidades.Open;
  DM_Principal.RvPrj_Consultorio.ExecuteReport('rpt_Cidades');
end;

procedure TFRM_Principal.Consultas1Click(Sender: TObject);
begin
  FRM_Consultas.ShowModal;
end;

procedure TFRM_Principal.Consultas2Click(Sender: TObject);
begin
  FRM_RelConsultas.ShowModal;
end;

procedure TFRM_Principal.Convnios1Click(Sender: TObject);
begin
  FRM_Convenios.ShowModal;
end;

procedure TFRM_Principal.Convnios2Click(Sender: TObject);
begin
  DM_Principal.CarregarTodos(DM_Principal.SQL_Convenios,DM_Principal.CDS_Convenios,
    'CONVENIOS', 'NOME_CONVENIO');
  DM_Principal.RvPrj_Consultorio.ExecuteReport('rpt_Convenios');
end;

procedure TFRM_Principal.Especializaes1Click(Sender: TObject);
begin
  FRM_Especializacoes.ShowModal;
end;

procedure TFRM_Principal.Especializaes2Click(Sender: TObject);
begin
  DM_Principal.CarregarTodos(DM_Principal.SQL_Especializacoes,DM_Principal.CDS_Especializacoes,
    'ESPECIALIZACOES', 'NOME_ESPECIALIZACAO');
  DM_Principal.RvPrj_Consultorio.ExecuteReport('rpt_especializacoes');
end;

procedure TFRM_Principal.Estados1Click(Sender: TObject);
begin
  FRM_Estados.ShowModal;
end;

procedure TFRM_Principal.Estados2Click(Sender: TObject);
begin
  DM_Principal.CarregarTodos(DM_Principal.SQL_Estados,DM_Principal.CDS_Estados,
    'ESTADOS', 'NOME_ESTADO');
  DM_Principal.RvPrj_Consultorio.ExecuteReport('rpt_Estados');
end;

procedure TFRM_Principal.Mdicos1Click(Sender: TObject);
begin
  FRM_Medicos.ShowModal;
end;

procedure TFRM_Principal.Mdicos2Click(Sender: TObject);
begin
FRM_RelMedicos.ShowModal;
end;

procedure TFRM_Principal.Pacientes1Click(Sender: TObject);
begin
  FRM_Pacientes.ShowModal;
end;

procedure TFRM_Principal.Pacientes2Click(Sender: TObject);
begin
  FRM_RelPacientes.ShowModal;
end;

procedure TFRM_Principal.TBT_ConsultasClick(Sender: TObject);
begin
  FRM_Consultas.ShowModal;
end;

procedure TFRM_Principal.TBT_ConveniosClick(Sender: TObject);
begin
  FRM_Convenios.ShowModal;
end;

procedure TFRM_Principal.TBT_EspecializacoesClick(Sender: TObject);
begin
  FRM_Especializacoes.ShowModal;
end;

procedure TFRM_Principal.TBT_MedicosClick(Sender: TObject);
begin
  FRM_Medicos.ShowModal;
end;

procedure TFRM_Principal.TBT_PacientesClick(Sender: TObject);
begin
  FRM_Pacientes.ShowModal;
end;

procedure TFRM_Principal.TBT_SairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
