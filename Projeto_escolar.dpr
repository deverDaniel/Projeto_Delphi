program Projeto_escolar;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uEstudante in 'model\uEstudante.pas',
  uProfessores in 'model\uProfessores.pas',
  uDisciplinas in 'model\uDisciplinas.pas',
  uTurmas in 'model\uTurmas.pas',
  uMatricula in 'model\uMatricula.pas',
  uEstudantecontroller in 'controller\uEstudantecontroller.pas',
  uProfessorController in 'controller\uProfessorController.pas',
  uDisciplinaController in 'controller\uDisciplinaController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
