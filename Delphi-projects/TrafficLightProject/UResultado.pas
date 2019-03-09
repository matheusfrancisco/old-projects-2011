unit UResultado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFRM_Resultado = class(TForm)
    LBL_Resultado: TLabel;
    LBL_Acertos: TLabel;
    LBL_VR_Acertos: TLabel;
    LBL_Erros: TLabel;
    LBL_VR_Erros: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRM_Resultado: TFRM_Resultado;

implementation

uses USpeedCalc;

{$R *.dfm}

procedure TFRM_Resultado.FormShow(Sender: TObject);
begin
  LBL_VR_Acertos.Caption := IntToStr(Acertos);
  LBL_VR_Erros.Caption :=  IntToStr(Erros);
  Acertos := 0;
  Erros := 0;
end;

end.
