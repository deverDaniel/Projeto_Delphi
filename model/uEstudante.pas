unit uEstudante;

interface

uses data.DB, FireDAC.Comp.Client, System.SysUtils, FMX.Dialogs, system.Generics.Collections;

type
  TEstudante = class
  private
    id: Integer;
    nome: String;
    connection: TFDConnection;
  public
    function getId: Integer;
    procedure setId(id: Integer);
    function getNome: String;
    procedure setNome(nome: String);
    constructor Create(connection: TFDConnection);
    procedure Adicionar;
    procedure Validar;
    procedure AlterarEstudante;
    procedure DeletarEstudante;
    procedure SelectEstudanteporid;
  end;

implementation

procedure TEstudante.Adicionar;
var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'Insert into Estudantes (nome) VALUES (' +
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

procedure TEstudante.AlterarEstudante;
var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'UPDATE public.estudantes SET nome= ' +
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

{ Estudantes }

constructor TEstudante.Create(connection: TFDConnection);
begin
  self.connection := connection;
end;

procedure TEstudante.DeletarEstudante;
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'DELETE FROM public.estudantes WHERE id = ' +
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

function TEstudante.getId: Integer;
begin
  result := self.id;
end;

function TEstudante.getNome: String;
begin
  result := self.nome
end;



procedure TEstudante.SelectEstudanteporid;
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * from Estudantes WHERE id = ' + self.id.ToString;
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

procedure TEstudante.setId;
begin
  self.id := id;
end;

procedure TEstudante.setNome(nome: String);
begin
  self.nome := nome
end;

procedure TEstudante.Validar;
begin
  if self.nome = '' then
  begin
    raise Exception.Create('Nome não pode ser vazio');
  end;
end;

end.
