unit uDisciplinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Buttons, uDisciplinaController, uDisciplina,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.PG, uConexao, System.Generics.Collections;

type
  TFormDisciplinas = class(TForm)
    lbl_titulo: TLabel;
    GridDisciplinas: TStringGrid;
    btnExcluir: TButton;
    pnlExcluirConfirm: TPanel;
    btn_nao: TBitBtn;
    BtnConfirmaExclusao: TBitBtn;
    btn_adicionar: TButton;
    pnlAdicionarDisciplina: TPanel;
    lbl_nome: TLabel;
    lblEditaDisciplina: TLabel;
    EdtDisciplinaNome: TEdit;
    btnAdicionaDisciplina: TButton;
    btn_cancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure GridDisciplinasExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BtnConfirmaExclusaoClick(Sender: TObject);
    procedure btn_naoClick(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btnAdicionaDisciplinaClick(Sender: TObject);
    procedure GridDisciplinasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridDisciplinasSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure GridDisciplinasSetEditText(Sender: TObject; ACol, ARow: LongInt;
      const Value: string);
    procedure FormShow(Sender: TObject);
    private
    LinhaSelecionada: integer;
    id: Integer;
    nome: String;
    editando: boolean;
    procedure ListarDisciplinas;

  public
    connection: TFDConnection;
  end;

var
  FormDisciplinas: TFormDisciplinas;




implementation

{$R *.dfm}

procedure TFormDisciplinas.btnAdicionaDisciplinaClick(Sender: TObject);
var Disciplinacontroller: TDisciplinaController;
begin
  nome:= EdtDisciplinaNome.Text;
  if nome.Length < 3 then begin
    ShowMessage('nome da disciplina precisa ter mais de 3 letras');
  end else begin
    connection:= FormConexao.FDConnection1;
    connection.Connected:= True;
    Disciplinacontroller:= TDisciplinacontroller.Create(connection);
    Disciplinacontroller.AdicionarDisciplina(nome);
    connection.Connected:= False;
    editando:= False;
    pnlAdicionarDisciplina.Visible:= False;
    EdtDisciplinaNome.Text:= '';
    ListarDisciplinas;
  end;

end;


procedure TFormDisciplinas.BtnConfirmaExclusaoClick(Sender: TObject);
var Disciplinacontroller: TDisciplinaController;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected:= True;
  Disciplinacontroller:= TDisciplinacontroller.Create(connection);
  Disciplinacontroller.DeletarDisciplina(id);
  connection.Connected:= False;
  editando:= False;
  ShowMessage('Excluindo...');
  pnlExcluirConfirm.Visible:= False;
  ListarDisciplinas;
end;

procedure TFormDisciplinas.btnExcluirClick(Sender: TObject);
begin
  if LinhaSelecionada <> -1 then begin
    pnlExcluirConfirm.Visible:= True;
    nome:= GridDisciplinas.Cells[0,LinhaSelecionada];
    pnlExcluirConfirm.Caption:= 'Deseja Excluir: ' + nome;
  end else begin
    ShowMessage('selecione uma Disciplina');
  end;

end;

procedure TFormDisciplinas.btn_adicionarClick(Sender: TObject);
begin
  pnlAdicionarDisciplina.Visible:= True;
end;

procedure TFormDisciplinas.FormCreate(Sender: TObject);
begin
  editando := False;
  LinhaSelecionada:= -1;
end;


procedure TFormDisciplinas.FormShow(Sender: TObject);
begin
  ListarDisciplinas;
end;

procedure TFormDisciplinas.listarDisciplinas;
var
  Disciplinacontroller: TDisciplinaController;
  Disciplina: TDisciplina;
  ListaDisciplinas: TObjectList<TDisciplina>;
  count:Integer;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected := true;
  Disciplinacontroller:= TDisciplinacontroller.Create(connection);
  ListaDisciplinas:= Disciplinacontroller.ListarDisciplinas;
  GridDisciplinas.Cells[0,0]:='Nome';
  GridDisciplinas.Cells[1,0]:='id';
  GridDisciplinas.ColWidths[1] := 0;
  count:= 1;
  for Disciplina in ListaDisciplinas do begin
    GridDisciplinas.Cells[0,count]:= Disciplina.getNome;
    GridDisciplinas.Cells[1,count]:= Disciplina.getId.ToString;
    Inc(count);
    GridDisciplinas.RowCount:= count;
  end;
  connection.Connected := False;
end;

procedure TFormDisciplinas.GridDisciplinasExit(Sender: TObject);
var
  Disciplinacontroller: TDisciplinaController;
begin
  //
end;

procedure TFormDisciplinas.GridDisciplinasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var Disciplinacontroller: TDisciplinaController;
begin
  if (Key = VK_RETURN) and Editando then
  begin
    editando:= False;
    connection:= FormConexao.FDConnection1;
    connection.Connected:= True;
    nome:= GridDisciplinas.Cells[0,LinhaSelecionada];
    Disciplinacontroller:= TDisciplinacontroller.Create(connection);
    Disciplinacontroller.AlterarDisciplina(id, nome);
    connection.Connected:= False;
    Key := VK_TAB;
  end;
end;



procedure TFormDisciplinas.GridDisciplinasSelectCell(Sender: TObject; ACol,
  ARow: LongInt; var CanSelect: Boolean);
var
  Disciplinacontroller: TDisciplinaController;
begin
 if (LinhaSelecionada <> Arow) and editando then begin
  editando:= False;
  connection:= FormConexao.FDConnection1;
  connection.Connected:= True;
  nome:= GridDisciplinas.Cells[0,LinhaSelecionada];
  Disciplinacontroller:= TDisciplinacontroller.Create(connection);
  Disciplinacontroller.AlterarDisciplina(id, nome);
  connection.Connected:= False;
 end;
 LinhaSelecionada:= Arow;
 id:= GridDisciplinas.Cells[1,LinhaSelecionada].ToInteger;

end;


procedure TFormDisciplinas.GridDisciplinasSetEditText(Sender: TObject; ACol,
  ARow: LongInt; const Value: string);
begin
    editando:=True;
end;

procedure TFormDisciplinas.btn_naoClick(Sender: TObject);
begin
  pnlExcluirConfirm.Visible:= False;
end;

procedure TFormDisciplinas.btn_cancelarClick(Sender: TObject);
begin
  pnlAdicionarDisciplina.Visible:= False;
end;

end.
