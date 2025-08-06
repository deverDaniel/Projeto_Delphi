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
  Vcl.Tabs, Vcl.ComCtrls, uEstudanteController, uEstudante, uProfessores, uProfessorController, uDisciplinas, uDisciplinaController;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure FormCreate(Sender: TObject);
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
  professorController: TProfessorController;
  professor: TProfessor;
  disciplinaController: TDisciplinaController;
  disciplina: TDisciplina;
begin
  connection:= FDConnection1;
  //  validar os campos
  // if edit_nome.text = '' then begin
    //ShowMessage('campo nome obrigatorio');
  // end;

  connection.Connected := true;
  disciplinaController:= TDisciplinaController.Create(connection);
  //disciplinaController.DeletarDisciplina(4);
  //professor:= professorController.SelectProfessorPorId(2);
  //showMessage(professor.getNome);
  //showMessage(professor.getCpf);
  //ShowMessage(disciplina.getNome);
  connection.Connected := False;
end;

end.
