program Projeto_escolar;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
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
  uConexao in 'uConexao.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormEstudantes, FormEstudantes);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
