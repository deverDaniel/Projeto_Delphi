unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  Vcl.Tabs, Vcl.ComCtrls, uEstudanteController, uEstudante, uProfessor, uProfessorController,
  uDisciplina, uDisciplinaController, uTurma, uTurmaController,
  uMatricula, uMatriculaController, System.Generics.Collections, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, uEstudantes, uConexao, UProfessores;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    pnl_fundo: TPanel;
    pnl_esquerda: TPanel;
    pnl_logo: TPanel;
    pnl_btn_dashboard: TPanel;
    img_dashboard: TImage;
    lbl_dashboard: TLabel;
    pnl_btn_professor: TPanel;
    img_professor: TImage;
    lbl_professor: TLabel;
    pnl_estudante: TPanel;
    img_estudante: TImage;
    lbl_estudante: TLabel;
    pnl_disciplina: TPanel;
    img_disciplina: TImage;
    lbl_disciplina: TLabel;
    pnl_turma: TPanel;
    img_turma: TImage;
    lbl_turma: TLabel;
    Panel1: TPanel;
    img_matricula: TImage;
    Label1: TLabel;
    pnl_direita: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure lbl_professorClick(Sender: TObject);
    procedure lbl_estudanteClick(Sender: TObject);
    procedure img_estudanteClick(Sender: TObject);
  private
    FormAberto: Tform;
    procedure AbrirFormEstudantes;
    procedure AbrirFormProfessores;
    procedure TrocarPanelSelecionado(labelselecionado: TLabel; PanelSelecionado: TPanel);
  public
    connection: TFDConnection;
    pnlSelecionado: TPanel;
    labelSelecionado: TLabel;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.AbrirFormEstudantes;
begin
  TrocarPanelSelecionado(lbl_estudante, pnl_estudante);
  FormAberto:= FormEstudantes;
  FormEstudantes.Parent := pnl_direita;
  FormEstudantes.Show;
end;

procedure TForm3.AbrirFormProfessores;
begin
  TrocarPanelSelecionado(lbl_professor, pnl_btn_professor);
  FormAberto:= FormProfessores;
  FormProfessores.Parent := pnl_direita;
  FormProfessores.Show;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  pnlSelecionado:= pnl_btn_dashboard;
  labelSelecionado:= lbl_dashboard;
end;

procedure TForm3.img_estudanteClick(Sender: TObject);
begin
  AbrirFormEstudantes;
end;

procedure TForm3.lbl_professorClick(Sender: TObject);
begin
  AbrirFormProfessores;
end;

procedure TForm3.lbl_estudanteClick(Sender: TObject);
begin
  AbrirFormEstudantes;
end;

procedure TForm3.TrocarPanelSelecionado(labelselecionado: TLabel; PanelSelecionado: TPanel);
begin
  self.pnlSelecionado.Color:= clBtnFace;
  self.labelSelecionado.Font.Color:= clWindowText;
  self.pnlSelecionado:= PanelSelecionado;
  self.labelSelecionado:= labelselecionado;
  PanelSelecionado.Color:= clSkyBlue;
  labelSelecionado.Font.Color:= clWindow;
end;

end.
