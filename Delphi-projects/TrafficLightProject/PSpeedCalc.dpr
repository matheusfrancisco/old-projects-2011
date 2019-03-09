program PSpeedCalc;

uses
  Forms,
  USpeedCalc in 'USpeedCalc.pas' {FRM_Principal},
  UResultado in 'UResultado.pas' {FRM_Resultado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRM_Principal, FRM_Principal);
  Application.CreateForm(TFRM_Resultado, FRM_Resultado);
  Application.Run;
end.
