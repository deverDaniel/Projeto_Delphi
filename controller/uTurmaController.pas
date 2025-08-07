unit uTurmaController;

interface
uses
  uTurmas, FireDAC.Comp.Client, System.SysUtils, System.Generics.Collections;

  type TTurmaController = class
  private
    FTurma: TTurma;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarTurma(id_professor, id_disciplina: integer);
    Function SelectTurmaPorId(id: Integer):TTurma;
    procedure AlterarTurma(id, id_professor, id_disciplina: integer);
    procedure DeletarTurma(id: Integer);
    function ListarTurmas: TObjectList<TTurma>;
  end;


implementation

{ TDisciplinaController }

procedure TTurmaController.AdicionarTurma(id_professor, id_disciplina: integer);
begin
  FTurma.setIdProfessor(id_professor);
  FTurma.setIdDisciplina(id_disciplina);
  FTurma.Adicionar;
end;

procedure TTurmaController.AlterarTurma(id, id_professor, id_disciplina: integer);
begin
  FTurma := TTurma.Create(connection);
  Fturma.setId(id);
  FTurma.setIdProfessor(id_professor);
  FTurma.setIdDisciplina(id_disciplina);
  FTurma.Alterar;
end;

constructor TTurmaController.Create(connection: TFDConnection);
begin
   FTurma:= TTurma.Create(connection);
   self.connection:= connection;
end;



procedure TTurmaController.DeletarTurma(id:Integer);
begin
  FTurma:= TTurma.Create(connection);
  FTurma.setId(id);
  FTurma.Deletar;
end;

function TTurmaController.ListarTurmas: TObjectList<TTurma>;
var Query: TFDQuery;
    turma:TTurma;
    Listaturmas:TObjectList<TTurma>;
begin
  try
    try
      Listaturmas:= TObjectList<TTurma>.Create;
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * FROM public.turmas';
      Query.Open(Query.SQL.Text);
      while (Not Query.Eof) do begin
        turma:=TTurma.Create(self.connection);
        turma.setId(Query.FieldByName('id').AsInteger);
        turma.setIdProfessor(Query.FieldByName('id_professor').AsInteger);
        turma.setIdDisciplina(Query.FieldByName('id_disciplina').AsInteger);
        Listaturmas.Add(turma);
        Query.Next;
      end;
      Result:=Listaturmas;
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

function TTurmaController.SelectTurmaPorId(id: Integer): TTurma;
begin
  FTurma:= TTurma.Create(connection);
  FTurma.setId(id);
  FTurma.SelectTurmaporid;
  result:= FTurma;
end;

end.
