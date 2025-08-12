unit uProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons, uProfessorController, uProfessor,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.PG, uConexao, System.Generics.Collections;

type
  TFormProfessores = class(TForm)
    btn_adicionar: TButton;
    btnExcluir: TButton;
    GridProfessores: TStringGrid;
    lbl_titulo: TLabel;
    pnlExcluirConfirm: TPanel;
    btn_nao: TBitBtn;
    BtnConfirmaExclusao: TBitBtn;
    pnlAdicionarProfessor: TPanel;
    lbl_nome: TLabel;
    lblEditaProfessor: TLabel;
    EdtProfessorNome: TEdit;
    btnAdicionaProfessor: TButton;
    btn_cancelar: TButton;
    EdtProfessorCpf: TEdit;
    lblProfessorCpf: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridProfessoresExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BtnConfirmaExclusaoClick(Sender: TObject);
    procedure btn_naoClick(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btnAdicionaProfessorClick(Sender: TObject);
    procedure GridProfessoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridProfessoresSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure GridProfessoresSetEditText(Sender: TObject; ACol, ARow: LongInt;
      const Value: string);
    private
    LinhaSelecionada: integer;
    id: Integer;
    nome: String;
    cpf: String;
    editando: boolean;
    procedure ListarProfessores;

  public
    connection: TFDConnection;
  end;

var
  FormProfessores: TFormProfessores;




implementation

{$R *.dfm}

procedure TFormProfessores.btnAdicionaProfessorClick(Sender: TObject);
var Professorcontroller: TProfessorController;
begin
  nome:= EdtProfessorNome.Text;
  cpf:= EdtProfessorCpf.Text;
  if nome.Length < 3 then begin
    ShowMessage('nome Precisa ter mais de 3 letras');
  end else if cpf.Length < 11 then begin
     ShowMessage('Cpf Precisa ter 11 caracteres');
  end else begin
    connection:= FormConexao.FDConnection1;
    connection.Connected:= True;
    Professorcontroller:= TProfessorcontroller.Create(connection);
    Professorcontroller.AdicionarProfessor(nome, cpf);
    connection.Connected:= False;
    editando:= False;
    pnlAdicionarProfessor.Visible:= False;
    EdtProfessorNome.Text:= '';
    ListarProfessores;
  end;

end;


procedure TFormProfessores.BtnConfirmaExclusaoClick(Sender: TObject);
var Professorcontroller: TProfessorController;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected:= True;
  Professorcontroller:= TProfessorcontroller.Create(connection);
  Professorcontroller.DeletarProfessor(id);
  connection.Connected:= False;
  editando:= False;
  ShowMessage('Excluindo...');
  pnlExcluirConfirm.Visible:= False;
  ListarProfessores;
end;

procedure TFormProfessores.btnExcluirClick(Sender: TObject);
begin
  if LinhaSelecionada <> -1 then begin
    pnlExcluirConfirm.Visible:= True;
    nome:= GridProfessores.Cells[0,LinhaSelecionada];
    pnlExcluirConfirm.Caption:= 'Deseja Excluir: ' + nome;
  end else begin
    ShowMessage('selecione um Professor');
  end;

end;

procedure TFormProfessores.btn_adicionarClick(Sender: TObject);
begin
  pnlAdicionarProfessor.Visible:= True;
end;

procedure TFormProfessores.FormCreate(Sender: TObject);
begin
  editando := False;
  LinhaSelecionada:= -1;
end;

procedure TFormProfessores.FormShow(Sender: TObject);
begin
  ListarProfessores;
end;

procedure TFormProfessores.listarProfessores;
var
  Professorcontroller: TProfessorController;
  Professor: TProfessor;
  ListaProfessores: TObjectList<TProfessor>;
  count:Integer;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected := true;
  Professorcontroller:= TProfessorcontroller.Create(connection);
  ListaProfessores:= Professorcontroller.ListarProfessores;
  GridProfessores.Cells[0,0]:='Nome';
  GridProfessores.Cells[1,0]:= 'cpf';
  GridProfessores.Cells[2,0]:='id';
  GridProfessores.ColWidths[2] := 0;
  count:= 1;
  for Professor in ListaProfessores do begin
    GridProfessores.Cells[0,count]:= Professor.getNome;
    GridProfessores.Cells[1,count]:= Professor.getCpf;
    GridProfessores.Cells[2,count]:= Professor.getId.ToString;
    Inc(count);
    GridProfessores.RowCount:= count;
  end;
  connection.Connected := False;
end;

procedure TFormProfessores.GridProfessoresExit(Sender: TObject);
var
  Professorcontroller: TProfessorController;
begin
  //
end;

procedure TFormProfessores.GridProfessoresKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var Professorcontroller: TProfessorController;
begin
  if (Key = VK_RETURN) and Editando then
  begin
    editando:= False;
    connection:= FormConexao.FDConnection1;
    connection.Connected:= True;
    nome:= GridProfessores.Cells[0,LinhaSelecionada];
    cpf:= GridProfessores.Cells[1,LinhaSelecionada];
    Professorcontroller:= TProfessorcontroller.Create(connection);
    Professorcontroller.AlterarProfessor(id, nome, cpf);
    connection.Connected:= False;
    Key := VK_TAB;
  end;
end;



procedure TFormProfessores.GridProfessoresSelectCell(Sender: TObject; ACol,
  ARow: LongInt; var CanSelect: Boolean);
var
  Professorcontroller: TProfessorController;
begin
 if (LinhaSelecionada <> Arow) and editando then begin
  editando:= False;
  connection:= FormConexao.FDConnection1;
  connection.Connected:= True;
  nome:= GridProfessores.Cells[0,LinhaSelecionada];
  cpf:= GridProfessores.Cells[1,LinhaSelecionada];
  Professorcontroller:= TProfessorcontroller.Create(connection);
  Professorcontroller.AlterarProfessor(id, nome, cpf);
  connection.Connected:= False;
 end;
 LinhaSelecionada:= Arow;
 id:= GridProfessores.Cells[2,LinhaSelecionada].ToInteger;

end;


procedure TFormProfessores.GridProfessoresSetEditText(Sender: TObject; ACol,
  ARow: LongInt; const Value: string);
begin
    editando:=True;
end;

procedure TFormProfessores.btn_naoClick(Sender: TObject);
begin
  pnlExcluirConfirm.Visible:= False;
end;

procedure TFormProfessores.btn_cancelarClick(Sender: TObject);
begin
  pnlAdicionarProfessor.Visible:= False;
end;

end.
