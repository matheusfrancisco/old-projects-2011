unit USpeedCalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, GIFImg, ExtCtrls;

type
  TFRM_Principal = class(TForm)
    LBL_Nome: TLabel;
    LBL_Questao: TLabel;
    LBL_Resultado: TLabel;
    LBL_Resposta: TLabel;
    LBL_Valor1: TLabel;
    LBL_Valor2: TLabel;
    LBL_Operador: TLabel;
    LBL_VR_Resposta: TLabel;
    IMG_Semaforo: TImage;
    BTN_iniciar: TSpeedButton;
    EDT_Resultado: TEdit;
    IMG_verde: TImage;
    IMG_Amarelo: TImage;
    IMG_Vermelho: TImage;
    Timer1: TTimer;
    BTN_Finalizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BTN_iniciarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BTN_FinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Operadores : array[0..3] of Char =('+','-','*','/');
  Valor1, Valor2, OP, Segundos, Acertos, Erros: Integer;
  FRM_Principal: TFRM_Principal;

implementation

uses UResultado;

{$R *.dfm}
function Operador(OP : Integer): Char;
begin
 case OP of
   0: Operador := Operadores[0];
   1: Operador := Operadores[1];
   2: Operador := Operadores[2];
   3: Operador := Operadores[3];
 end;
end;

function Resultado(Valor1,Valor2 : Real; OP: Integer) : Real;
begin
  case OP of
  0: Resultado := Valor1+Valor2;
  1: Resultado := Valor1-Valor2;
  2: Resultado := Valor1*Valor2;
  3: Resultado := Valor1/Valor2;
  end;
end;

procedure TFRM_Principal.BTN_FinalizarClick(Sender: TObject);
begin
 FRM_Resultado.Show;
end;

procedure TFRM_Principal.BTN_iniciarClick(Sender: TObject);
begin
  Timer1.Enabled := True;
  Segundos := 0;
  Valor1 := Random(100);
  Valor2 := Random(100);
  LBL_Valor1.Caption := IntToStr(Valor1);
  end;

procedure TFRM_Principal.FormCreate(Sender: TObject);
begin
  IMG_Semaforo.Visible := True;
  IMG_Verde.Visible := False;
  IMG_Amarelo.Visible := False;
  IMG_Vermelho.Visible := False;
end;

procedure TFRM_Principal.Timer1Timer(Sender: TObject);
begin
 if (Segundos < 5) then
 begin
   IMG_Semaforo.Visible := False;
   IMG_Verde.Visible := True;
   IMG_Amarelo.Visible := False;
   IMG_Vermelho.Visible := False;
 end
 else if (Segundos > 5) and (Segundos <10) then
 begin
  IMG_Semaforo.Visible := False;
  IMG_Verde.Visible := False;
  IMG_Amarelo.Visible := True;
  IMG_Vermelho.Visible := False;
 end
 else if (Segundos = 10) then
  begin
  IMG_Semaforo.Visible := False;
  IMG_Verde.Visible := False;
  IMG_Amarelo.Visible := False;
  IMG_Vermelho.Visible := True;
  LBL_VR_Resposta.Caption := FloatToStr(Resultado(Valor1,Valor2,OP));
          if (EDT_Resultado.Text = LBL_VR_Resposta.Caption) then
            Acertos := Acertos + 1
          else
            Erros := Erros +1
  end;
 Segundos := Segundos +1;
end;
end.


