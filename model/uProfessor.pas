unit uProfessor;

interface
  uses data.DB, FireDAC.Comp.Client, System.SysUtils, FMX.Dialogs;
type
  TProfessor = class
  private
    id: Integer;
    nome: String;
    cpf: String;
    connection: TFDConnection;
  public
    function getId: Integer;
    procedure setId(id:Integer);
    function getNome: String;
    procedure setNome(nome: String);
    function getCpf: String;
    procedure setCpf(cpf: String);
    constructor Create(connection: TFDConnection);
    procedure Validar;
    procedure Adicionar;
    procedure AlterarProfessor;
    procedure DeletarProfessor;
    procedure SelectProfessorporid;

  end;

implementation

procedure TProfessor.Adicionar;
  var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'Insert into Professores (nome, cpf) VALUES (' +
        QuotedStr(self.nome) + ', '+ QuotedStr(self.cpf) +' )';
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

procedure TProfessor.AlterarProfessor;
var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'UPDATE public.Professores SET nome= ' +
      QuotedStr(self.nome) + ', cpf= ' + QuotedStr(self.cpf) +' WHERE id = ' + self.id.ToString;
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

{ Professores }

constructor TProfessor.Create(connection: TFDConnection);
begin
  self.connection:= connection;
end;

procedure TProfessor.DeletarProfessor;
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'DELETE FROM public.Professores WHERE id = ' +
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

function TProfessor.getCpf: String;
begin
  result := self.cpf;
end;

function TProfessor.getId: Integer;
begin
  result := self.id;
end;

function TProfessor.getNome: String;
begin
  result := self.nome
end;

procedure TProfessor.SelectProfessorporid;
  var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * from Professores WHERE id = ' + self.id.ToString;
      Query.Open(Query.SQL.Text);
      Self.id:= Query.FieldByName('id').AsInteger;
      self.nome:=  Query.FieldByName('nome').AsString;
      self.cpf:=  Query.FieldByName('cpf').AsString;
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

procedure TProfessor.setId(id: Integer);
begin
  self.id:= id;
end;

procedure TProfessor.setCpf(cpf: String);
begin
  self.cpf := cpf;
end;

procedure TProfessor.setNome(nome: String);
begin
  self.nome := nome
end;

procedure TProfessor.Validar;
begin
  if self.nome = '' then
  begin
    raise Exception.Create('Nome não pode ser vazio');
  end;
  if length(self.cpf) <> 11 then
  begin
    raise Exception.Create('CPF deve conter 11 digitos');
  end;
end;

end.
