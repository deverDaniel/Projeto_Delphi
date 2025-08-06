unit uTurmaController;

interface
uses
  uTurmas, FireDAC.Comp.Client, System.SysUtils;

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

function TTurmaController.SelectTurmaPorId(id: Integer): TTurma;
begin
  FTurma:= TTurma.Create(connection);
  FTurma.setId(id);
  FTurma.SelectTurmaporid;
  result:= FTurma;
end;

end.
