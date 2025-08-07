unit uMatriculaController;
interface
uses
  uMatricula, FireDAC.Comp.Client, System.SysUtils, system.Generics.Collections;

  type TMatriculaController = class
  private
    FMatricula: TMatricula;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarMatricula(id_turma, id_estudante: integer);
    Function SelectMatriculaPorId(id: Integer):TMatricula;
    procedure AlterarMatricula(id, id_turma, id_estudante: integer);
    procedure DeletarMatricula(id: Integer);
    function ListarMatriculas: TObjectList<TMatricula>;
  end;


implementation

{ TDisciplinaController }

procedure TMatriculaController.AdicionarMatricula(id_turma, id_estudante: integer);
begin
  FMatricula.setIdTurma(id_turma);
  FMatricula.setIdEstudante(id_estudante);
  FMatricula.Adicionar;
end;

procedure TMatriculaController.AlterarMatricula(id, id_turma, id_estudante: integer);
begin
  FMatricula := TMatricula.Create(connection);
  FMatricula.setId(id);
  FMatricula.setIdTurma(id_turma);
  FMatricula.setIdEstudante(id_estudante);
  FMatricula.Alterar;
end;

constructor TMatriculaController.Create(connection: TFDConnection);
begin
   FMatricula:= TMatricula.Create(connection);
   self.connection:= connection;
end;



procedure TMatriculaController.DeletarMatricula(id:Integer);
begin
  FMatricula:= TMatricula.Create(connection);
  FMatricula.setId(id);
  FMatricula.Deletar;
end;

function TMatriculaController.ListarMatriculas: TObjectList<TMatricula>;
var Query: TFDQuery;
    matricula:TMatricula;
    Listamatriculas:TObjectList<TMatricula>;
begin
  try
    try
      Listamatriculas:= TObjectList<TMatricula>.Create;
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * FROM public.Matriculas';
      Query.Open(Query.SQL.Text);
      while (Not Query.Eof) do begin
        matricula:=TMatricula.Create(self.connection);
        matricula.setId(Query.FieldByName('id').AsInteger);
        matricula.setIdTurma(Query.FieldByName('id_turma').AsInteger);
        matricula.setIdEstudante(Query.FieldByName('id_estudante').AsInteger);
        Listamatriculas.Add(matricula);
        Query.Next;
      end;
      Result:=Listamatriculas;
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

function TMatriculaController.SelectMatriculaPorId(id: Integer): TMatricula;
begin
  FMatricula:= TMatricula.Create(connection);
  FMatricula.setId(id);
  FMatricula.SelectTurmaporid;
  result:= FMatricula;
end;

end.
