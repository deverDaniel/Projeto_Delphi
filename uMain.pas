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
  Vcl.Tabs, Vcl.ComCtrls, uEstudanteController, uEstudante, uProfessores, uProfessorController,
  uDisciplinas, uDisciplinaController, uTurmas, uTurmaController,
  uMatricula, uMatriculaController, System.Generics.Collections, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnl_fundo: TPanel;
    pnl_esquerda: TPanel;
    pnl_direita: TPanel;
    pnl_logo: TPanel;
    pnl_btn_dashboard: TPanel;
    Image1: TImage;
    Label1: TLabel;
    pnl_btn_professor: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Panel1: TPanel;
    Image3: TImage;
    lbl_estudante: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    connection: TFDConnection;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

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
  connection:= FDConnection1;
  //  validar os campos
  // if edit_nome.text = '' then begin
    //ShowMessage('campo nome obrigatorio');
  // end;

  connection.Connected := true;
  matriculaController:= TmatriculaController.Create(connection);
  listamatriculas:= matriculacontroller.Listarmatriculas;
  for matricula in Listamatriculas do begin
    showMessage(matricula.getIdTurma.ToString);
    showMessage(matricula.getIdEstudante.ToString);
  end;
   listamatriculas.Free;
  //turmaController:= TTurmaController.Create(connection);
  //turma:= turmaController.SelectTurmaPorId(3);
  //disciplinaController.DeletarDisciplina(4);
  //professor:= professorController.SelectProfessorPorId(2);
  //showMessage(matricula.getIdEstudante.ToString);
  //showMessage(professor.getCpf);
  //ShowMessage(disciplina.getNome);
  connection.Connected := False;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
aasdadsa
end;

end.
