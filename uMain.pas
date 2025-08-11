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
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, uEstudantes, uConexao;

type
  TForm1 = class(TForm)
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
    Label2: TLabel;
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
    DataSource1: TDataSource;
    pnl_direita: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure lbl_estudanteClick(Sender: TObject);
    procedure img_estudanteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FormAberto: Tform;
    procedure AbrirFormEstudantes;
    procedure TrocarPanelSelecionado(labelselecionado: TLabel; PanelSelecionado: TPanel);
  public
    connection: TFDConnection;
    pnlSelecionado: TPanel;
    labelSelecionado: TLabel;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AbrirFormEstudantes;
begin
  TrocarPanelSelecionado(lbl_estudante, pnl_estudante);
  FormAberto:= FormEstudantes;
  FormEstudantes.Parent := pnl_direita;
  FormEstudantes.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  estudantecontroller: TEstudanteController;
  estudante: Testudante;
  ListaEstudantes: TObjectList<Testudante>;
  professorController: TProfessorController;
  professor: TProfessor;
  Listaprofessores: TObjectList<Tprofessor>;
  disciplinaController: TDisciplinaController;
  disciplina: TDisciplina;
  Listadisciplinas: TObjectList<Tdisciplina>;
  turmaController: TTurmaController;
  turma: TTurma;
  Listaturmas: TObjectList<Tturma>;
  matriculaController: TMatriculaController;
  matricula: Tmatricula;
  Listamatriculas: TObjectList<Tmatricula>;
begin
  pnlSelecionado:= pnl_btn_dashboard;
  labelSelecionado:= lbl_dashboard;
end;

procedure TForm1.FormShow(Sender: TObject);
//  estudantecontroller: TEstudanteController;
//  estudante: Testudante;
//  ListaEstudantes: TObjectList<Testudante>;
begin
// connection:= form2.FDConnection1;
// connection.Connected := true;
//
//  estudantecontroller:= Testudantecontroller.Create(connection);
//  ListaEstudantes:= estudantecontroller.ListarEstudantes;
//  for estudante in ListaEstudantes do begin
//    ShowMessage(estudante.getNome);
//  end;
//  connection.Connected := False;
end;

procedure TForm1.img_estudanteClick(Sender: TObject);
begin
  AbrirFormEstudantes;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
//aaa
end;

procedure TForm1.lbl_estudanteClick(Sender: TObject);
begin
  AbrirFormEstudantes;
end;

procedure TForm1.TrocarPanelSelecionado(labelselecionado: TLabel; PanelSelecionado: TPanel);
begin
  self.pnlSelecionado.Color:= clBtnFace;
  self.labelSelecionado.Font.Color:= clWindowText;
  pnlSelecionado:= PanelSelecionado;
  labelSelecionado:= labelselecionado;
  pnlSelecionado.Color:= clSkyBlue;
  labelSelecionado.Font.Color:= clWindow;
end;

end.
