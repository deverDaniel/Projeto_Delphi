unit uDisciplinas;

interface
  uses data.DB, FireDAC.Comp.Client, System.SysUtils, FMX.Dialogs;
type
  TDisciplina = class
  private
    id: Integer;
    nome: String;
    connection: TFDConnection;
  public
    function getId: Integer;
    procedure setId (id: Integer);
    function getNome: String;
    procedure setNome(nome: String);
    constructor Create(connection: TFDConnection);
    procedure Adicionar;
    procedure Validar;
    procedure Alterar;
    procedure Deletar;
    procedure Selectdisciplinaporid;

  end;

implementation

procedure TDisciplina.Adicionar;
var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'Insert into Disciplinas (nome) VALUES (' +
        QuotedStr(self.nome) + ')';
      Query.ExecSQL;
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

procedure TDisciplina.Alterar;
var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'UPDATE public.disciplinas SET nome= ' +
      QuotedStr(self.nome) + ' WHERE id = ' + self.id.ToString;
      Query.ExecSQL;
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

{ Disciplinas }

constructor TDisciplina.Create(connection: TFDConnection);
begin
  self.connection:= connection;

end;

procedure TDisciplina.Deletar;
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'DELETE FROM public.disciplinas WHERE id = ' +
        self.id.ToString;
      Query.ExecSQL;
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

function TDisciplina.getId: Integer;
begin
  result := self.id;
end;

function TDisciplina.getNome: String;
begin
  result := self.nome
end;

procedure TDisciplina.SelectDisciplinaporid;
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * from Disciplinas WHERE id = ' + self.id.ToString;
      Query.Open(Query.SQL.Text);
      Self.id:= Query.FieldByName('id').AsInteger;
      self.nome:=  Query.FieldByName('nome').AsString;
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

procedure TDisciplina.setId(id: Integer);
begin
  self.id:= id;
end;

procedure TDisciplina.setNome(nome: String);
begin
  self.nome := nome
end;

procedure TDisciplina.Validar;
begin
  if self.nome = '' then
  begin
    raise Exception.Create('Nome não pode ser vazio');
  end;
end;

end.
