unit uTurmas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons, uTurmaController, uTurma,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.PG, uConexao, System.Generics.Collections,
  uDisciplinaController, uProfessorController, uProfessor, uDisciplina;

type
  TFormTurmas = class(TForm)
    lbl_titulo: TLabel;
    btn_adicionar: TButton;
    btnExcluir: TButton;
    GridTurmas: TStringGrid;
    pnlExcluirConfirm: TPanel;
    btn_nao: TBitBtn;
    BtnConfirmaExclusao: TBitBtn;
    pnlAdicionarTurma: TPanel;
    lblDisciplina: TLabel;
    lblEditaTurma: TLabel;
    lblProfessor: TLabel;
    btnAdicionaTurma: TButton;
    btn_cancelar: TButton;
    Cbox_Disciplina: TComboBox;
    cbox_professor: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridTurmasExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BtnConfirmaExclusaoClick(Sender: TObject);
    procedure btn_naoClick(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
//    procedure btnAdicionaProfessorClick(Sender: TObject);
    procedure GridTurmasSetEditText(Sender: TObject; ACol, ARow: LongInt;
      const Value: string);
    procedure GridTurmasSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure GridTurmasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
    LinhaSelecionada: integer;
    id: Integer;
    id_professor: String;
    cpf: String;
    editando: boolean;
    procedure ListarTurmas;

  public
    connection: TFDConnection;
  end;

var
  FormTurmas: TFormTurmas;




implementation

{$R *.dfm}

//procedure TformTurmas.btnAdicionaProfessorClick(Sender: TObject);
//var TurmaController: TTurmaController;
//begin
//  Professor:= cbox_professor.;
//  cpf:= edtDisciplina.Text;
//  if id_professor.Length < 3 then begin
//    ShowMessage('id_professor Precisa ter mais de 3 letras');
//  end else if cpf.Length < 11 then begin
//     ShowMessage('Cpf Precisa ter 11 caracteres');
//  end else begin
//    connection:= FormConexao.FDConnection1;
//    connection.Connected:= True;
//    TurmaController:= TTurmaController.Create(connection);
//    TurmaController.AdicionarTurma(id_professor, cpf);
//    connection.Connected:= False;
//    editando:= False;
//    pnlAdicionarTurma.Visible:= False;
//    EdtProfessor.Text:= '';
//    ListarTurmas;
//  end;
//end;


procedure TFormTurmas.BtnConfirmaExclusaoClick(Sender: TObject);
var TurmaController: TTurmaController;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected:= True;
  TurmaController:= TTurmaController.Create(connection);
  TurmaController.DeletarTurma(id);
  connection.Connected:= False;
  editando:= False;
  ShowMessage('Excluindo...');
  pnlExcluirConfirm.Visible:= False;
  ListarTurmas;
end;

procedure TFormTurmas.btnExcluirClick(Sender: TObject);
begin
  if LinhaSelecionada <> -1 then begin
    pnlExcluirConfirm.Visible:= True;
    id_professor:= GridTurmas.Cells[0,LinhaSelecionada];
    pnlExcluirConfirm.Caption:= 'Deseja Excluir: ' + id_professor;
  end else begin
    ShowMessage('selecione um Professor');
  end;

end;

procedure TFormTurmas.btn_adicionarClick(Sender: TObject);
begin
  pnlAdicionarTurma.Visible:= True;
end;

procedure TFormTurmas.FormCreate(Sender: TObject);
begin
  editando := False;
  LinhaSelecionada:= -1;
end;

procedure TFormTurmas.FormShow(Sender: TObject);
begin
  ListarTurmas;
end;

procedure TFormTurmas.listarturmas;
var
  TurmaController: TTurmaController;
  Turma: TTurma;
  ListaTurmas: TObjectList<TTurma>;
  count:Integer;
  professorcontroller: TProfessorController;
  Professor: TProfessor;
  Disciplinacontroller: TDisciplinaController;
  Disciplina: TDisciplina;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected := true;
  TurmaController:= TTurmaController.Create(connection);
  ListaTurmas:= TurmaController.ListarTurmas;
  GridTurmas.Cells[0,0]:='Professor';
  GridTurmas.Cells[1,0]:= 'Disciplina';
  GridTurmas.Cells[2,0]:='id';
  GridTurmas.ColWidths[2] := 0;
  count:= 1;
  for Turma in ListaTurmas do begin
    professorcontroller:= TProfessorController.Create(connection);
    professor:= professorcontroller.SelectProfessorPorId(Turma.getIdProfessor);
    GridTurmas.Cells[0,count]:= professor.getNome;
    Disciplinacontroller:= TDisciplinaController.Create(connection);
    Disciplina:= Disciplinacontroller.SelectDisciplinaPorId(Turma.getIdDisciplina);
    GridTurmas.Cells[1,count]:= Disciplina.getNome;
    GridTurmas.Cells[2,count]:= Turma.getId.ToString;
    Inc(count);
    GridTurmas.RowCount:= count;
  end;
  connection.Connected := False;
end;

procedure TFormTurmas.GridTurmasExit(Sender: TObject);
var
  TurmaController: TTurmaController;
begin
  //
end;

procedure TFormTurmas.GridTurmasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var TurmaController: TTurmaController;
begin
  if (Key = VK_RETURN) and Editando then
  begin
    editando:= False;
    connection:= FormConexao.FDConnection1;
    connection.Connected:= True;
    id_professor:= GridTurmas.Cells[0,LinhaSelecionada];
    cpf:= GridTurmas.Cells[1,LinhaSelecionada];
    TurmaController:= TTurmaController.Create(connection);
    TurmaController.AlterarTurma(id, 1, 1);
    connection.Connected:= False;
    Key := VK_TAB;
  end;
end;



procedure TFormTurmas.GridTurmasSelectCell(Sender: TObject; ACol,
  ARow: LongInt; var CanSelect: Boolean);
var
  TurmaController: TTurmaController;
begin
 if (LinhaSelecionada <> Arow) and editando then begin
  editando:= False;
  connection:= FormConexao.FDConnection1;
  connection.Connected:= True;
  id_professor:= GridTurmas.Cells[0,LinhaSelecionada];
  cpf:= GridTurmas.Cells[1,LinhaSelecionada];
  TurmaController:= TTurmaController.Create(connection);
  TurmaController.AlterarTurma(id, 1, 1);
  connection.Connected:= False;
 end;
 LinhaSelecionada:= Arow;
 id:= GridTurmas.Cells[2,LinhaSelecionada].ToInteger;

end;


procedure TFormTurmas.GridTurmasSetEditText(Sender: TObject; ACol,
  ARow: LongInt; const Value: string);
begin
    editando:=True;
end;

procedure TFormTurmas.btn_naoClick(Sender: TObject);
begin
  pnlExcluirConfirm.Visible:= False;
end;

procedure TFormTurmas.btn_cancelarClick(Sender: TObject);
begin
  pnlAdicionarTurma.Visible:= False;
end;

end.
