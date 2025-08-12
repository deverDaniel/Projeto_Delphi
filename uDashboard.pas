unit uDashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, FireDAC.Comp.Client,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uDisciplinaController, uProfessorController, uTurmaController, uEstudantecontroller, uConexao;

type
  TFormDashboard = class(TForm)
    lbl_titulo: TLabel;
    pnl_professores: TPanel;
    lbl_qtdd_professores: TLabel;
    lbl_professores: TLabel;
    pnl_estudantes: TPanel;
    lbl_qtdd_estudantes: TLabel;
    lbl_estudantes: TLabel;
    pnl_disciplinas: TPanel;
    lbl_qtdd_disciplinas: TLabel;
    lbl_disciplina: TLabel;
    pnl_turmas: TPanel;
    lbl_qtdd_turmas: TLabel;
    lbl_turmas: TLabel;
    connection: TFDConnection;
    procedure FormShow(Sender: TObject);
  private
    procedure Preencheestudante;
    procedure PreencheProfessores;
    procedure PreencherDisciplinas;
  public
    { Public declarations }
  end;

var
  FormDashboard: TFormDashboard;

implementation

{$R *.dfm}

procedure TFormDashboard.FormShow(Sender: TObject);
begin
  Preencheestudante;
  PreencheProfessores;
  PreencherDisciplinas;
end;

procedure TFormDashboard.Preencheestudante;
var
  estudanteController: TEstudanteController;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected := true;
  estudantecontroller:= Testudantecontroller.Create(connection);
  lbl_qtdd_estudantes.Caption:= estudantecontroller.QuantidadeEstudantes.ToString;
  connection.Connected:= False;
end;

procedure TFormDashboard.PreencheProfessores;
var
  ProfessorController: TProfessorController;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected := true;
  Professorcontroller:= TProfessorcontroller.Create(connection);
  lbl_qtdd_Professores.Caption:= Professorcontroller.QuantidadeProfessores.ToString;
  connection.Connected:= False
end;

procedure TFormDashboard.PreencherDisciplinas;
var
  DisciplinaController: TDisciplinaController;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected := true;
  Disciplinacontroller:= TDisciplinacontroller.Create(connection);
  lbl_qtdd_Disciplinas.Caption:= Disciplinacontroller.QuantidadeDisciplinas.ToString;
  connection.Connected:= False
end;

end.
