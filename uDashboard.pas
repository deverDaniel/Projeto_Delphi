unit uDashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uDisciplinaController, uProfessorController, uTurmaController, uEstudantecontroller;

type
  TFormDashboard = class(TForm)
    lbl_titulo: TLabel;
    pnl_professores: TPanel;
    lbl_professores: TLabel;
    lbl_qtdd_professores: TLabel;
    pnl_estudantes: TPanel;
    lbl_qtdd_estudantes: TLabel;
    lbl_estudantes: TLabel;
    pnl_disciplinas: TPanel;
    lbl_qtdd_disciplinas: TLabel;
    lbl_disciplina: TLabel;
    pnl_turmas: TPanel;
    lbl_qtdd_turmas: TLabel;
    lbl_turmas: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDashboard: TFormDashboard;

implementation

{$R *.dfm}

end.
