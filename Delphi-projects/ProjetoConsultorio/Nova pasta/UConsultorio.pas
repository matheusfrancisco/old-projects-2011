unit UConsultorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnMan, ActnCtrls, Menus, ExtCtrls, ImgList, ToolWin, ComCtrls,
  pngimage;

type
  TFRM_Principal = class(TForm)
    MainMenu1: TMainMenu;
    TB_Principal: TToolBar;
    IMG_Principal: TImageList;
    IMG_Fundo: TImage;
    C1: TMenuItem;
    Pacientes1: TMenuItem;
    Mdicos1: TMenuItem;
    Convnios1: TMenuItem;
    Especializaes1: TMenuItem;
    Cidades1: TMenuItem;
    Estados1: TMenuItem;
    Movimentaes1: TMenuItem;
    Consultas1: TMenuItem;
    ActionToolBar1: TActionToolBar;
    TBT_Pacientes: TToolButton;
    TBT_Medicos: TToolButton;
    ToolButton3: TToolButton;
    TBT_Convenios: TToolButton;
    TBT_Especializacoes: TToolButton;
    ToolButton6: TToolButton;
    TBT_Consultas: TToolButton;
    ToolButton8: TToolButton;
    TBT_Sair: TToolButton;
    procedure Estados1Click(Sender: TObject);
    procedure TBT_SairClick(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Convnios1Click(Sender: TObject);
    procedure Especializaes1Click(Sender: TObject);
    procedure TBT_EspecializacoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Principal: TFRM_Principal;

implementation

uses UEstados, UCidades, UConvenios, UEspecializacoes;

{$R *.dfm}

procedure TFRM_Principal.Cidades1Click(Sender: TObject);
begin
  FRM_Cidades.ShowModal;
end;

procedure TFRM_Principal.Convnios1Click(Sender: TObject);
begin
 FRM_Convenios.ShowModal;
end;

procedure TFRM_Principal.Especializaes1Click(Sender: TObject);
begin
 FRM_Especializacoes.ShowModal;
end;

procedure TFRM_Principal.Estados1Click(Sender: TObject);
begin
  FRM_Estados.ShowModal;
end;

procedure TFRM_Principal.TBT_EspecializacoesClick(Sender: TObject);
begin
 FRM_Especializacoes.ShowModal;
end;

procedure TFRM_Principal.TBT_SairClick(Sender: TObject);
begin
   Application.Terminate;
end;

end.
