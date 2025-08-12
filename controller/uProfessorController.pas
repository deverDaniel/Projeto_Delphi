unit uProfessorController;

interface
uses
  uProfessor, FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections;

  type TProfessorController = class
  private
    FProfessor: TProfessor;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarProfessor(nome, cpf:String);
    Function SelectProfessorPorId(id: Integer):TProfessor;
    procedure Alterarprofessor(id:integer; nome, cpf:String);
    procedure DeletarProfessor(id: Integer);
    function ListarProfessores: TObjectList<TProfessor>;
    function QuantidadeProfessores: Integer;
  end;


implementation

{ TEstudanteController }

procedure TProfessorController.AdicionarProfessor(nome, cpf:String);
begin
  FProfessor.setNome(nome);
  FProfessor.setCpf(cpf);
  FProfessor.Adicionar;
end;

procedure TProfessorController.AlterarProfessor(id: integer; nome, cpf: String);
begin
  FProfessor:= TProfessor.Create(connection);
  FProfessor.setId(id);
  FProfessor.setNome(nome);
  FProfessor.setCpf(cpf);
  FProfessor.AlterarProfessor;
end;

constructor TProfessorController.Create(connection: TFDConnection);
begin
   FProfessor:= TProfessor.Create(connection);
   self.connection:= connection;
end;



procedure TProfessorController.DeletarProfessor(id:Integer);
begin
  FProfessor:= TProfessor.Create(connection);
  FProfessor.setId(id);
  FProfessor.DeletarProfessor;
end;

function TProfessorController.ListarProfessores: TObjectList<TProfessor>;
var Query: TFDQuery;
    Professor:TProfessor;
    ListaProfessores:TObjectList<TProfessor>;
begin
  try
    try
      ListaProfessores:= TObjectList<TProfessor>.Create;
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * FROM public.professores';
      Query.Open(Query.SQL.Text);
      while (Not Query.Eof) do begin
        Professor:=TProfessor.Create(self.connection);
        Professor.setId(Query.FieldByName('id').AsInteger);
        Professor.setNome(Query.FieldByName('nome').AsString);
        Professor.setcpf(Query.FieldByName('cpf').AsString);
        ListaProfessores.Add(Professor);
        Query.Next;
      end;
      Result:=ListaProfessores;
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

function TProfessorController.QuantidadeProfessores: Integer;
var Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select count(*) as quantidade from Professores';
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

function TProfessorController.SelectProfessorPorId(id: Integer): TProfessor;
begin
  FProfessor:= TProfessor.Create(connection);
  FProfessor.setId(id);
  FProfessor.SelectProfessorporid;
  result:= FProfessor;
end;

end.
