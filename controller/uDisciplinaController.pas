unit uDisciplinaController;

interface
uses
  uDisciplina, FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections;

  type TDisciplinaController = class
  private
    FDisciplina: TDisciplina;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarDisciplina(nome:String);
    Function SelectDisciplinaPorId(id: Integer):TDisciplina;
    procedure AlterarDisciplina(id:integer; nome:String);
    procedure DeletarDisciplina(id: Integer);
    function ListarDisciplinas: TObjectList<TDisciplina>;
    function QuantidadeDisciplinas: Integer;
  end;


implementation

{ TDisciplinaController }

procedure TDisciplinaController.AdicionarDisciplina(nome:String);
begin
  FDisciplina.setNome(nome);
  FDisciplina.Adicionar;
end;

procedure TDisciplinaController.AlterarDisciplina(id: integer; nome: String);
begin
  FDisciplina:= TDisciplina.Create(connection);
  FDisciplina.setId(id);
  FDisciplina.setNome(nome);
  FDisciplina.Alterar;
end;

constructor TDisciplinaController.Create(connection: TFDConnection);
begin
   FDisciplina:= TDisciplina.Create(connection);
   self.connection:= connection;
end;



procedure TDisciplinaController.DeletarDisciplina(id:Integer);
begin
  FDisciplina:= TDisciplina.Create(connection);
  FDisciplina.setId(id);
  FDisciplina.Deletar;
end;

function TDisciplinaController.ListarDisciplinas: TObjectList<TDisciplina>;
var Query: TFDQuery;
    disciplinas:TDisciplina;
    ListaDisciplinas:TObjectList<TDisciplina>;
begin
  try
    try
      ListaDisciplinas:=TObjectList<TDisciplina>.Create;
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * FROM public.disciplinas';
      Query.Open(Query.SQL.Text);
      while (Not Query.Eof) do begin
        disciplinas:=TDisciplina.Create(self.connection);
        disciplinas.setId(Query.FieldByName('id').AsInteger);
        disciplinas.setNome(Query.FieldByName('nome').AsString);
        ListaDisciplinas.Add(disciplinas);
        Query.Next;
      end;
      Result:=ListaDisciplinas;
    finally
      Query.Close;
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;
function TDisciplinaController.QuantidadeDisciplinas: Integer;
var Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select count(*) as quantidade from Disciplinas';
      Query.Open(Query.SQL.Text);
      result:= Query.FieldByName('quantidade').AsInteger;
    finally
      Query.Close;
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;

function TDisciplinaController.SelectDisciplinaPorId(id: Integer): TDisciplina;
begin
  FDisciplina:= TDisciplina.Create(connection);
  FDisciplina.setId(id);
  FDisciplina.SelectDisciplinaporid;
  result:= FDisciplina;
end;

end.
