program PConsultorio;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FRM_Principal},
  UPadrao in 'UPadrao.pas' {FRM_Padrao},
  UCadastro in 'UCadastro.pas' {FRM_Cadastro},
  UDMPrincipal in 'UDMPrincipal.pas' {DM_Principal: TDataModule},
  UEstados in 'UEstados.pas' {FRM_Estados},
  UCidades in 'UCidades.pas' {FRM_Cidades},
  UConvenios in 'UConvenios.pas' {FRM_Convenios},
  UEspecializacoes in 'UEspecializacoes.pas' {FRM_Especializacoes},
  UPacientes in 'UPacientes.pas' {FRM_Pacientes},
  UConvenios_Pacientes in 'UConvenios_Pacientes.pas' {FRM_Convenios_Pacientes},
  UMedicos in 'UMedicos.pas' {FRM_Medicos},
  UEspecializacoes_Medicas in 'UEspecializacoes_Medicas.pas' {FRM_Especializacoes_Medicas},
  UConsultas in 'UConsultas.pas' {FRM_Consultas},
  URelMedicos in 'URelMedicos.pas' {FRM_RelMedicos},
  URelPacientes in 'URelPacientes.pas' {FRM_RelPacientes},
  URelConsultas in 'URelConsultas.pas' {FRM_RelConsultas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRM_Principal, FRM_Principal);
  Application.CreateForm(TFRM_Padrao, FRM_Padrao);
  Application.CreateForm(TFRM_Cadastro, FRM_Cadastro);
  Application.CreateForm(TDM_Principal, DM_Principal);
  Application.CreateForm(TFRM_Estados, FRM_Estados);
  Application.CreateForm(TFRM_Cidades, FRM_Cidades);
  Application.CreateForm(TFRM_Convenios, FRM_Convenios);
  Application.CreateForm(TFRM_Especializacoes, FRM_Especializacoes);
  Application.CreateForm(TFRM_Pacientes, FRM_Pacientes);
  Application.CreateForm(TFRM_Convenios_Pacientes, FRM_Convenios_Pacientes);
  Application.CreateForm(TFRM_Medicos, FRM_Medicos);
  Application.CreateForm(TFRM_Especializacoes_Medicas, FRM_Especializacoes_Medicas);
  Application.CreateForm(TFRM_Consultas, FRM_Consultas);
  Application.CreateForm(TFRM_RelMedicos, FRM_RelMedicos);
  Application.CreateForm(TFRM_RelPacientes, FRM_RelPacientes);
  Application.CreateForm(TFRM_RelConsultas, FRM_RelConsultas);
  Application.Run;
end.
