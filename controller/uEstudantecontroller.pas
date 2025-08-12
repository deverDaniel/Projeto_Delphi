unit uEstudanteController;

interface
uses
  uEstudante, FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections;

  type TEstudanteController = class
  private
    FEstudante: TEstudante;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarEstudante(nome:String);
    Function SelectEstudantePorId(id: Integer):TEstudante;
    procedure AlterarEstudante(id:integer; nome:String);
    procedure DeletarEstudante(id: Integer);
    function ListarEstudantes: TObjectList<TEstudante>;
    function QuantidadeEstudantes: integer;
  end;


implementation

{ TEstudanteController }

procedure TEstudanteController.AdicionarEstudante(nome:String);
begin
  FEstudante.setNome(nome);
  FEstudante.Adicionar;
end;

procedure TEstudanteController.AlterarEstudante(id: integer; nome: String);
begin
  FEstudante:= TEstudante.Create(connection);
  FEstudante.setId(id);
  FEstudante.setNome(nome);
  FEstudante.AlterarEstudante;
end;

constructor TEstudanteController.Create(connection: TFDConnection);
begin
   FEstudante:= TEstudante.Create(connection);
   self.connection:= connection;
end;



procedure TEstudanteController.DeletarEstudante(id:Integer);
begin
  FEstudante:= TEstudante.Create(connection);
  FEstudante.setId(id);
  FEstudante.DeletarEstudante;
end;

function TEstudanteController.SelectEstudantePorId(id: Integer): TEstudante;
begin
  FEstudante:= TEstudante.Create(connection);
  FEstudante.setId(id);
  FEstudante.SelectEstudanteporid;
  result:= Festudante;
end;

function TEstudanteController.ListarEstudantes: TObjectList<TEstudante>;
var Query: TFDQuery;
    Estudante:TEstudante;
    ListaEstudantes:TObjectList<TEstudante>;
begin
  try
    try
      ListaEstudantes:=TObjectList<TEstudante>.Create;
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * FROM public.estudantes';
      Query.Open(Query.SQL.Text);
      while (Not Query.Eof) do begin
        Estudante:=TEstudante.Create(self.connection);
        Estudante.setId(Query.FieldByName('id').AsInteger);
        Estudante.setNome(Query.FieldByName('nome').AsString);
        ListaEstudantes.Add(Estudante);
        Query.Next;
      end;
      Result:=ListaEstudantes;
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

function TEstudanteController.QuantidadeEstudantes: integer;
var Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select count(*) as quantidade from estudantes';
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

end.
