unit uEstudante;

interface
  uses data.DB, FireDAC.Comp.Client, System.SysUtils;
  type TEstudante = class
    private
      id: Integer;
      nome: String;
      connection: TFDConnection;
    public
      function getId: Integer;
      function getNome: String;
      procedure setNome(nome: String);
      constructor Create (connection:TFDConnection);
      procedure Adicionar;

  end;
implementation

procedure TEstudante.Adicionar;
var Query:TFDQuery;
begin
  Query:=TFDQuery.Create(nil);
  try
    Query.Connection:=self.connection;
    Query.SQL.Text:='Insert into Estudantes (nome) VALUES (' +QuotedStr(Self.nome) + ')';
    Query.ExecSQL;
  finally
    Query.Close;
    Query.Free;
  end;
end;

{ Estudantes }

constructor TEstudante.Create(connection:TFDConnection);
begin
  self.connection:= connection;
end;

function TEstudante.getId: Integer;
begin
  result:= self.id;
end;

function TEstudante.getNome: String;
begin
  result:= self.nome
end;

procedure TEstudante.setNome(nome: String);
begin
  self.nome:= nome
end;

end.
