program Projeto_escolar;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FormMain},
  uEstudante in 'model\uEstudante.pas',
  uProfessor in 'model\uProfessor.pas',
  uDisciplina in 'model\uDisciplina.pas',
  uTurma in 'model\uTurma.pas',
  uMatricula in 'model\uMatricula.pas',
  uEstudantecontroller in 'controller\uEstudantecontroller.pas',
  uProfessorController in 'controller\uProfessorController.pas',
  uDisciplinaController in 'controller\uDisciplinaController.pas',
  uTurmaController in 'controller\uTurmaController.pas',
  uMatriculaController in 'controller\uMatriculaController.pas',
  uEstudantes in 'uEstudantes.pas' {FormEstudantes},
  uConexao in 'uConexao.pas' {FormConexao},
  uProfessores in 'uProfessores.pas' {FormProfessores},
  uDisciplinas in 'uDisciplinas.pas' {FormDisciplinas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormConexao, FormConexao);
  Application.CreateForm(TFormDisciplinas, FormDisciplinas);
  Application.CreateForm(TFormEstudantes, FormEstudantes);
  Application.CreateForm(TFormProfessores, FormProfessores);
  Application.Run;
end.
