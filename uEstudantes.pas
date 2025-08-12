unit uEstudantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,  uEstudanteController, uEstudante, System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, VCL.ExtCtrls,
  FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.PG, uConexao, Vcl.Grids,
  Vcl.Buttons;

type
  TFormEstudantes = class(TForm)
    lbl_titulo: TLabel;
    GridEstudantes: TStringGrid;
    btnExcluir: TButton;
    pnlExcluirConfirm: TPanel;
    btn_nao: TBitBtn;
    BtnConfirmaExclusao: TBitBtn;
    btn_adicionar: TButton;
    pnlAdicionarEstudante: TPanel;
    EdtEstudante: TEdit;
    lbl_nome: TLabel;
    lblEditaEstudante: TLabel;
    btnAdicionaEstudante: TButton;
    btn_cancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure GridEstudantesSelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure GridEstudantesExit(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridEstudantesSetEditText(Sender: TObject; ACol, ARow: LongInt;
      const Value: string);
    procedure GridEstudantesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnConfirmaExclusaoClick(Sender: TObject);
    procedure btn_naoClick(Sender: TObject);
    procedure btnAdicionaEstudanteClick(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    LinhaSelecionada: integer;
    id: Integer;
    nome: String;
    editando: boolean;
    procedure ListarEstudantes;
  public
    connection: TFDConnection;
  end;

var
  FormEstudantes: TFormEstudantes;

implementation

{$R *.dfm}

procedure TFormEstudantes.btnAdicionaEstudanteClick(Sender: TObject);
var estudantecontroller: TEstudanteController;
begin
  nome:= EdtEstudante.Text;
  if nome.Length < 3 then begin
    ShowMessage('nome Precisa ter mais de 3 letras');
  end else begin
    connection:= FormConexao.FDConnection1;
    connection.Connected:= True;
    estudantecontroller:= Testudantecontroller.Create(connection);
    estudantecontroller.AdicionarEstudante(nome);
    connection.Connected:= False;
    editando:= False;
    pnlAdicionarEstudante.Visible:= False;
    EdtEstudante.Text:= '';
    ListarEstudantes;
  end;

end;

procedure TFormEstudantes.BtnConfirmaExclusaoClick(Sender: TObject);
var estudantecontroller: TEstudanteController;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected:= True;
  estudantecontroller:= Testudantecontroller.Create(connection);
  estudantecontroller.DeletarEstudante(id);
  connection.Connected:= False;
  editando:= False;
  ShowMessage('Excluindo...');
  pnlExcluirConfirm.Visible:= False;
  ListarEstudantes;
end;

procedure TFormEstudantes.btnExcluirClick(Sender: TObject);
begin
  if LinhaSelecionada <> -1 then begin
    pnlExcluirConfirm.Visible:= True;
    nome:= GridEstudantes.Cells[0,LinhaSelecionada];
    pnlExcluirConfirm.Caption:= 'Deseja Excluir: ' + nome;
  end else begin
    ShowMessage('selecione um Estudante');
  end;
  
end;

procedure TFormEstudantes.btn_adicionarClick(Sender: TObject);
begin
  pnlAdicionarEstudante.Visible:= True;
end;

procedure TFormEstudantes.FormCreate(Sender: TObject);
begin
  editando := False;
  LinhaSelecionada:= -1;
end;

procedure TFormEstudantes.FormShow(Sender: TObject);
begin
  ListarEstudantes;
end;

procedure TFormEstudantes.listarEstudantes;
var
  estudantecontroller: TEstudanteController;
  estudante: Testudante;
  ListaEstudantes: TObjectList<Testudante>;
  count:Integer;
begin
  connection:= FormConexao.FDConnection1;
  connection.Connected := true;
  estudantecontroller:= Testudantecontroller.Create(connection);
  ListaEstudantes:= estudantecontroller.ListarEstudantes;
  GridEstudantes.Cells[0,0]:='Nome';
  GridEstudantes.Cells[1,0]:='id';
  GridEstudantes.ColWidths[1] := 0;
  count:= 1;
  for estudante in ListaEstudantes do begin
    GridEstudantes.Cells[0,count]:= estudante.getNome;
    GridEstudantes.Cells[1,count]:= estudante.getId.ToString;
    Inc(count);
    GridEstudantes.RowCount:= count;
  end;
  connection.Connected := False;
end;

procedure TFormEstudantes.GridEstudantesExit(Sender: TObject);
var
  estudantecontroller: TEstudanteController;
begin
  //
end;

procedure TFormEstudantes.GridEstudantesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  estudantecontroller: TEstudanteController;
begin
  if (Key = VK_RETURN) and Editando then
  begin
    editando:= False;
    connection:= FormConexao.FDConnection1;
    connection.Connected:= True;
    nome:= GridEstudantes.Cells[0,LinhaSelecionada];
    estudantecontroller:= Testudantecontroller.Create(connection);
    estudantecontroller.AlterarEstudante(id, nome);
    connection.Connected:= False;
    Key := VK_TAB;
  end;
end;

procedure TFormEstudantes.GridEstudantesSelectCell(Sender: TObject; ACol,
  ARow: LongInt; var CanSelect: Boolean);
var
  estudantecontroller: TEstudanteController;
begin
 if (LinhaSelecionada <> Arow) and editando then begin
  editando:= False;
  connection:= FormConexao.FDConnection1;
  connection.Connected:= True;
  nome:= GridEstudantes.Cells[0,LinhaSelecionada];
  estudantecontroller:= Testudantecontroller.Create(connection);
  estudantecontroller.AlterarEstudante(id, nome);
  connection.Connected:= False;
 end;
 LinhaSelecionada:= Arow;
 id:= GridEstudantes.Cells[1,LinhaSelecionada].ToInteger;

end;

procedure TFormEstudantes.GridEstudantesSetEditText(Sender: TObject; ACol,
  ARow: LongInt; const Value: string);
begin
  editando:=True;
end;

procedure TFormEstudantes.btn_naoClick(Sender: TObject);
begin
  pnlExcluirConfirm.Visible:= False;
end;

procedure TFormEstudantes.btn_cancelarClick(Sender: TObject);
begin
  pnlAdicionarEstudante.Visible:= False;
end;

end.
